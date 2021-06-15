#!/usr/bin/bash
#[Chris Nugent]: Note to self:
#  You just figured out how to get the dependencies to install into an alternate directory:
#
#  ./configure --prefix="<absolute_path_to_new_root>"
#  Also, don't forget you need to script the creation and destruction
#  of this suppossed new "root", henceforth called "build"
#


#Problem: exit_trap gets called twice.
#EXIT_TRAP_CALLBACKS=""
#EXIT_TRAP_CALLED=0
#function exit_trap {
#   #We may want to lock a file while we change this value:
#   [ ${EXIT_TRAP_CALLED} -gt 0] && exit 0;
#   #Obtain the lock. If lock succeeded, check value again.
#   exec 1000>/tmp/build-depends-exit-trap.lock;
#   flock
   
#   [ ${EXIT_TRAP_CALLED} -gt 0] && exit 0;
#   export EXIT_TRAP_CALLED=1;
#   for var in ${EXIT_TRAP_CALLBACKS}; do
#       eval "${var}";
#   done
#}
#trap exit_trap EXIT;
#trap exit_trap SIGINT;


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
#FFIO="build_depends_"


#Main:
DEPEND_DIR="dependencies"
BUILD_ROOT="${DEPEND_DIR}/build"

#Make sure the build root exists:
if [ ! -d "${BUILD_ROOT}" ]; then
     mkdir ${BUILD_ROOT};
fi

#Build the "build order tree":


#Iterate through the directories in DEPEND_DIR


#Extract needed binaries fro the build root, then destroy it.
