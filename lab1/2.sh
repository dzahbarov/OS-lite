#!/bin/bash

while read line
do
	if [ "$line" == "q" ]
	then break
	fi
	res="$res$line"
done
echo "$res"
