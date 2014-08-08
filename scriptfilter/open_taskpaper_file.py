#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8

import sys
import open_taskpaper_files as otf

__TP_BASEDIR__   = otf.__TP_BASEDIR__
__TP_EXTENSION__ = otf.__TP_EXTENSION__
__THE_FILTER__   = "{query}"

if __name__ == "__main__":
    ret = otf.find_files(__TP_BASEDIR__.replace(" ", "\ "), __TP_EXTENSION__, __THE_FILTER__)
    if ret != None:
        sys.stdout.write(ret)

