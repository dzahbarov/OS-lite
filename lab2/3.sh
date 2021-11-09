#!/bin/bash



ps -ax -o pid,ppid,start_time  --sort=start_time | awk -v val=$$ '{ if ( $val != $1 && $val != $2 ) print $0}' | tail -1
