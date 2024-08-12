#!/bin/bash

# Ez computation
result=0
operator=""
input_file=$1

# Error Fn
error_exit(){
	echo $1
	exit -1
}

# Missing readable input file
if [ ! -f "$input_file" ] || [ ! -r "$input_file" ]; 
	then
		echo "Use : $0 input_file"
fi

# Taking case by case
while IFS=' ' read -r num operator;
do
	case "$operator" in 
		"+")
			result=$(( result + num ));;
		"-")
			result=$(( result - num ));;
		"*")
			result=$(( result * num ));;
		"%")
			result=$(( result % num ));;
		*)
 		error_exit "Invalid: $operator. Use only + - * % /";;
 		
	esac
done < "$input_file" # Taking in Input_file
echo "result is : $result"


# learn
# Reg ex
# ^-?[0-9]+$  ["+"/"-"/"*"/"%"/"/"]
# For user input $(( $@ )) cmd and others.... >>>   <<<
#                                                 |
#                                               ( p )
