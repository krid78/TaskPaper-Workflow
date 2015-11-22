#!/bin/bash
# append text to doing.txt
# add date header as project, if new day
# by Daniel Kriesten <daniel@die-kriestens.de>
# inspired by Jon Anhold <jon@anhold.com> 2012-04-19
#
# Update the DOING variable to point to the file you want to use.
#

export LANG="de_DE"
export LC_ALL="de_DE.UTF-8"
DOING="/Users/krid/Dropbox/_Tasks/doing.taskpaper"
DATERES=$(date +"%a, %F;%R")
DATE="${DATERES%;*}:"
TIME="${DATERES#*;}"
QUERY="{query}"
ENTRY="- ${QUERY} @start(${TIME})"

grep -q "${DATE}" ${DOING}
RET=$?
if [[ ${RET} -ne 0 ]]; then
  echo ${DATE} >> ${DOING}
fi

echo -e "\t${ENTRY})" >> ${DOING}
if [[ $? -eq 0 ]]; then
  echo "Doing: ${ENTRY}"
else
  echo "FAILED!"
fi

# vim: ts=2:sw=2:tw=80:fileformat=unix
# vim: comments& comments+=b\:# formatoptions& formatoptions+=or

