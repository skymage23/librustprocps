. ../common

#
# global_state.bash is a
# simplistic, single process
# datastore for managing
# values global to the entire
# process group. Internally,
# it uses bash's environment
# variable handling for structure.
#
# Variable ownership is handled
# using the process ID of the
# first declarator.
##################################

#Global: visible to the entire process group.
#Global state process

#Make sure Netcat is installed:
if ! nc 2>&1 >/dev/null; then
    read -r -d '' message <<<EOF
Netcat (nc) is not on the system
PATH or is not installed.
Please install it and/or
put it on the system PATH.
EOF
    die "global_state.bash" "${message}"
    unset message
fi


#
# Variables:
#############################


#
# Functions:
#############################

function global_state_main {
    
}


#
# Create the background process
#############################



