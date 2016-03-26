#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8
""" script to be run as alfred action"""

from __future__ import unicode_literals
import sys
import logging
import logging.handlers
import datetime as dt
import runcommand as rc
import taskpaperdate as td

logging.basicConfig(level=logging.ERROR)
# logging.basicConfig(level=logging.DEBUG)
__logger__ = logging.getLogger(__name__)

__SCRIPTBASE__ = '.'
__THE_FILE__ = "{query}"

####################
# functions
def tell_tp3_to_save_open_files(scriptbase):
    """save all files currently opened in TP3"""
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", scriptbase + "/TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    return cmdres

def main():
    """the main function to have a dedicated scope """
    if len(sys.argv) > 1:
        thefile = sys.argv[1].decode('utf-8')
    else:
        thefile = __THE_FILE__
    __logger__.debug("In: \'%s\'", unicode(thefile))

    tell_tp3_to_save_open_files(__SCRIPTBASE__)

    ###########################
    # get current date and time
    today = dt.datetime.now()

    ###########################
    # service the file
    td.handle_file(thefile, today, ".")

    print "Done: %s" % (thefile)
    return True

if __name__ == "__main__":
    if main():
        sys.exit(0)
    else:
        sys.exit(1)

