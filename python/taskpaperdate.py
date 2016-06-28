#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab


"""
Package       :  taskpaperdaily
Author(s)     :  Daniel Kriesten
Email         :  daniel.kriesten@etit.tu-chemnitz.de
Creation Date :  Di  6 Mai 18:27:28 2014
"""

import sys
import os
import codecs
import argparse
import logging
import logging.handlers
import datetime as dt
import re
import runcommand as rc

__logger__ = logging.getLogger(__name__)

__FILES__ = [
    "/Users/krid/CloudStation/_Tasks/doing.taskpaper",
    "/Users/krid/CloudStation/_Tasks/geschenke.taskpaper",
    "/Users/krid/CloudStation/_Tasks/inbox.taskpaper",
    "/Users/krid/CloudStation/_Tasks/privat.taskpaper",
    "/Users/krid/CloudStation/_Tasks/someday.taskpaper",
    "/Users/krid/CloudStation/_Tasks/students.taskpaper",
    "/Users/krid/CloudStation/_Tasks/work.taskpaper",
    # "/Users/krid/CloudStation/_Tasks/HowToOrganizeTaskPaper.taskpaper",
]

__WEEKDAYS__ = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
__REGEX_WEEKNUMBERS__ = r'@due\(kw([1-9]|[0-4][0-9]|5[0-3])\)'
__REGEX_DUE_DATES__ = r'@due\((\d{4})-(0[1-9]|1[0-2])-([0-2][0-9]|3[0-1])\)'
__REGEX_REMINDERS__ = r'@remind\(((?:\d{4})-(?:0[1-9]|1[0-2])-(?:[0-2][0-9]|3[0-1]))\s*((?:[0-1][0-9]|2[0-4]):(?:[0-5][0-9]))*\)'

def calc_times(today):
    """calculate some day and time values"""
    tomorrow = today + dt.timedelta(days=1)
    thisweek = today.isocalendar()[1]
    # and now an array of the dates of the week, relative to today
    weekdays = {}
    for day in range(today.weekday(), 8):
        wday = today.date() + dt.timedelta(days=day)
        weekdays[dt.date.weekday(wday)] = wday

    __logger__.debug("tomorrow %s, thisweek KW%s", tomorrow, thisweek)
    __logger__.debug(weekdays)

    return tomorrow, thisweek, weekdays

def clear_relatives(line):
    """remove @today, @tomorrow, @overdue"""
    line = line.replace(" @today", "")
    line = line.replace(" @tomorrow", "")
    line = line.replace(" @overdue", "")
    # TODO this is a hack
    line = line.replace(" @error(Unknown value for due tag)", "")
    # __logger__.debug("Cleared: %s", line)
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

def handle_week(line, tomorrow, week, thisweek):
    """check the week number"""
    tomorrow_week = tomorrow.isocalendar()[1]
    __logger__.debug("Week of tomorrow: %d", tomorrow_week)
    if week == thisweek:
        line += " @today"
    elif thisweek > week:
        line += " @overdue"
    elif week+1 == tomorrow_week:
        line += " @tomorrow"

    return line

def handle_reminder(line, date, time, scriptbase):
    """ handle reminder """
    command_list = ["osascript", scriptbase + "/CreateReminder.scpt"]

    begin = 0
    if "- " in line:
        begin = line.find("- ")+2

    end = line.find(" @")
    text = line[begin:end]
    __logger__.debug("Text: %s", text)
    command_list.append("\"%s\"" % (text[:20]))
    command_list.append("\"%s\"" % (text))
    command_list.append("Inbox")
    command_list.append(date)
    if time != None:
        command_list.append(time)

    cmd = rc.RunCommand(command_list)

    __logger__.debug("%s", cmd)

    cmdres = cmd.run()

    if cmdres is None:
        __logger__.warn("None-Result: %s", cmd)
        return line

    return line.replace(" @remind", " @reminded")

def handle_file(file_, today, scriptbase):
    """handle one file"""
    with codecs.open(file_, "r", 'utf8') as myfile:
        contents = myfile.readlines()

    if contents == '':
        return 0

    tomorrow, thisweek, weekdays = calc_times(today)
    regex_due = re.compile(__REGEX_DUE_DATES__)
    regex_week = re.compile(__REGEX_WEEKNUMBERS__)
    regex_reminder = re.compile(__REGEX_REMINDERS__)

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

        # leaf all searches of TP3 untouched
        if '@search' in line:
            __logger__.debug("SearchLine: %s", line)
            output += line
            continue

        # if the project is done, remove relative dates
        if '@done' in line:
            line = line.replace("@urgent", "")
            line = clear_relatives(line)
            __logger__.debug("DoneLine: %s", line)
            output += line
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
            line = handle_week(line, tomorrow, week, thisweek)

        reminder_match = regex_reminder.search(line)
        if reminder_match != None:
            __logger__.debug("Found Reminder: %s", reminder_match.groups())
            date = reminder_match.group(1)
            time = reminder_match.group(2)
            line = handle_reminder(line, date, time, scriptbase)

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
    parser.add_argument("-v", "--verbose",
                        default=False,
                        action="count",
                        help=u"be verbose, repeat to increase level")
    parser.add_argument("-s",
                        "--scriptbase",
                        default=".",
                        help="the base path for the apple scripts")

    (options, args) = parser.parse_known_args()

    ##########
    #python logger zur einfachen Ausgabe von Meldungen
    logger = logging.getLogger()
    logger.setLevel(logging.DEBUG)

    handler = logging.StreamHandler(stream=sys.stderr)

    ##########
    # logger Level ...
    if options.verbose > 1:
        handler.setLevel(logging.DEBUG)
    elif options.verbose:
        handler.setLevel(logging.INFO)
    else:
        handler.setLevel(logging.WARNING)

    handler.setFormatter(logging.Formatter("-- %(funcName)s [%(levelname)s]: %(message)s"))
    logger.addHandler(handler)

    scriptbase = os.path.abspath(options.scriptbase.rstrip(os.path.sep))
    if not os.path.exists(scriptbase):
        logger.error("%s does not exist!", scriptbase)
        return
    elif not os.path.isdir(scriptbase):
        logger.error("%s is not a directory!", scriptbase)
        return

    logger.debug("ScriptBase: %s", scriptbase)

    ###########################
    # get current date and time
    today = dt.datetime.now() #datetime.datetime(2014, 5, 6, 22, 3, 24, 960222)
    #today = dt.date.today()  #datetime.date(2014, 5, 6)

    __logger__.info("Run for %s", today)

    ###########################
    # cycle through all files
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", scriptbase + "/TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    if cmdres is None:
        __logger__.info("cdmres of %s is None", cmd)
    elif len(cmdres) > 0 and cmdres[0] == "false":
        __logger__.info("cmdres of %s is false", cmd)
    elif len(cmdres) > 0 and cmdres[0] == "true":
        __logger__.info("cmdres of %s is true", cmd)
    else:
        __logger__.info("Could not handle result %s of %s", cmdres, cmd)

    #TODO list as argument
    for thefile in __FILES__:
        __logger__.debug("Result: %s", cmdres)
        handle_file(thefile, today, scriptbase)

    __logger__.info("End Run for %s", today)

if __name__ == '__main__':
    main()
