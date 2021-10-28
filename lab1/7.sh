#!/bin/bash

grep -E -o -r -h "[[:alnum:]._-]+@[[:alnum:].-]+\\.[[:alpha:]]{2,6}" /etc/ | awk '{print $1}' | paste -s -d, - > emails.lst
