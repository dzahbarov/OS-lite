#!/bin/bash

echo "" > report2.log
arr=()
let iteration=0
while :
do
	if [[ $iteration != 0 ]] && [[ $(($iteration % 100000)) == 0 ]]
	then
		echo ${#arr[@]} >> report2.log
	fi

	for i in  {1..10}
	do
		arr+=($i)
	done
	iteration=$(($iteration + 1))
done
