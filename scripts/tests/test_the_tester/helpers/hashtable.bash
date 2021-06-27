if [ "${HASHTABLES}" == "" ]; then
    HASHTABLES=1
    . ./global_state_lock.bash

    #
    #  Hashtable Struct Functions
    #######################################
    #
    #   Struct Fields (In Order):
    #   Lock File:
    #
    
    function create_struct {
        local struct_name
        local lock_file

       #Obtain global state lock
       #Make sure the variable does not 
       #already exist
        
    }
    
    
    #
    #   Hashtable Functions:
    #######################################
    function __hashtable_lock_release {
         local table_struct
    }
    
    function __hashtable_lock_obtain {
         local table_struct
    }
    
    function hashtable_update {
        local table_struct
        local key=$1
        local value=$1
        __hashtable_lock_obtain
       #Do stuff.
        __hashtable_lock_release
    }
    
    function hashtable_get {
        local table_struct
        local key=$1
        __hashtable_lock_obtain
       #Do stuff
        __hashtable_lock_release
    }
fi
