#!/bin/bash

seq 1000 2000 | grep '[2]' | wc -l

# If we want input from user
# seq $1 $2 | grep $3 | wc -l
# seq Starts from 1 and goes to 2.
# If we want the numbers to have a gap we can do seq $1 $2 $3. 
# Therefore from 1 to 3 leaving 2 numbers in between
