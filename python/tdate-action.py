#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

import os
import datetime as dt
import runcommand as rc
import taskpaperdaily as td

__THE_FILE__    = "{query}"

if __name__ == "__main__":
    thefile = __THE_FILE__

    ###########################
    # get current date and time
    today = dt.datetime.now()

    ###########################
    # service the file
    cmd = rc.RunCommand(["osascript", "GetNamesOfOpenDocuments.scpt", os.path.basename(thefile)])
    cmdres = cmd.run()
    if len(cmdres) > 0 and cmdres[0] == "false":
        td.handle_file(thefile, today)
    else:
        cmd = rc.RunCommand(["osascript", "ParseDueDates.scpt", os.path.basename(thefile)])
        cmdres = cmd.run()

    print "Done: %s" % (thefile)

