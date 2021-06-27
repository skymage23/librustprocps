if [ "${GLOBAL_STATE_LOCK}" == "" ];
    GLOBAL_STATE_LOCK=1
    #The Global State Lock is a mutex.
    #Because it locks down global state operations,
    #you need to use them sparingly.

    # These are the only variable in the global state we freely modify without locking.
    __gstate_lock_file="/tmp/$$_gstate_lock_file.bash"
    __gstate_lock_file_desc=300

   function gstate_lock {
       exec ${__gstate_lock_file_desc}>${__gstate_lock_file}
       flock -s ${__gstate_lock_file_desc}
   }

   function gstate_unlock {
       exec ${__gstate_lock_file_desc}>-
   }

fi
