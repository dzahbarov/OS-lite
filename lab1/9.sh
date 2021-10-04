#!/bin/bash

#cat /var/log/*.log | wc -l


for filename in /var/log/*.log;
do
	let res+=`cat "$filename" | wc -l`
done
echo $res

