#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

""" call the handler"""

import sys
import logging
import logging.handlers
import runcommand as rc
import add_task_to_taskpaper as attt

logging.basicConfig(level=logging.ERROR)
__logger__ = logging.getLogger(__name__)

__SCRIPTBASE__ = '.'
__TASKFOLDER__ = '~/CloudStation/_Tasks'
__THE_TEXT__ = "{query}"

####################
# functions
def tell_tp3_to_save_open_files(scriptbase):
    """save all files currently opened in TP3"""
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", scriptbase + "/TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    return cmdres

####################
if __name__ == '__main__':
    scriptbase = attt.check_path(__SCRIPTBASE__)
    if scriptbase is None:
        sys.exit(1)

    taskfolder = attt.check_path('~/CloudStation/_Tasks/')
    if taskfolder is None:
        sys.exit(1)

    thetext = __THE_TEXT__
    tell_tp3_to_save_open_files(scriptbase)
    theline = attt.OneLine(thetext)
    tpf = attt.TaskPaperFileHandler(theline.file, taskfolder)
    if not tpf.read_file():
        sys.exit(1)
    if not tpf.add_task(theline.task, theline.project):
        sys.exit(1)
    if not tpf.write_contents():
        sys.exit(1)

    print "Task \'%s\' added to \'%s\' in \'%s\'" % (theline.task, theline.project, theline.file)

