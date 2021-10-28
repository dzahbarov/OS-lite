#!/bin/bash

ps -u root --no-headers | wc -l  > res1 
ps -u root --no-headers | awk '{print $1 "\:" $4}' >> res1

