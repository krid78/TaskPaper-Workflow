#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8


"""
Package       :  taskpaperdaily
Author(s)     :  Daniel Kriesten
Email         :  daniel.kriesten@etit.tu-chemnitz.de
Creation Date :  Di  6 Mai 18:27:28 2014
"""

import sys, os
import codecs
import argparse
import logging
__logger__ = logging.getLogger(__name__)
import logging.handlers
import datetime as dt
import re
import runcommand as rc

__FILES__ = [
    "/Users/krid/Dropbox/_Notes/00-Inbox.taskpaper",
    "/Users/krid/Dropbox/_Notes/10-Work.taskpaper",
    "/Users/krid/Dropbox/_Notes/20-Home.taskpaper",
#   "/Users/krid/Dropbox/_Notes/30-doing.taskpaper",
    "/Users/krid/Dropbox/_Notes/40-Studenten.taskpaper",
    "/Users/krid/Dropbox/_Notes/50-Geschenke.taskpaper",
#   "/Users/krid/Dropbox/_Notes/99-HowToOrganizeTaskPaper.taskpaper",
]

__WEEKDAYS__ = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
__REGEX_WEEKNUMBERS__ = r'@due\(kw([1-9]|[0-4][0-9]|5[0-3])\)'
__REGEX_DUE_DATES__ = r'@due\((\d{4})-(0[1-9]|1[0-2])-([0-2][0-9]|3[0-1])\)'

def calc_times(today):
    """calculate some day and time values"""
    tomorrow = today + dt.timedelta(days=1)
    thisweek = today.isocalendar()[1]
    # and now an array of the dates of the week, relative to today
    weekdays = {}
    for day in range(today.weekday(), 8):
        wday = today.date() + dt.timedelta(days=day)
        weekdays[dt.date.weekday(wday)] = wday

    __logger__.debug("tomorrow %s, thisweek %s", tomorrow, thisweek)
    __logger__.debug(weekdays)

    return tomorrow, thisweek, weekdays

def clear_relatives(line):
    """remove @today, @tomorrow, @overdue"""
    line = line.replace(" @today", "")
    line = line.replace(" @tomorrow", "")
    line = line.replace(" @overdue", "")
    # TODO tjis is a hack
    line = line.replace(" @error(Unknown value for due tag)", "")
    return line

def change_dates(line, thedate, today, tomorrow):
    """change the dates within a line"""
    if thedate == today.date():
        line += " @today"
    elif thedate == tomorrow.date():
        line += " @tomorrow"
    elif thedate < today.date():
        line += " @overdue"

    return line

def handle_week(line, today, tomorrow, week, thisweek):
    """check the week number"""
    tomorrow_week = tomorrow.isocalendar()[1]
    __logger__.debug("Week of tomorrow: %d", tomorrow_week)
    if week == thisweek:
        line += " @today"
    elif thisweek > week:
        line += " @overdue"
    elif thisweek+1 == tomorrow_week:
        line += " @tomorrow"

    return line

def handle_file(file_, today):
    """handle one file"""
    with codecs.open(file_, "r", 'utf8') as myfile:
        contents = myfile.readlines()

    if contents == '':
        return 0

    tomorrow, thisweek, weekdays = calc_times(today)
    regex_due  = re.compile(__REGEX_DUE_DATES__)
    regex_week = re.compile(__REGEX_WEEKNUMBERS__)

    if contents[0].startswith("Last run at"):
        firstline = 1
    else:
        firstline = 0

    __logger__.debug("firstline %d", firstline)

    output = "Last run at %s\n" % (today.strftime("%a, %Y-%m-%d %H:%M"))

    for line in contents[firstline:]:
        if line.startswith("\n"):
            continue
        #remove current line break
        line = line.rstrip()
        #add linebrake to last line
        output += "\n"

        # if the project is done, remove relative dates
        if '@done' in line:
            output += clear_relatives(line)
            continue

        # if we have a due, we will recalculate the relative date form it
        # so we can in any case remove the relatives for now
        if '@due' in line:
            line = clear_relatives(line)
        else:
            line = line.replace("@today", "@due(%s)" % (today.date()))
            line = line.replace("@tomorrow", "@due(%s)" % (tomorrow.date()))

        # now recalculate relatives
        due_match = regex_due.search(line)
        if due_match != None:
            thedate = dt.date(year=int(due_match.group(1)),
                              month=int(due_match.group(2)),
                              day=int(due_match.group(3)))
            __logger__.debug("Found date: %s", thedate)
            line = change_dates(line, thedate, today, tomorrow)

        # and the calendar weeks
        week_match = regex_week.search(line)
        if week_match != None:
            week = int(week_match.group(1))
            __logger__.debug("Found week: %d", week)
            line = handle_week(line, today, tomorrow, week, thisweek)

        output += line

    output += "\n"

    with codecs.open(file_, "w", 'utf8') as myfile:
        myfile.write(output)
    #sys.stdout.write(output)

def main():
    """the working cow"""

    # some arguments to care fore
    parser = argparse.ArgumentParser(
        description=u"Convert relative to absolute dates in TaskPaper",
        epilog=u"Tested with TaskPaper v2",
        conflict_handler="resolve")
    parser.add_argument("--version", action="version", version="%(prog)s 0.1")
    parser.add_argument("-v",
                        "--verbose",
                        default=False,
                        action="store_true",
                        help="be verbose"
                       )
    parser.add_argument("-d",
                        "--debug",
                        default=False,
                        action="store_true",
                        help="do debugging to stderr")
    parser.add_argument("-a",
                        "--applescriptbase",
                        default=".",
                        help="the base path for the apple scripts")

    (options, args) = parser.parse_known_args()

    ######################
    # instantiate a logger
    logger = logging.getLogger()
    logger.setLevel(logging.DEBUG)
    handler = logging.StreamHandler(stream=sys.stderr)

    if options.debug:
        handler.setLevel(logging.DEBUG)
    elif options.verbose:
        handler.setLevel(logging.INFO)
    else:
        handler.setLevel(logging.WARNING)

    handler.setFormatter(logging.Formatter("-- %(funcName)s [%(levelname)s]: %(message)s"))
    logger.addHandler(handler)

    ###########################
    # get current date and time
    today = dt.datetime.now() #datetime.datetime(2014, 5, 6, 22, 3, 24, 960222)
    #today = dt.date.today()  #datetime.date(2014, 5, 6)

    __logger__.info("Run for %s", today)

    ###########################
    # cycle through all files
    #TODO list as argument
    for thefile in __FILES__:
        cmd = rc.RunCommand(["osascript", options.applescriptbase + "/GetNamesOfOpenDocuments.scpt", os.path.basename(thefile)])
        cmdres = cmd.run()
        __logger__.debug("Result: %s", cmdres)
        if cmdres == None:
            __logger__.info("cdmres of %s is None", cmd)
        elif len(cmdres) > 0 and cmdres[0] == "false":
            handle_file(thefile, today)
        elif len(cmdres) > 0 and cmdres[0] == "true":
            __logger__.info("File %s is currently opened in TP" % (os.path.basename(thefile)))
            cmd = rc.RunCommand(["osascript", options.applescriptbase + "/ParseDueDates.scpt", os.path.basename(thefile)])
            cmdres = cmd.run()
        else:
            __logger__.info("Could not handle result %s of %s", cmdres, cmd)

    __logger__.info("End Run for %s", today)

if __name__ == '__main__':
    main()