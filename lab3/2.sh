#!/bin/bash

at now + 2 minutes -f 1.sh
tail -n 0 -f  report &
