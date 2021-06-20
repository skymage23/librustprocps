#!/usr/bin/bash

function hero {
    echo "Hello, world.";
}

__func_name="hero"
__retval=0
__awk_string="\$3 ~ /^${__func_name}\$/ {print \$3}"
__value="`declare -F | awk \"${__awk_string}\"`"

echo "value: ${__value}"

