#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8
""" script to be run as alfred action"""

import os
import datetime as dt
import runcommand as rc
import taskpaperdate as td

__THE_FILE__ = "{query}"

if __name__ == "__main__":
    thefile = __THE_FILE__

    ###########################
    # get current date and time
    today = dt.datetime.now()

    ###########################
    # service the file
    cmd = rc.RunCommand(["osascript", "-l", "JavaScript", "./TaskPaper3_SaveAllOpenDocuments.scpt"])
    cmdres = cmd.run()
    if cmdres is None:
        print "cdmres of %s is None" % (cmd)
    elif len(cmdres) > 0 and cmdres[0] == "false":
        print "cdmres of %s is false" % (cmd)
    elif len(cmdres) > 0 and cmdres[0] == "true":
        print "cdmres of %s is true" % (cmd)
    else:
        print "Could not handle result %s of %s" % (cmdres, cmd)

    td.handle_file(thefile, today, ".")

    print "Done: %s" % (thefile)

