#!/bin/bash
IFS=$'\n'
echo "" > tmpFor7
for line in `ps -ax -o pid,command --no-headers`
do
PID=`echo $line | awk '{print $1}'`
echo $line | awk '{printf "%s*", $1}' >> tmpFor7
echo $line | awk '{printf "%s\*", $2}' >> tmpFor7
awk '{ if ($1 == "read_bytes:") printf "%d\*\n", $2}' /proc/$PID/io >> tmpFor7
done
sleep 1m
echo "" > tmpFor7_2
for line in `cat tmpFor7`
do
pid=`echo $line | awk -F* '{print $1}'`
cmd=`echo $line | awk -F* '{print $2}'`
start=`echo $line | awk -F* '{print $3}'`
finish=`awk '{ if ($1 == "read_bytes:") print $2}' /proc/$pid/io`
echo -n "$pid*"
echo -n "$cmd*"
echo "$start" "$finish" | awk '{print ($2 - $1) }'
done | sort -n -t '*' -k5 | tail -n 3 | tr '*' ':'
rm tmpFor7
