#!/bin/bash

# Function to error 1
# if function called with an argument then
#  print argument and exit 1
# if function called without an argument then
#  exit 1
error_exit() {
    if [ $# -eq 1 ];
    then
    	   echo "$1"
    fi
    exit 1
}

# Url Check Function
# curl to open link and supress the stdout and stderr
# curl outputs 0 if URL exists else non 0
# if URL doesn't exist return 1 else return 0
url_check() {
    curl --head $1 &> /dev/null
    if [ $? -ne 0 ];
    	then
    	    echo -e "Not found: $1"
        return 1
    fi
    return 0
}

# Check all arguments passed 
if [ $# -ne 1 ];
    then
        error_exit "Use like this: $0 <Path to URL filelist>"
fi

# Mah Variables
FILE=$1
ERROR_1=0

# If file is valid
if [ ! -f "$FILE" ];
    then
        error_exit "$FILE is not a valid file or path"
fi


# Reading file line by line and storing line to variable URL
# if url_check function returns 1, capture it and move on
# else if url_function returns 0, just move on
while read -r URL; 
   do
   	url_check $URL 2> /dev/null
   	if [ $? -eq 1 ];
   	then
   	     ERROR_1=1
   	fi
   done < "$FILE"

if [ "$ERROR_1" -eq 1 ]; 
    then
    	error_exit
fi

#learn curl, head, $?, function, done<"$input_the-File"
