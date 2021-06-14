#!/bin/sh


#This function is intended to run in its own process:
function build_project () {
    local __proj_dir=$1;
    local __proj_make_opts=$2
    local __proj_config_opts=$3;
    
    cd $__proj_dir;
    if [ -f ./autogen.sh ]; then
	echo "Running Autogen:"
        ! ./autogen.sh && >&2 echo "Build Failed: Stage: Autogen; Project: ${__proj_dir}" && exit 1
    fi

    echo "Running Configure:"
    ! ./configure ${__proj_config_opts} && >&2 echo "Build Failed: Stage: Configure; Project: ${__proj_dir}" && exit 1

    echo "Running Make:"
    ! make ${__proj_make_opts} && >&2 echo "Build Failed:  Stage: Make; Project:  ${__proj_dir}" && exit 1
}

#Process Pool:
#Make mkfifo for "thread" pool

#Main:
DEPEND_DIR="dependencies"
BUILD_ROOT="${DEPEND_DIR}/build"

#Make sure the build root exists:
if [ ! -d "${BUILD_ROOT}" ]; then
     mkdir ${BUILD_ROOT};
fi

#Iterate through the directories in DEPEND_DIR

