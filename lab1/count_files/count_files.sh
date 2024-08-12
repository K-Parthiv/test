#!/bin/bash

# Error Fn
error_exit() {
    echo "$1"
    exit 1
}

# Number of arguments (Not less than) 3
if [ "$#" -ne 3 ];
    then
   	error_exit "Usage: $0 <directory> <prefix> <recursive (TRUE|FALSE)>"
fi

# Mah Variables 
DIRECTORY=$1
PREFIX=$2
RECURSIVE=$3

# Directory not existing
if [ ! -d "$DIRECTORY" ]; 
    then
    	error_exit "Directory does not exist"
fi

# Recursive to not recursivingg
if [ "$RECURSIVE" != "TRUE" ] && [ "$RECURSIVE" != "FALSE" ]; 
    then
    	error_exit "Recursive takes only one value: TRUE or FALSE"
fi

# If recursive is used
if [ "$RECURSIVE" = "TRUE" ];
    then
   	contents=$(find "$DIRECTORY" -type f -name "$PREFIX" | wc -l)
        echo "$contents"
elif [ "$RECURSIVE" = "FALSE" ]; 
    then
        c=$(find "$DIRECTORY" -maxdepth 1 -type f -name "$PREFIX" | wc -l)
        echo "$c"
else
    	error_exit "Unexpected error"
fi

