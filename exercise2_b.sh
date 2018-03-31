#!/bin/bash

if [ $# -ne 2 ];
then
	echo -e "Usage: ./exercise2_b.sh \e[4mFILE\e[0m \e[4mNUM\e[0m"
	exit
fi

tr -c [:alnum:] [\\n\*] < $1 | sort | uniq -c | sort -nr | head -$2
