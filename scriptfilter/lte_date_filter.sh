#!/bin/bash
# Creation Date :  Mi 21 Mai 11:48:22 2014

# hack to allow testing on commandline
TMP="{query}"
DOMSG="${1:-$TMP}"

# Initial for XML
OUTPUT="<?xml version=\"1.0\"?>"

# the beginning
OUTPUT+="\n<items>"

OUTPUT+="\n<item uid=\"doing_mgs\" arg=\"${DOMSG} @lte\" \
valid=\"yes\">\n<title>${DOMSG}</title>\n<subtitle>Insert \"${DOMSG:0:15}...\" \
into doing.txt</subtitle>\n</item>"

# the end
OUTPUT+="\n</items>"

echo -e ${OUTPUT}

# vim: ts=2:sw=2:tw=80:fileformat=unix
# vim: comments& comments+=b\:# formatoptions& formatoptions+=or

