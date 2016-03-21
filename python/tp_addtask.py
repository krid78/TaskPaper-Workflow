#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

"""
Package       :  tp_addtask
Author(s)     :  Daniel Kriesten
Email         :  daniel.kriesten@etit.tu-chemnitz.de
Creation Date :  So 20 Mär 22:07:50 2016

Add new task to taskpaper.
Either to a default file/project or to a selected one.
This selection is based on the input string.

Add new entry <text> to  [:p project] [#f filename]

Add new entry <text>
Add new entry <text> @done
Add new entry <text> to @done :p project
Add new entry <text> to #f filename
Add new entry <text> to :p project #f filename

add a new: text

"""

import os
import sys
import codecs
import argparse
import logging
import logging.handlers
import datetime as dt
import runcommand as rc

__logger__ = logging.getLogger(__name__)

class OneLine(object):
    """keeps information of that one line"""

    def __init__(self, text):
        """Constructor, handling that one line of text
        :text: string
        """
        self._tp_task = None
        self._tp_project = 'Inbox'
        self._tp_file = 'inbox'
        self._handle_text(text)

    def _handle_text(self, text):
        """handle a text object to seperate the single parts"""
        assert text != None
        tline = text.split(' #f ')
        if len(tline) > 1:
            self._tp_file = tline[1]

        tline = tline[0].split(' :p ')
        if len(tline) > 1:
            self._tp_project = tline[1]

        self._tp_task = tline[0]

    def __str__(self):
        """pretty print the task-line
        """
        ret = ""
        if self._tp_task:
            ret += "Task       : \'%s\'" % (self._tp_task)
        if self._tp_project:
            ret += "\nFor project: \'%s\'" % (self._tp_project)
        if self._tp_file:
            ret += "\nFor file   : \'%s\'" % (self._tp_file)
        return ret

    ####################
    # getter/setter
    @property
    def task(self):
        """return the task text
        :returns: string
        """
        if self.task:
            return self._tp_task

        return ""

    @property
    def project(self):
        """return target project
        :returns: string
        """
        return self._tp_project

    @property
    def file(self):
        """return name of desired target file
        !that one is completely unchecked!
        :returns: string
        """
        return self._tp_file

def main():
    """the working cow"""

    # some arguments to care fore
    parser = argparse.ArgumentParser(
        description=u"Add a new task to taskpaper file",
        epilog=u"Add new entry <text> to  [:p project] [#f filename]",
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
    parser.add_argument("-t",
                        "--taskfolder",
                        default=".",
                        help="the base path for the taskpaper files")
    parser.add_argument("text", nargs=1, help="text to add")

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

    taskfolder = os.path.abspath(options.taskfolder.rstrip(os.path.sep))
    if not os.path.exists(taskfolder):
        logger.error("%s does not exist!", taskfolder)
        return
    elif not os.path.isdir(taskfolder):
        logger.error("%s is not a directory!", taskfolder)
        return

    logger.debug("taskfolder: %s", taskfolder)

    ###########################
    # get current date and time
    today = dt.datetime.now()

    logger.info("Run for %s", today)

    ###########################
    # cycle through all files
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", scriptbase + "/TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    if cmdres is None:
        logger.info("cdmres of %s is None", cmd)
    elif len(cmdres) > 0:
        logger.info("cmdres of %s is %s", cmd, cmdres)
    else:
        logger.info("Could not handle result %s of %s", cmdres, cmd)

    logger.debug("Text to handle: %s", options.text[0])
    task = OneLine(options.text[0])
    logger.info("-- Result -- \n%s", task)

    logger.info("End Run for %s", today)

if __name__ == '__main__':
    main()

