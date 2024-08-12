#!/bin/bash

# Print usage message to stderr
usage() {
    echo "usage: $0 <dir> <n>" 1>&2
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "ERROR: Incorrect number of arguments." 1>&2
    usage
    exit 1
fi

# Assign arguments to variables
dir=$1
n=$2

# Check if the first argument is a directory
if [ ! -d "$dir" ]; then
    echo "ERROR: input is not a directory." 1>&2
    exit 1
fi

# Check if the second argument is a valid number
if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "ERROR: The second argument should be a number." 1>&2
    usage
    exit 1
fi

# Find and remove files larger than $n bytes in the specified directory
find "$dir" -type f -size +"$n"c -exec rm -f {} +

exit 0


