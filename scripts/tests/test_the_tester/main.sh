#!/usr/bin/bash

#Get list of directories:
__counter=0;

printf "\n\n"
find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' dirname; do
    if [ "${dirname}" != '.' ]; then
	echo "# Running ${dirname}"
	printf "###################################################\n\n"
        (cd "${dirname}"; ./main.sh;)
	echo -n "${dirname}: "
	if [ $? -lt 1 ]; then
            echo "Test Succeeded."
	else
            echo "Test Failed."
        fi
	printf "\n\n"
    fi
done
