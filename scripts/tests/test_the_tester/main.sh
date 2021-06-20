#!/usr/bin/bash

#Get list of directories:
__counter=0;
find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' filename; do
   [ "${filename}" != '.' ] && echo "${filename}"
done
