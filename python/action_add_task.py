#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

""" call the handler"""

from __future__ import unicode_literals
import sys
import logging
import logging.handlers
import runcommand as rc
import add_task_to_taskpaper as attt

logging.basicConfig(level=logging.DEBUG)
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

def main():
    """the main function to have a dedicated scope """
    scriptbase = attt.check_path(__SCRIPTBASE__)
    if scriptbase is None:
        return False

    taskfolder = attt.check_path('~/CloudStation/_Tasks/')
    if taskfolder is None:
        return False

    if len(sys.argv) > 1:
        thetext = sys.argv[1].decode('utf-8')
    else:
        thetext = __THE_TEXT__
    __logger__.debug("In: \'%s\'", unicode(thetext))
    tell_tp3_to_save_open_files(scriptbase)
    theline = attt.OneLine(thetext)
    tpf = attt.TaskPaperFileHandler(theline.file, taskfolder)
    if not tpf.read_file():
        return False
    if not tpf.add_task(theline.task, theline.project):
        return False
    if not tpf.write_contents():
        return False

    print "Task \'%s\' added to \'%s\' in \'%s\'" % (theline.task, theline.project, theline.file)

    return True

####################
if __name__ == '__main__':
    if main():
        sys.exit(0)
    else:
        sys.exit(1)
