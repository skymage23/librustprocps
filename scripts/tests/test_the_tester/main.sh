#!/usr/bin/bash

#Get list of directories:
__counter=0;

find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' dirname; do
    if [ "${dirname}" != '.' ]; then
        (cd "${dirname}"; ./main.sh 2>&1 >/dev/null;)
	echo -n "${filename}: "
	if [ $? -lt 1 ]; then
            echo "Test Succeeded."
	else
            echo "Test Failed."
        fi
    fi
done
