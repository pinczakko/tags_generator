#!/bin/sh

## Generate list of files to be indexed by cscope
PROJECT_PATH=$(pwd)
cd /
echo "PROJECT_PATH="${PROJECT_PATH}
find ${PROJECT_PATH}  -type f -name '*.cpp' -print -o -name '*.h' -o -name '*.hpp' > ${PROJECT_PATH}/cscope.files

## Generate cscope files
cd ${PROJECT_PATH}
cscope -b -q -icscope.files 

