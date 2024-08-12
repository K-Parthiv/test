#!/bin/bash

Time=0

while getopts "m:s:" opt; #Getting input from user everytime after for m and s
	do
		case "$opt" in
			m)
				Time=$(( Time + $OPTARG * 60 ));;
			s)
				Time=$(( Time + $OPTARG ));;
			*)
				echo "Invalid Syntax : $0 <./File_name><-m time or -s time or -m number -s seconds>";;
		esac
	done
while [ "$Time" -gt 0 ];
	do
		echo "$Time"
		Time=$(( Time - 1))
		sleep 0.4
	done
echo "Omae wa MOU Shindeiru!"
	
		
