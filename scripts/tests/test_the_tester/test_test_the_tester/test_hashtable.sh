#!/usr/bin/bash
. ../common
. ../helpers/global_state_lock.bash

function test_lock_obtained {
    
}

#function test_lock_release {
#
#}


#Add tests to "tests" array:
declare -a tests
tests+=("test_die")

__max=${#tests[@]}
__counter=0

echo "__max: ${__max}"
while [ ${__counter} -lt ${__max}  ]; do
    declare -a arr_actual
    declare -a arr_expected
 
    echo "% Running: ${tests[${__counter}]}"
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo
    echo
    eval "${tests[${__counter}]}";
    err_code=$?
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo -n "% "
    if [ ${err_code} -lt 1 ]; then
        echo "Test Succeeded!"
    else
        echo "Test failed. Err code: ${err_code}"
        exit 1
    fi  
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo
    echo
    unset arr_actual
    unset arr_expected
    __counter=$((__counter + 1))
done

