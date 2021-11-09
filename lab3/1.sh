#!/bin/bash

mkdir test 2> /dev/null && {
	echo "catalog test was created successfully" > report
	touch test/`date +'%d.%m.%y_%T'`
}

ping www.net_nikogo.ru 2> /dev/null || {
	echo `date +'%d.%m.%y_%T'` ": cant reach" >> report
}
