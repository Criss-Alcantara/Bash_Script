#!/bin/bash
# En $# se guarda el numero de parametros, si el valor de $# es igual a 0 quiere decir que no se ha introducido parametros
if [ $# -eq 0 ];
then
	echo "Error, numero de parametros introducidos incorrecto"
	exit
fi

LISTADO="$*" #se crea una lista con todos los parametros introducidos
CONTADOR=0

for I in $LISTADO; do
	while read LINEA; do
		NOMBRE=`echo $LINEA | cut -d ":" -f 1` #Selecciona solo el primer campo delimitado por ":"
		if [ "$I" = "$NOMBRE" ]; then #Comparamos si el parametro ingresado es igual a NOMBRE
			NAME=`echo $LINEA | cut -d ":" -f 7` #Selecciona solo el septimo campo delimitado por ":"
			echo "$I: $NAME" #Imprimimos el parametro y su direccion
			let CONTADOR=0 #Sirve para no imprimir doble
			break;
		else
			let CONTADOR=CONTADOR+1 #Este contador sirve para saber si no se se ha encontrado el parametro en /etc/passwd
		fi
	done < /etc/passwd
	if [ $CONTADOR -gt 0 ]; then
		echo "-EROR- $I: no such user"	#Al ser en contrador mayor a 0 quiere decir que no se encontro el parametro y se imprime el error
	fi
	let CONTADOR=0 #Iniciamos el contador a 0 para la siguiente busqueda
done
