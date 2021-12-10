#!/bin/bash

echo "" > mem.log
echo "" > swap.log
echo "" > proccess.log
echo "" > top.log
pid=""
while [[ $pid == "" ]]
do
	pid=`pgrep "mem.bash"`
done
while :
do

if [[ `pgrep "mem.bash"` == "" ]]
then
	break
fi
#echo "---------------------------------------------" >> mem.log
top -b -n1 | sed -n 4p >> mem.log
top -b -n1 | sed -n 5p >> swap.log
#echo "current:" >> mem.log
top -b -n1 -p $pid | sed 1,7d >> proccess.log
#echo "top:" >> mem.log
top -n1 -bo +%MEM | sed 1,7d  | head -5 >> top.log
echo "" >> top.log
done
