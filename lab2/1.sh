#!/bin/bash

tmp=`ps -u root -o pid,command --no-headers`
wc -l <<< "$tmp" > res1
awk '{print $1 ":" $2}' <<< "$tmp" >> res1 

