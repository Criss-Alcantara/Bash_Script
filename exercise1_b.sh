#!/bin/bash
# en $# se guarda el numero de parametros, si el valor de $# no es igual a 1 quiere decir que el numero de parametros introducidos es incorrecto
if [ $# -ne 1 ];
then
	echo "Error, numero de parametros introducidos incorrecto"
	exit
fi

LISTADO="$*" #se crea una lista con todos los parametros introducidos
CONTADOR=0

for I in $LISTADO; do
	while read LINEA; do
		NOMBRE=`echo $LINEA | cut -d ":" -f 3` #Selecciona solo el tercer campo delimitado por ":"
		if [ "$I" = "$NOMBRE" ]; then #Comparamos si el parametro ingresado es igual a NOMBRE
			NAME=`echo $LINEA | cut -d ":" -f 1` #Selecciona solo el primer campo delimitado por ":"
			echo "$NAME" #Imprimimos el resultado
		fi
	done < /etc/group 
done
