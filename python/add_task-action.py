#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

""" call the handler"""

import sys
import logging
import logging.handlers
import runcommand as rc
import add_task_to_taskpaper as attt

logging.basicConfig()
__logger__ = logging.getLogger(__name__)

__SCRIPTBASE__ = '.'
__TASKFOLDER__ = '~/CloudStation/_Tasks'

####################
# functions
def tell_tp3_to_save_open_files(scriptbase):
    """save all files currently opened in TP3"""
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", scriptbase + "/TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    return cmdres

####################
# main
def main():
    """this is the main file"""
    scriptbase = attt.check_path(__SCRIPTBASE__)
    if scriptbase is None:
        return False

    taskfolder = attt.check_path('~/CloudStation/_Tasks/')
    if taskfolder is None:
        return False

    tell_tp3_to_save_open_files(scriptbase)
    theline = attt.OneLine("{query}")
    tpf = attt.TaskPaperFileHandler(theline.file, taskfolder)
    if not tpf.read_file():
        return False
    if not tpf.add_task(theline.task, theline.project):
        return False
    if not tpf.write_contents():
        return False

    sys.stdout.write("Task \'%s\' added to \'%s\' in \'%s\'" % (theline.task, theline.project, theline.file))

if __name__ == '__main__':
    __logger__ = logging.getLogger()
    __logger__.setLevel(logging.DEBUG)
    __handler__ = logging.StreamHandler(stream=sys.stderr)
    main()

