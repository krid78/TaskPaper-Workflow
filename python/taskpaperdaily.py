#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab

"""
Package       :  taskpaperdaily
Author(s)     :  Daniel Kriesten
Email         :  daniel.kriesten@etit.tu-chemnitz.de
Creation Date :  Sa 30 Aug 23:17:07 2014

A script to filter taskpaper files for actual tasks

"""

import sys
import codecs
import json
import argparse
import datetime as dt
import logging
__logger__ = logging.getLogger(__name__)
import logging.handlers

#FIXME there seems to be a bug in the parser, which handles single word projects incorrect
import tp_light_parse_022 as tplp

__FILES__ = [
    "/Users/krid/CloudStation/_Tasks/inbox.taskpaper",
    "/Users/krid/CloudStation/_Tasks/privat.taskpaper",
    "/Users/krid/CloudStation/_Tasks/tuc.taskpaper",
    "/Users/krid/CloudStation/_Tasks/students.taskpaper",
    "/Users/krid/CloudStation/_Tasks/set.taskpaper",
    "/Users/krid/CloudStation/_Tasks/doing.taskpaper",
    "/Users/krid/CloudStation/_Tasks/geschenke.taskpaper",
    "/Users/krid/CloudStation/_Tasks/someday.taskpaper",
    # "/Users/krid/CloudStation/_Tasks/HowToOrganizeTaskPaper.taskpaper",
]

class PrintTP(object):
    """ This class handles taskpaper files and extracts several events"""
    def __init__(self, today):
        """
        anlegen der listen
        """
        self._tpc = None
        self.print_all = False
        self.today = today
        self.lists = {
            'today'     : [],
            'tomorrow'  : [],
            'overdue'   : [],
            'upcomming' : [],
            'urgent'    : [],
            'outdated'  : [],
            'someday'   : [],
        }

    def _handle_task(self, project, task):
        """
        geht rekursiv durch alle kinder
        """
        __logger__.debug(u"[%s] %s", project, task['text'])
        for key in task['tags'].keys():
            __logger__.debug(u"\tkey: %s", key)
        if task['tags'].has_key('today'):
            __logger__.debug(u"today:\t[%s] %s", project, task['text'][:40])
            self.lists['today'].append(u"[%s] %s" % (project, task['text'][:40]))
        elif task['tags'].has_key('tomorrow'):
            __logger__.debug(u"tomorrow:\t[%s] %s", project, task['text'][:40])
            self.lists['tomorrow'].append(u"[%s] %s" % (project, task['text'][:40]))
        elif task['tags'].has_key('overdue'):
            __logger__.debug(u"overdue:\t[%s] %s", project, task['text'][:40])
            self.lists['overdue'].append(u"[%s] %s" % (project, task['text'][:40]))
        elif task['tags'].has_key('upcommming'):
            __logger__.debug(u"upcommming:\t[%s] %s", project, task['text'][:40])
            self.lists['upcommming'].append(u"[%s] %s" % (project, task['text'][:40]))
        elif task['tags'].has_key('urgent'):
            __logger__.debug(u"urgent:\t[%s] %s", project, task['text'][:40])
            self.lists['urgent'].append(u"[%s] %s" % (project, task['text'][:40]))
        elif task['tags'].has_key('someday'):
            __logger__.debug(u"someday:\t[%s] %s", project, task['text'][:40])
            self.lists['someday'].append(u"[%s] %s" % (project, task['text'][:40]))
        elif task['tags'].has_key('created'):
            __logger__.debug(u"created\t[%s] %s", project, task['text'][:40])
            created = task['tags']['created'].split('-')
            cdate = dt.date(year=int(created[0]),
                            month=int(created[1]),
                            day=int(created[2]))
            if (self.today.date()-cdate) > dt.timedelta(days=365):
                self.lists['outdated'].append(u"[%s] %s" % (project, task['text'][:40]))
        #elif task['tags'].has_key('due'):
            #__logger__.debug("%s", task['tags']['due'])

    def _handle_items(self):
        """
        ruft ggf. handle_task
        """

        #go over each item ...
        for item in self._tpc:
            if item['type'] == 'project':
                self._handle_task(item['text'], item)

            elif item['type'] == 'task':
                self._handle_task(self._tpc[item['parentID']]['text'], item)
            else:
                __logger__.debug("did not handle %s: %s", item['type'], item['text'][:20])

    def handle_tp_list(self, tp_file):
        """
        ruft den tp_light_parse_022
        ruft dann _handle_item
        """
        contents = ""

        # first read in file stripping empty lines
        with codecs.open(tp_file, "r", 'utf8') as myfile:
            contents = myfile.read()

        # stop here if file is empty
        if contents == '':
            return 0

        __logger__.debug("Read %s", tp_file)

        self._tpc = tplp.get_tp_parse(contents)
        self._handle_items()

    def _print_list_items(self, list_, count_max=3):
        """print the items of a list"""
        liststring = u""
        count = 0
        for item in list_:
            liststring += u"%s\n" % (item)
            count += 1
            if (count >= count_max) and (self.print_all == False):
                break
        return liststring

    def __str__(self):
        """ print out the lists """
        thestring = ""
        if len(self.lists['today']) > 0:
            thestring += u"TODAY\n--------------------\n"
            thestring += self._print_list_items(self.lists['today'], 5)

        if len(self.lists['tomorrow']) > 0:
            thestring += "\n"
            thestring += u"TOMORROW\n--------------------\n"
            thestring += self._print_list_items(self.lists['tomorrow'])

        if len(self.lists['overdue']) > 0:
            thestring += "\n"
            thestring += u"OVERDUE\n--------------------\n"
            thestring += self._print_list_items(self.lists['overdue'], 5)

        if len(self.lists['urgent']) > 0:
            thestring += "\n"
            thestring += u"URGENT\n--------------------\n"
            thestring += self._print_list_items(self.lists['urgent'])

        if len(self.lists['upcomming']) > 0:
            thestring += "\n"
            thestring += u"UPCOMING\n--------------------\n"
            thestring += self._print_list_items(self.lists['upcomming'])

        if len(self.lists['outdated']) > 0:
            thestring += "\n"
            thestring += u"OUTDATED\n--------------------\n"
            thestring += self._print_list_items(self.lists['outdated'])

        if len(self.lists['someday']) > 0:
            thestring += "\n"
            thestring += u"SOMEDAY\n--------------------\n"
            thestring += self._print_list_items(self.lists['someday'])

        return thestring.encode('utf-8')

    def get_json_str(self):
        """return the parsed result as JSON"""
        __logger__.info("dump as JSON, print_all: %s", str(self.print_all))
        if self.print_all:
            return json.dumps(self.lists)
            #return json.dumps({"tasks": self.lists})
        else:
            return json.dumps(self.lists.keys())

def main():
    """the working cow"""

    # some arguments to care fore
    parser = argparse.ArgumentParser(
        description=u"Print TaskPaper Tasks sorted by some date-dependent rules",
        epilog=u"Tested with TaskPaper v2",
        conflict_handler="resolve")
    parser.add_argument("--version", action="version", version="%(prog)s 0.1")
    parser.add_argument("-v",
                        "--verbose",
                        default=False,
                        action="store_true",
                        help="be verbose")
    parser.add_argument("-d",
                        "--debug",
                        default=False,
                        action="store_true",
                        help="do debugging to stderr")
    parser.add_argument("-a",
                        "--all",
                        default=False,
                        action="store_true",
                        help="print all items")
    parser.add_argument("-j",
                        "--json",
                        default=False,
                        action="store_true",
                        help="output the list in JSON format")

    (options, args) = parser.parse_known_args()
    __logger__.debug("Args: %s", args)

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
    ptp = PrintTP(thisday)

    if options.all or options.debug:
        ptp.print_all = True

    ###########################
    # cycle through all files
    for thefile in __FILES__:
        ptp.handle_tp_list(thefile)

    __logger__.info(ptp)

    if options.json:
        sys.stdout.write(ptp.get_json_str())

    __logger__.info("End run for %s", thisday)

if __name__ == '__main__':
    main()
