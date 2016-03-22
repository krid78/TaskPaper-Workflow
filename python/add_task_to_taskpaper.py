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
import taskpaper.taskpaper as tpp

__logger__ = logging.getLogger(__name__)
__SCRIPTBASE__ = '.'
__TASKFOLDER__ = '~/CloudStation/_Tasks'

########################################################################
# classes
########################################################################
class OneLine(object):
    """keeps information of that one line, containing
    <task> :p <project> #f <file>
    """

    def __init__(self, text):
        """Constructor, handling that one line of text
        :text: string
        """
        self._tp_tasktext = None
        self._tp_project = 'Inbox'
        self._tp_file = 'inbox'
        self._handle_text(text)

    def _handle_text(self, text):
        """handle a text object to seperate the single parts"""
        assert text != None
        tline = text.strip().split(' #f ')
        if len(tline) > 1:
            self._tp_file = tline[1]

        tline = tline[0].split(' :p ')
        if len(tline) > 1:
            self._tp_project = tline[1]
            if not self._tp_project.endswith(':'):
                self._tp_project += ':'

        tasktext = tline[0]

        if not tasktext.startswith("- "):
            tasktext = "- %s" % (tasktext)

        self._tp_tasktext = tpp.TaskItem.parse(tasktext)

    def __str__(self):
        """pretty print the task-line
        """
        ret = ""
        if self._tp_tasktext:
            ret += "Task       : \'%s\'" % (self._tp_tasktext)
        if self._tp_tasktext.tags:
            ret += "\nTags       : \'%s\'" % (self._tp_tasktext.tags)
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
        if self._tp_tasktext:
            return self._tp_tasktext

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

########################################################################
# functions
########################################################################
def find_taskpaper_file(taskfolder, fname):
    """check, if the given name matches an existing file
    """
    if not fname.endswith('.taskpaper'):
        fname = fname + ".taskpaper"

    fullname = os.path.abspath(taskfolder + os.path.sep + fname)
    if not os.path.exists(fullname):
        __logger__.error("%s does not exist!", fullname)
        return
    elif not os.path.isfile(fullname):
        __logger__.error("%s is not a file!", fullname)
        return

    return fullname

def handle_text(scriptbase, text):
    """do the action
    """

    ###########################
    # cycle through all files
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", scriptbase + "/TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    if cmdres is None:
        __logger__.info("cdmres of %s is None", cmd)
    elif len(cmdres) > 0:
        __logger__.info("cmdres of %s is %s", cmd, cmdres)
    else:
        __logger__.info("Could not handle result %s of %s", cmdres, cmd)

    __logger__.debug("Text to handle: %s", text[0])
    task = OneLine(text[0])
    __logger__.debug("-- Result -- \n%s", task)

    return task

########################################################################
# main
########################################################################
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
                        default=__SCRIPTBASE__,
                        help="the base path for the apple scripts")
    parser.add_argument("-t",
                        "--taskfolder",
                        default=__TASKFOLDER__,
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

    logger.debug("remaining args: %s", args)

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
    __logger__.info("Run for %s", today)

    ###########################
    # do the action
    task = handle_text(scriptbase, options.text)
    tpfile = find_taskpaper_file(taskfolder, task.file)
    __logger__.debug("tpfile: %s", tpfile)
    with codecs.open(tpfile, "r", 'utf8') as myfile:
        tp_contents = tpp.TaskPaper.parse(myfile)

    found = False
    item = None
    for item in tp_contents:
        if item.is_project():
            __logger__.debug("Project: \'%s\'", item.txt)
            if item.txt == task.project:
                found = True
                break

    if found:
        __logger__.debug("Add %s to %s", task.task, item)
        item.add_item(task.task)
    else:
        __logger__.warn("%s not found", task.project)

    __logger__.info("End Run for %s", today)

    logger.info(tp_contents)

if __name__ == '__main__':
    main()

