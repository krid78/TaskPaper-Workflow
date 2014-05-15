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

# TODO there is a bog in the parser, which handles sinle word projects incorrect
import tp_light_parse_022 as tplp

__FILES__ = [
    "/Users/krid/Dropbox/_Notes/00-Inbox.taskpaper",
    "/Users/krid/Dropbox/_Notes/10-Work.taskpaper",
    "/Users/krid/Dropbox/_Notes/20-Home.taskpaper",
#   "/Users/krid/Dropbox/_Notes/30-doing.taskpaper",
    "/Users/krid/Dropbox/_Notes/40-Studenten.taskpaper",
    "/Users/krid/Dropbox/_Notes/50-Geschenke.taskpaper",
#   "/Users/krid/Dropbox/_Notes/99-HowToOrganizeTaskPaper.taskpaper",
]

# flat colors 30 .. 37
# bold is <color>;1, eg 30;1
# and bg means 4x
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

def handle_project(project, thisday, print_list):
    __logger__.warn("Not implemented, yet")
    return print_list

def handle_task(project, task, thisday, print_list):
    """sort the task into tasklist,
    depending on its flags"""
    assert task['type'] == 'task'
    #TODO handle things like @mail and @error
    __logger__.debug(u"[%s] %s", project, task['text'])
    for key in task['tags'].keys():
        __logger__.debug(u"\tkey: %s",key)
    if task['tags'].has_key('today'):
        __logger__.debug(u"today:\t[%s] %s", project, task['text'][:40])
        print_list['today'].append(u"%s»%s [%s] %s"      % (tColor.GREEN,   tColor.NONE, project, task['text'][:40]))
    elif task['tags'].has_key('tomorrow'):
        __logger__.debug(u"tomorrow:\t[%s] %s", project, task['text'][:40])
        print_list['tomorrow'].append(u"%s»%s [%s] %s"   % (tColor.CYAN,    tColor.NONE, project, task['text'][:40]))
    elif task['tags'].has_key('overdue'):
        __logger__.debug(u"overdue:\t[%s] %s", project, task['text'][:40])
        print_list['overdue'].append(u"%s»%s [%s] %s"    % (tColor.RED,     tColor.NONE, project, task['text'][:40]))
    elif task['tags'].has_key('upcommming'):
        __logger__.debug(u"upcommming:\t[%s] %s", project, task['text'][:40])
        print_list['upcommming'].append(u"%s»%s [%s] %s" % (tColor.NONE,    tColor.NONE, project, task['text'][:40]))
    elif task['tags'].has_key('urgent'):
        __logger__.debug(u"urgent:\t[%s] %s", project, task['text'][:40])
        print_list['urgent'].append(u"%s»%s [%s] %s"     % (tColor.MAGENTA, tColor.NONE, project, task['text'][:40]))
    elif task['tags'].has_key('created'):
        __logger__.debug(u"created\t[%s] %s", project, task['text'][:40])
        print_list['outdated'].append(u"%s»%s [%s] %s"   % (tColor.BLUE,    tColor.NONE, project, task['text'][:40]))
    #elif task['tags'].has_key('due'):
        #__logger__.debug("%s", task['tags']['due'])

    return print_list


def handle_file(file_, thisday, print_list):
    """handle one file"""

    contents = ""

    # first read in file stripping empty lines
    with codecs.open(file_, "r", 'utf8') as myfile:
        contents = myfile.read()

    # stop here if file is empty
    if contents == '':
        return 0

    __logger__.debug("Read %s", file_)

    tpc = tplp.get_tp_parse(contents)

    for item in tpc:
        if item['type'] == 'project':
            for task in item['chiln']:
                if tpc[task]['type'] == 'task':
                    print_list = handle_task(item['text'], tpc[task], thisday, print_list)
                else:
                    __logger__.debug("%s in [%s]: %s", tpc[task]['type'], item['text'], tpc[task]['text'])

    return print_list

def print_list_items(list):
    """print the items of a list"""
    for item in list:
        sys.stdout.write("%s\n" % (item.encode('utf-8')))

def print_lists(print_list):
    """print the lists"""

    if len(print_list['today']) > 0:
        sys.stdout.write(u"%sTODAY%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))
        print_list_items(print_list['today'])

    if len(print_list['tomorrow']) > 0:
        sys.stdout.write("\n")
        sys.stdout.write(u"%sTOMORROW%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))
        print_list_items(print_list['tomorrow'])

    if len(print_list['overdue']) > 0:
        sys.stdout.write("\n")
        sys.stdout.write(u"%sOVERDUE%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))
        print_list_items(print_list['overdue'])

    if len(print_list['urgent']) > 0:
        sys.stdout.write("\n")
        sys.stdout.write(u"%sURGENT%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))
        print_list_items(print_list['urgent'])

    if len(print_list['upcomming']) > 0:
        sys.stdout.write("\n")
        sys.stdout.write(u"%sUPCOMING%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))
        print_list_items(print_list['upcomming'])

    if len(print_list['outdated']) > 0:
        sys.stdout.write("\n")
        sys.stdout.write(u"%sOUTDATED%s\n--------------------\n" % (tColor.bWHITE, tColor.NONE))
        print_list_items(print_list['outdated'])

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

    ###########################
    # initialize list of tasks
    print_list = {
        'today'     : [],
        'tomorrow'  : [],
        'overdue'   : [],
        'upcomming' : [],
        'urgent'    : [],
        'outdated'  : [],
    }

    ###########################
    # cycle through all files
    for thefile in __FILES__:
        print_list = handle_file(thefile, thisday, print_list)

    print_lists(print_list)

    __logger__.info("End Run for %s", thisday)

if __name__ == '__main__':
    main()
