#!/bin/bash

if [ $# -ne 1 ];
then
	echo "Error, numero de parametros introducidos incorrecto"
	exit
fi

LISTADO="$*"
CONTADOR=0

for I in $LISTADO; do
	while read LINEA; do
		NOMBRE=`echo $LINEA | cut -d ":" -f 3`
		if [ "$I" = "$NOMBRE" ]; then
			NAME=`echo $LINEA | cut -d ":" -f 1`
			echo "$NAME"
		fi
	done < /etc/group
done
