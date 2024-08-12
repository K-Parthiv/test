#!/bin/bash

# Mah Variables
DIRECTORY=$1
FROM=$2
TO=$3

# Error fn
error_exit(){
	echo "$1"
	exit 1
}

echo "Enter the File name that has to be changed : "
echo "Enter the name that has to be overwritten : "

# Not existing + main
if [ ! -d "$DIRECTORY" ]; 
	then
		error_exit "Does'nt exist"
else
# To find from all the files.
# Parallely replace files there itself using sed -i.  
	find "$DIRECTORY" -type f -name "*.txt" | parallel 'sed -i  "s/{1}/{2}/g" {}' ::: "$FROM" ::: "$TO"
	echo "Done"
	exit 0
fi

#LEarn parallel, sed i, "s/{1}/{2}/g" {}' ::: $Curr_file ::: $Where_we_r_sending
