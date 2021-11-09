#!/bin/bash
echo $$ > .pid
acc=1
MODE="add"
usr1()
{
	MODE="add"
}


usr2()
{
	MODE="mul"
}

sig()
{
	MODE="term"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'sig' SIGTERM
while true; do
	case $MODE in
		"add")
			echo "add 2"
			acc=$(($acc + 2))
			;;
		"mul")
			echo "muling by 2"
			acc=$(($acc * 2))
			;;
		"term")
			echo "stopped by another proccess"
			exit
	esac
	echo "current res: $acc"
	sleep 1
done
