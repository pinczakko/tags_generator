#!/bin/sh

# Script to generate cscope and ctags files

## Generate list of files to be indexed by cscope
PROJECT_PATH=$(pwd)
##INCLUDE_DIR=$(pwd)/../../../include
INCLUDE_DIR=$(pwd | rev | cut -d'/' -f4- | rev)/include

cd /
echo "PROJECT_PATH="${PROJECT_PATH}
echo "INCLUDE_DIR="${INCLUDE_DIR}

find ${INCLUDE_DIR} -type f -name '*.cpp' -print -o -name '*.h' -print -o -name '*.hpp' -print > ${PROJECT_PATH}/cscope.files
find ${PROJECT_PATH} -type f -name '*.cpp' -print -o -name '*.h' -print -o -name '*.hpp' -print >> ${PROJECT_PATH}/cscope.files

## Generate cscope files
cd ${PROJECT_PATH}
cscope -b -q -icscope.files 

## Generate tags file
find ${INCLUDE_DIR} -type f -name "*.[ch]" -print -o -name "*.cc" -print -o -name "*.cpp" -print -o -name "*.hpp" -print | xargs ctags

