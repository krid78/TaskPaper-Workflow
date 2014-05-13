#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8
"""
Package       :  taskpaperdaily
Author(s)     :  Daniel Kriesten
Email         :  daniel.kriesten@etit.tu-chemnitz.de
Creation Date :  Di 13 Mai 21:29:00 2014

A script to filter taskpaper files for actual tasks
"""

import sys
import codecs
import argparse
import datetime as dt
import logging
__logger__ = logging.getLogger(__name__)
import logging.handlers

__FILES__ = [
    "/Users/krid/Dropbox/_Notes/00-Inbox.taskpaper",
    "/Users/krid/Dropbox/_Notes/10-Work.taskpaper",
    "/Users/krid/Dropbox/_Notes/20-Home.taskpaper",
    "/Users/krid/Dropbox/_Notes/30-doing.taskpaper",
    "/Users/krid/Dropbox/_Notes/40-Studenten.taskpaper",
    "/Users/krid/Dropbox/_Notes/50-Geschenke.taskpaper",
    "/Users/krid/Dropbox/_Notes/99-HowToOrganizeTaskPaper.taskpaper",
]

# we only need flat colors 30 .. 37
# bold is <color>;1, eg 30;1
# and con bg means 4x
class tColor:
    """colored text"""
    BLACK    = "\x1b[30m"
    RED      = "\x1b[31m"
    GREEN    = "\x1b[32m"
    YELLOW   = "\x1b[33m"
    BLUE     = "\x1b[34m"
    MAGENTA  = "\x1b[35m"
    CYAN     = "\x1b[36m"
    WHITE    = "\x1b[37m"
    bBLACK   = "\x1b[30;1m"
    bRED     = "\x1b[31;1m"
    bGREEN   = "\x1b[32;1m"
    bYELLOW  = "\x1b[33;1m"
    bBLUE    = "\x1b[34;1m"
    bMAGENTA = "\x1b[35;1m"
    bCYAN    = "\x1b[36;1m"
    bWHITE   = "\x1b[37;1m"
    NONE     = "\x1b[0m"

class bgColor:
    """colored background"""
    BLACK    = "\x1b[40m"
    RED      = "\x1b[41m"
    GREEN    = "\x1b[42m"
    YELLOW   = "\x1b[43m"
    BLUE     = "\x1b[44m"
    MAGENTA  = "\x1b[45m"
    CYAN     = "\x1b[46m"
    WHITE    = "\x1b[47m"
    bBLACK   = "\x1b[40;1m"
    bRED     = "\x1b[41;1m"
    bGREEN   = "\x1b[42;1m"
    bYELLOW  = "\x1b[43;1m"
    bBLUE    = "\x1b[44;1m"
    bMAGENTA = "\x1b[45;1m"
    bCYAN    = "\x1b[46;1m"
    bWHITE   = "\x1b[47;1m"
    NONE     = "\x1b[0m"

def handle_file(file_, thisday, overdue, today, upcomming, outdated):
    """handle one file"""
    with codecs.open(file_, "r", 'utf8') as myfile:
        contents = myfile.readlines()

    __logger__.debug("Read %s", file_)

    if contents == '':
        return 0

def print_lists(overdue, today, upcomming, outdated):

    if len(today) > 0:
        sys.stdout.write("%sTODAY%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))

    if len(overdue) > 0:
        sys.stdout.write("%sOVERDUE%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))

    if len(upcomming) > 0:
        sys.stdout.write("%sUPCOMING%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))

    if len(outdated) > 0:
        sys.stdout.write("%sOUTDATED%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))

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
    thisday = dt.datetime.now()

    __logger__.info("Run for %s", thisday)

    overdue   = ["1"]
    today     = ["2"]
    upcomming = ["3"]
    outdated  = ["4"]

    ###########################
    # cycle through all files
    for thefile in __FILES__:
        handle_file(thefile, thisday, overdue, today, upcomming, outdated)

    print_lists(overdue, today, upcomming, outdated)

    __logger__.info("End Run for %s", thisday)

if __name__ == '__main__':
    main()
