#!/bin/bash

echo "" > mem.log
echo "" > swap.log
echo "" > proccess1.log
echo "" > proccess2.log
echo "" > top.log
pid=""
while [[ $pid == "" ]]
do
	pid=`pgrep "mem.bash"`
done


pid2=""
while [[ $pid2 == "" ]]
do
        pid2=`pgrep "mem2.bash"`
done

while :
do

if [[ `pgrep "mem.bash"` == "" ]] && [[ `pgrep "mem2.bash"` == "" ]]
then
	break
fi
#echo "---------------------------------------------" >> mem.log
top -b -n1 | sed -n 4p >> mem.log
top -b -n1 | sed -n 5p >> swap.log
#echo "current:" >> mem.log
top -b -n1 -p $pid | sed 1,7d >> proccess1.log
top -b -n1 -p $pid2 | sed 1,7d >> proccess2.log
#echo "top:" >> mem.log
top -n1 -bo +%MEM | sed 1,7d  | head -5 >> top.log
echo "" >> top.log
done
