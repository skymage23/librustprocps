#!/usr/bin/bash
set -e
OUTPUT="$(bash -c \". ../common \
. ${TEST_HELPERS}/test_utils_header \
. ./test-stuff \
. ${TEST_HELPERS}/test_utils_footer \
\"; echo $?)"


