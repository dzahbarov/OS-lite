#!/bin/bash

if [ $PWD == $HOME ]
then
	echo $PWD
	exit 0
else
	echo "NOT HOME"
	exit 1
fi
