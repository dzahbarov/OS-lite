#!/bin/bash
ps -ef | awk '$8 ~ ^/sbin/ {print $0}' 

