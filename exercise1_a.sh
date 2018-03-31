#!/bin/bash

if [ $# -eq 0 ];
then
	echo "Error, numero de parametros introducidos incorrecto"
	exit
fi

LISTADO="$*"
CONTADOR=0

for I in $LISTADO; do
	while read LINEA; do
		NOMBRE=`echo $LINEA | cut -d ":" -f 1`
		if [ "$I" = "$NOMBRE" ]; then
			NAME=`echo $LINEA | cut -d ":" -f 7`
			echo "$I: $NAME"
			let CONTADOR=0
			break;
		else
			let CONTADOR=CONTADOR+1
		fi
	done < /etc/passwd
	if [ $CONTADOR -gt 0 ]; then
		echo "-EROR- $I: no such user"	
	fi
	let CONTADOR=0
done
