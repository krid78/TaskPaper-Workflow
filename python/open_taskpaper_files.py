#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

"""
Package       :  taskpaperdaily
Author(s)     :  Daniel Kriesten
Email         :  daniel@die-kriestens.de
Creation Date :  Di  6 Mai 18:27:28 2014

A script to open taskpaper files
"""

import sys
import argparse
import logging
__logger__ = logging.getLogger(__name__)
import logging.handlers
import runcommand
import feedback

__TP_BASEDIR__ = "/Users/krid/Dropbox/_Notes"
__TP_EXTENSION__ = "taskpaper"

def find_files(basedir, extension, filter=""):
    """create a list of tp files"""
    command = ["mdfind", "-onlyin", basedir, "kMDItemFSName==*." + extension]
    __logger__.debug(command)
    filter = basedir + "/" + filter
    __logger__.debug("Filter: %s", filter)
    # simple call to run a system process
    cmd = runcommand.RunCommand(command)
    file_list = cmd.run()
    atree = feedback.Feedback()
    if file_list != None:
        __logger__.debug(file_list)
        for file_ in sorted(file_list):
            if file_.startswith(filter):
                atree.add_item(file_, subtitle="Open " + file_ + "in TaskPaper", arg=file_)
    __logger__.info(atree)
    alfred_xml = repr(atree)
    return alfred_xml

def main():
    """the main programm"""
    # some arguments to care fore
    parser = argparse.ArgumentParser(
        description=u"View a list of TaskPaper files in Alfred xml Format",
        epilog=u"Tested with TaskPaper v2 and Alfred v2",
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
    parser.add_argument("-b",
                        "--basedir",
                        default=__TP_BASEDIR__,
                        help="the basedir to start searching")
    parser.add_argument("-e",
                        "--extension",
                        default=__TP_EXTENSION__,
                        help="default file extension")
    parser.add_argument("-f",
                        "--filter",
                        default="",
                        help="filter results")
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

    # run the working task
    ret = find_files(options.basedir.replace(" ", "\ "), options.extension, options.filter)
    if ret != None:
        sys.stdout.write(ret)

if __name__ == "__main__":
    main()
