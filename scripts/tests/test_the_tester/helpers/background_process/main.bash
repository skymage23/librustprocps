if [ "${BACKGROUND_PROCESS}" == ""  ]; then
    BACKGROUND_PROCESS=1

    #
    # Needed By All:
    #############################

    #
    #  Variables:
    #############################
    declare -A __bckgd_processes


    #
    # Background Process Struct:
    #############################

    #
    # Variables:
    #############################
    
    #Consts:
    __struct__const__INITIALIZING=0
    declare -r __struct__const__INITIALIZING

    __struct__const__ALIVE=1
    declare -r __struct__const__ALIVE

    __struct__const__DEAD=2
    declare -r __struct_const__DEAD

    #Mutables:
    __struct__mutable__RETVAL=""

    #
    # Functions: 
    #############################
    
    #
    #  Struct fields:
    #  Name: String
    #  PID: Integer
    #  Status: enum{Initializing, Alive, Dead}
    #############################

    #What do I do if the RETVAL is already populated.
    #
    function create_bckgd_proc_struct {
        local name=$1
        local pid=0
        local status=${__struct__INITIALIZING}
        
    }


    #
    # Background Process Management:
    #############################

    #
    # Functions:
    #############################
    function create_bckgd_process {
        #Hello:
        local job_name=$1
        local job_func_name=$2

        #Create and launch the background process
        #while denoting its PID.
    }
fi
