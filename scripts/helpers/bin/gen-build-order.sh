#!/usr/bin/bash
. scripts/helpers/common
. ${HELPERS_DIR}/build-order-list-vars

BUILD_TREE="";

function has_depends_file {
    local __module_name="$1"
    find ${DEPENDS_LIST_DIR} -name "*${__module_name}.txt" | grep -q "."    #Returns non-zero if file not found
    return $?   #Return the error code (return value) of the last command as the return value of the function.
}

function __make_build_tree {
   #try to open the file. If failure, die.
   local __depends_file_name=$1
   {
	   for var in read do;
	       #Check if var has a value and if said "value" has a depends file.
	       [ "${var}" == "" ] && continue
               has_depends_file "${var} || return 1;

               BUILD_TREE="${var} ${BUILD_TREE}"
           done
   } < ${__depends_file_name}

}

function construct_build_tree {
   __make_build_tree ${DEPENDS_LIST_DIR}/main.txt
}

function prioritize_build_tree {

}


construct_build_tree
prioritize_build_tree

echo "${BUILD_TREE}"
