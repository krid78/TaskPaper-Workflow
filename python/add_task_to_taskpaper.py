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

from __future__ import unicode_literals
import os
import sys
import codecs
import argparse
# import datetime as dt
import logging
import logging.handlers
import runcommand as rc
import taskpaper as tpp

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
        self._tp_project = 'Inbox:'
        self._tp_file = 'inbox'
        self._parse(text)

    def _parse(self, text):
        """handle a text object to seperate the single parts"""
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
        ret = "\n"
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

class TaskPaperFileHandler(object):
    """Just a wrapper for handling the TaskPaper file"""

    def __init__(self, fname, folder='.'):
        """constructor"""
        if not fname.endswith('.taskpaper'):
            fname += ".taskpaper"
        self._tp_filename = fname
        self._tp_abs_filename = check_path(folder + '/' + self._tp_filename, isfile=True)
        self._tp_contents = None

    def read_file(self):
        """read the file into the object"""
        with codecs.open(self._tp_abs_filename, "r", 'utf8') as myfile:
            self._tp_contents = tpp.TaskPaper.parse(myfile)

        if not self._tp_contents:
            return False

        return True

    def add_task(self, thetask, theproject):
        """add the task to the given taskpaper file"""
        if not self._tp_contents:
            __logger__.info("contents not read, yet")
            return False

        found = False
        item = None
        for item in self._tp_contents:
            if item.is_project():
                __logger__.debug("Project: \'%s\'", item.txt)
                if item.txt == theproject:
                    found = True
                    break

        if found:
            __logger__.debug("Add %s to %s", thetask, item)
            item.add_item(thetask)
        else:
            __logger__.warn("\'%s\' not found", theproject)
            return False

        return True

    def write_contents(self):
        """wirtes the current contents to a file"""
        if not self._tp_contents:
            __logger__.warn("no contents to write!")
            return

        with codecs.open(self._tp_abs_filename, "w", 'utf8') as myfile:
            myfile.write(unicode(self._tp_contents))

        return True

    def __str__(self):
        thestr = ""
        if self._tp_abs_filename:
            thestr += self._tp_abs_filename
        if self._tp_contents:
            thestr += " is read"
        return thestr

########################################################################
# functions
########################################################################
def tell_tp3_to_save_open_files(scriptbase):
    """save all files currently opened in TP3"""
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", scriptbase + "/TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    return cmdres

def check_path(relpath, isfile=False):
    """return full qualified path for relpath or none
    """
    relpath = os.path.expanduser(relpath)
    abspath = os.path.abspath(relpath.rstrip(os.path.sep))
    if not os.path.exists(abspath):
        __logger__.error("%s does not exist!", abspath)
        return None

    if isfile:
        if not os.path.isfile(abspath):
            __logger__.error("%s is not a file!", abspath)
            return None
    elif not os.path.isdir(abspath):
        __logger__.error("%s is not a directory!", abspath)
        return None

    __logger__.debug("checked: \'%s\'", abspath)

    return abspath

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

    scriptbase = check_path(options.scriptbase)
    if scriptbase is None:
        return

    taskfolder = check_path(options.taskfolder)
    if taskfolder is None:
        return

    ###########################
    # do the action
    # tell_tp3_to_save_open_files(scriptbase)
    # theline = OneLine(options.text[0])
    # logger.info("theline: %s", theline)
    # tpfile = find_taskpaper_file(taskfolder, theline.file)
    # logger.info("tpfile: %s", tpfile)
    # add_task_to_tpfile(tpfile, theline.project, theline.task)

    tell_tp3_to_save_open_files(scriptbase)
    theline = OneLine(unicode(options.text[0], 'utf8'))
    logger.info("theline: %s", theline)
    tpf = TaskPaperFileHandler(theline.file, taskfolder)
    logger.info("tpf: %s", tpf)
    if not tpf.read_file():
        return False
    logger.info("tpf: %s", tpf)
    if not tpf.add_task(theline.task, theline.project):
        return False
    if not tpf.write_contents():
        return False

    logger.info("Task \'%s\' added to \'%s\' in \'%s\'", theline.task, theline.project, theline.file)

if __name__ == '__main__':
    main()

