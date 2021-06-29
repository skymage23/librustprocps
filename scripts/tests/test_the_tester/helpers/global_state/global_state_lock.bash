#Global: Visible and modifiable by the entire process group.
#Bash doesn't really have a good way of limiting
#the scope of variables other than isolating
#them inside a background process.

#I mean, we could do that, I guess.
#This way, we don't use "export"
#unless we really have to, and even then,
#we can make the exported variable readonly.

if [ "${GLOBAL_STATE_LOCK}" == "" ];
    export GLOBAL_STATE_LOCK=1
    declare -r GLOBAL_STATE_LOCK

    #The Global State Lock is a mutex.
    #Because it locks down global state operations,
    #you need to use it sparingly.

    # These are the only variable in the global state we freely set  without locking.
    __gstate_lock_file="/tmp/$$_gstate_lock_file.bash"
    declare -r __gstate_lock_file

    __gstate_lock_file_desc=300
    declare -r __gstate_lock_file_desc
    

   function gstate_lock {
       exec ${__gstate_lock_file_desc}>${__gstate_lock_file}
       flock -s ${__gstate_lock_file_desc}
   }

   function gstate_unlock {
       exec ${__gstate_lock_file_desc}>-
   }

fi
