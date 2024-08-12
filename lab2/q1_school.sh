#!/bin/bash

# Mah Variables
my_sum=0
input_file=$1
count=0

#while read line;
#	do
#		my_sum=$(( $my_sum + $line ));
#	done<"Property_tax_Roll.csv"
#echo $my_sum;

# Error function
error_exit(){
	echo $1
	exit 1
}	

# Valid file
if [ $# -ne 1 ];
	then
		error_exit "Invalid usage : $0 Use as <./__.sh><Input_file>"
fi
# Without cut we can also use as
# While IFS, read -r col1 col2 col3 col4 col5 col6 col7
# 
cat $input_file | grep "MADISON SCHOOLS" | cut -d ',' -f 7 | while read line;
	do
		if [[ "$line" =~ ^-?(0-9)+$ ]];
			then 
				my_sum=$(( $my_sum + $line ))
				count=&(( $count + 1 ))
		fi
	done # <"$input_file" not needed here as cat function has already taken input_file as input

# Testing 	
# echo "Total is : $my_sum"
# e cho "Number of line : $count"
average=0
if [ $count -ne 0 ];
	then
		average=$(( my_sum / count ))
		echo "Average is : $average"
	else
		error_exit "No computable average exists $0"
fi
