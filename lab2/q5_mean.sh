#!/bin/bash

# Function to print usage instructions and exit with an error status
usage() {
    echo "Usage: $0 [file.csv]" 1>&2
    echo "Calculates the mean of a colimn" 1>&2
    exit 1
}

# Check the number of arguments provided
# This script expects either 1 or 2 arguments
if [ "$#" -ne 1 ] && [ "$#" -ne 2 ]; then
    usage
fi

# Determine the input source based on the number of arguments
# If two arguments are provided, the second one is treated as the file
# If one argument is provided, standard input is used
if [ "$#" -eq 2 ]; then
    file="$2"
elif [ "$#" -eq 1 ]; then
    file="/dev/stdin"
else
    usage
fi

# Validate the input file if specified
# Check if the file exists and is readable, but skip this for standard input
if [ "$file" != "/dev/stdin" ] && [ ! -f "$file" ]; then
    echo "ERROR: File not found." 1>&2
    exit 1
fi

# The column index to process is provided as the first argument
# Column indices are 1-based, so we need to adjust accordingly
column="$1"

# Initialize variables for sum and count
sum=0
count=0

# Decide the input source for reading data
# Use 'cat' to handle standard input or specify the file for reading
if [ "$file" = "/dev/stdin" ]; then
    input="cat"
else
    input="cat $file"
fi

# Process each line of the input
# Read and parse CSV lines while skipping the header
# while IFS=, read -r col names and go on. But not good for loooong files
$input | while IFS=, read -r -a columns; do
    # Skip the first line as it is the header
    if [ "$count" -eq 0 ]; then
        count=$((count + 1))
        continue
    fi

    # Extract the value from the specified column (convert to 0-based index)
    value="${columns[$((column - 1))]}"

    # Check if the extracted value is a valid number usin regex
    if [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        sum=$(echo "$sum + $value" | bc)  # Add value to sum
        count=$((count + 1))              # Increment count of valid values
    fi
done

# Calculate and print the mean
# Subtract 1 from count to exclude the header line from the calculation
if [ "$count" -le 1 ]; then
    echo "ERROR: No valid numeric data found." 1>&2
    exit 1
fi

# Compute the mean with two decimal places
# Another method q1
mean=$(echo "scale=2; $sum / ($count - 1)" | bc)
echo "$mean"

exit 0
# Learn 
# cut, sending to garbage,
