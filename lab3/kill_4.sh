#!/bin/bash

oldpid=`pgrep -o loop`
youngpid=`pgrep -n loop`
cpulimit -l 10 -p $oldpid >/dev/null &
kill $youngpid
