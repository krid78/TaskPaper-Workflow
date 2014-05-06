#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=120:expandtab:fileencoding=utf-8


"""
Package       :  taskpaperdaily
Author(s)     :  Daniel Kriesten
Email         :  daniel.kriesten@etit.tu-chemnitz.de
Creation Date :  Di  6 Mai 18:27:28 2014
"""

__FILES__ = [
    "/Users/krid/Dropbox/_Notes/00-Inbox.taskpaper",
    "/Users/krid/Dropbox/_Notes/10-Work.taskpaper",
    "/Users/krid/Dropbox/_Notes/20-Home.taskpaper",
    "/Users/krid/Dropbox/_Notes/30-doing.taskpaper",
    "/Users/krid/Dropbox/_Notes/40-Studenten.taskpaper",
    "/Users/krid/Dropbox/_Notes/50-Geschenke.taskpaper",
    "/Users/krid/Dropbox/_Notes/99-HowToOrganizeTaskPaper.taskpaper",
]

def calc_times(today, now):
    """calculate some day and time values"""
    yesterday = today - time.timedelta(1)
    tomorrow  = today + time.timedelta(1)
    theweek   = 0   #TODO
    return yesterday, tomorrow, theweek

def change_dates(file):
    with codecs.open(file, "r", 'utf8') as myfile:
        contents = myfile.read()

    if contents == '':
        return 0

    yesterday, tomorrow, theweek = calc_times(today, now)

    for line in contents:
        __logger__.debug(line)

def main():
    """the working cow"""

    # get current date and time
    today = time.time()
    now = time.time()
    for thefile in __FILES__:
        change_dates(thefile, today, now)

if __name__ == '__main__':
    main()
