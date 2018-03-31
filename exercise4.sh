#!/bin/bash

for pictures in $(ls $1/*.jpg)
do	
	FILESIZE=$(stat -c%s "$pictures")
	if [ $FILESIZE -gt 1000000 ]; then 
		mogrify -resize 720 $pictures
		echo "$pictures"	
	fi
done
