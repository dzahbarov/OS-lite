#!/bin/bash

#mode 1-add; 2-mul
let mode=1
let acc=1
re='^[0-9]+$'
(tail -f pipe) |
while true; do
	read LINE
#	echo $LINE
	if [[ $LINE == "QUIT" ]]; then
		echo "exit"
		killall tail
		killall 5_generator.sh
		exit
	elif [[ $LINE == "+" ]]; then
		echo "switch to add"	
		mode=1
	elif [[ $LINE == "*" ]]; then
		echo "switch to mul"
		mode=2
	elif [[ $LINE =~ $re ]]; then
		if [[ $mode == 1 ]]; then
			echo "adding"
			acc=$(($acc + $LINE))
		else
			echo "mulling"
			acc=$(($acc * $LINE))
		fi
		echo "res: $acc"
	else
		echo "Invalid input"
		killall tail
		killall 5_generator.sh
		exit
	fi
done
