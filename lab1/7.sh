#!/bin/bash

grep -E -o -r -h "[[:alnum:]._-]+@[[:alnum:].-]+\\.[[:alpha:]]{2,6}" /etc/ | awk '{printf("%s, ", $1)}' > emails.lst
