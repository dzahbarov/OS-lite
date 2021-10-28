#!/bin/bash
echo "" > res5
currentPid=`head -n 1 res4 | awk -F: '{print $2}' | awk -F= '{print $2}'`
sum=`	    head -n 1 res4 | awk -F: '{print $3}' | awk -F= '{print $2}'`
cnt=1

while read -r line
do
newPid=`echo $line | awk -F: '{print $2}' | awk -F= '{print $2}'`
tmp=`echo $line | awk -F: '{print $3}' | awk -F= '{print $2}'`
if [[ $currentPid != $newPid ]]
then
	avg=`echo "$sum" "$cnt" | awk '{printf "%f", $1 / $2}'`
	echo "Average_Running_Children_of_ParentId="$currentPid"is $avg" >> res5
	currentPid=$newPid
	sum=$tmp
	cnt=1
else
	sum=`echo "$sum" "$tmp"  | awk '{printf "%f", $1 + $2}'`
	cnt=$(( cnt + 1 ))
fi
echo $line >> res5
done < res4

avg=`echo "$sum" "$cnt" | awk '{printf "%f", $1 $2}'`
echo "Average_Running_Children_of_ParentId=$currentPid is $avg" >> res5
