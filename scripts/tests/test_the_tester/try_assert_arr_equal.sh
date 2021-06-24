#!/usr/bin/bash

. ./common

err_code=0

function test_arrays_not_exist {
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Name: \"test_arrays_not_exist\""
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Explanation:"
    echo "% Tests if the function properly handles"
    echo "% errors out if the arrays it needs"
    echo "% do not exist."
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    local __errcode=0;
    unset arr_expected
    unset arr_actual
    assert_correct_by_output_and_errcode
    __errcode=$?
    #Declaring them here because otherwise we'll break
    #the test runner.
    declare -a arr_expected
    declare -a arr_actual
    [ ${__errcode} -lt 1 ] && return 1
    return 0
}


#Test equal in size, and contents
function test_equal {
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Name: \"test_equal\""
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Explanation:"
    echo "% Tests if the function properly"
    echo "% handles the best-case scenario:"
    echo "% Actual output and expected output"
    echo "% are identical, and the error code"
    echo "% in the output is zero".
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    local __counter=0
    local __max_counter=9
    while [ ${__counter} -lt ${__max_counter} ]; do
    	 arr_actual+=(${__counter})
         __counter=$((__counter + 1))
    done
    arr_actual+=(0)
    __counter=0
    while [ ${__counter} -lt ${__max_counter} ]; do
        arr_expected+=(${__counter})
        __counter=$((__counter + 1))
    done
    arr_expected+=(0)
    assert_correct_by_output_and_errcode
}

function test_failure {
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Name: \"test_failure\""
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Explanation:"
    echo "% Tests if the function properly handles"
    echo "% non-zero error codes by catching them"
    echo "% and returning early with a non-zero"
    echo "% error code of its own."
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

    arr_actual+=(1)
    arr_expected+=("Doesn't matter")
    assert_correct_by_output_and_errcode
    [ "$?" -lt 1 ] && return 1
    return 0
}

function test_output_bigger_than_expected {
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Name: \"test_output_bigger_than_expected\""
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Explanation:"
    echo "% Tests that the function returns with"
    echo "% an error if the output is too big"
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

    arr_actual+=(1)
    arr_actual+=(0)
    arr_expected+=("Doesn't matter")
    assert_correct_by_output_and_errcode
    [ "$?" -lt 1 ] && return 1
    return 0
}


function test_output_smaller_than_expected {
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Name: \"test_output_smaller_than_expected\""
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Explanation:"
    echo "% Tests that the function returns with"
    echo "% an error if the output is too small"
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

    arr_actual+=(0)
    arr_expected+=(1)
    arr_expected+=(0)
    assert_correct_by_output_and_errcode
    local __errcode=$?
    [ ${__errcode} -lt 1 ] && return 1
    return 0
}

function test_not_equal {
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Name: \"test_not_equal\""
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    echo "% Explanation:"
    echo "% Tests that the function returns with"
    echo "% an error if the output is the same size"
    echo "% as the expected output, but is not"
    echo "% the expected output"
    echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

    arr_actual+=(2)
    arr_actual+=(0)
    arr_expected+=(1)
    arr_expected+=(0)
    assert_correct_by_output_and_errcode
    local __errcode=$?
    [ ${__errcode} -lt 1 ] && return 1
    return 0
}

#Add tests to "tests" array:
declare -a tests
tests+=("test_arrays_not_exist")
tests+=("test_equal")
tests+=("test_failure")
tests+=("test_output_bigger_than_expected")
tests+=("test_output_smaller_than_expected")
tests+=("test_not_equal")
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

