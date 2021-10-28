#!/bin/bash
echo "" > tmp
for PID in `ps -ax -o pid --no-headers`
do
PPID2=`sed '7q;d' /proc/$PID/status | awk '{print $2}'`
sum_exec_runtime=`sed '5q;d' /proc/$PID/sched | awk '{print $3}'`
nr_switches=`     sed '7q;d' /proc/$PID/sched | awk '{print $3}'`
ART=`echo "$sum_exec_runtime" "$nr_switches" | awk '{printf "%f", $1 / $2}'`
res="$res$PID $PPID2 $ART"$'\n'
if [[ "$PPID2" != "" ]]
then
echo -n "$PID "
echo -n "$PPID2 "
echo $ART
fi
done | sort -n -k2 | tail -n +2 | awk '{print "ProcesdID="$1" : ParentProcessID="$2" : Average_Running_Time="$3}' > res4

