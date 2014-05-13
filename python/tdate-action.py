#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

import os
import datetime as dt
import runcommand as rc
import taskpaperdate as td

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
    if cmdres == None:
        print "cdmres of %s is None" % (cmd)
    elif len(cmdres) > 0 and cmdres[0] == "false":
        handle_file(thefile, today)
    elif len(cmdres) > 0 and cmdres[0] == "true":
        cmd = rc.RunCommand(["osascript", options.applescriptbase + "/ParseDueDates.scpt", os.path.basename(thefile)])
        cmdres = cmd.run()
    else:
        print "Could not handle result %s of %s" % (cmdres, cmd)

    print "Done: %s" % (thefile)

