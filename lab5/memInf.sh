#!/bin/bash

echo "" > mem.log
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
echo "---------------------------------------------" >> mem.log
top -b -n1 | sed -n 4p >> mem.log
top -b -n1 | sed -n 5p >> mem.log
echo "current:" >> mem.log
top -b -n1 -p $pid | sed 1,7d >> mem.log
echo "top:" >> mem.log
top -n1 -bo +%MEM | sed 1,7d  | head -5 >> mem.log
done
