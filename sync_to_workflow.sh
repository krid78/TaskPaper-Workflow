#!/bin/bash
# File          :  sync_to_workflow.sh
# Author(s)     :  Daniel Kriesten
# Email         :  daniel.kriesten@etit.tu-chemnitz.de
# Creation Date :  Mo 12 Mai 00:14:07 2014
########################################################################

WF_DIR=/Users/krid/Dropbox/Apps/Alfredv2/Alfred.alfredpreferences/workflows/user.workflow.EA45C547-66B2-481A-9281-DC5C7E906D79
SRC_FILES="python/feedback.py \
python/open_taskpaper_files.py \
python/runcommand.py \
python/taskpaperdate.py \
python/taskpaperdaily.py \
python/tp_light_parse_022.py \
applescript/GetNamesOfOpenDocuments.scpt \
applescript/ParseDueDates.scpt"

echo "Using WF: ${WF_DIR}"
for SRC_FILE in ${SRC_FILES}; do
  echo "Copy \"${SRC_FILE##*/}\""
  cp "${SRC_FILE}" "${WF_DIR}"
done

md5src=$(md5 launchd/LaunchAgent/de.die-kriestens.taskpaperdate.plist)
md5dst=$(md5 ~/Library/LaunchAgents/de.die-kriestens.taskpaperdate.plist)
if [[ md5src != md5dst ]]; then
  echo "Copy LaunchAgent/de.die-kriestens.taskpaperdate.plist"
  cp launchd/LaunchAgent/de.die-kriestens.taskpaperdate.plist ~/Library/LaunchAgents/
fi
# vim: ts=2:sw=2:tw=80:fileformat=unix
# vim: comments& comments+=b\:# formatoptions& formatoptions+=or

