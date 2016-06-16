#!/bin/sh

## Give space(s) at the end of the directory variable,
## otherwise "find" will complain, or indexes the wrong directories. 

SUBDIRS+="jansson "
SUBDIRS+="libevent-2.0.22-stable "
SUBDIRS+="utils "

echo "SUBDIRS = " ${SUBDIRS}

find ${SUBDIRS} -type f -name "*.[ch]" -print -o -name "*.cc" -print -o -name "*.hpp" -o -print | xargs ctags
