#!/bin/bash

awk '$3 == "(WW)" || $3 == "(II)"' /var/log/anaconda/X.log | sed -e 's/(II)/Information:/g' -e 's/(WW)/Warning:/g' | sort -k3  -r > full.log
cat full.log
