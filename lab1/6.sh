#!/bin/bash

awk '$3 == "(WW)"' /var/log/anaconda/X.log | sed -e 's/(WW)/Warning:/g' > full.log
awk '$3 == "(II)"' /var/log/anaconda/X.log | sed -e 's/(II)/Information:/g' >> full.log
cat full.log
