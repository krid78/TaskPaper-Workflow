#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

import sys
import taskpaperdaily


__COLORS__={
    'BLACK'   : 0,
    'RED'     : 1,
    'GREEN'   : 2,
    'YELLOW'  : 3,
    'BLUE'    : 4,
    'MAGENTA' : 5,
    'CYAN'    : 6,
    'WHITE'   : 7
}

for i in __COLORS__.keys():
    sys.stdout.write("\x1b[3%(v)dm%(c)s\t\x1b[0m|" % {'c' : i, 'v' : __COLORS__[i]})
    sys.stdout.write("\x1b[3%(v)d;1m%(c)s(bold)\t\x1b[0m|" % {'c' : i, 'v' : __COLORS__[i]})
    sys.stdout.write("\x1b[4%(v)dm%(c)s(as bg)\t\x1b[0m|" % {'c' : i, 'v' : __COLORS__[i]})
    sys.stdout.write("\x1b[4%(v)d;1m%(c)s(as bold bg)\t\x1b[0m\n" % {'c' : i, 'v' : __COLORS__[i]})
