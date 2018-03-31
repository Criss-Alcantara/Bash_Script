#!/bin/bash

if [ $# -eq 2 ]; then
	primos ()
	{
		factores=($(factor $1))
		if [ -z "${factores[2]}" ]; then #Es verdadero si la longitud de la cadena es zero
		  return 0
		else
		  return
		fi
	}

	for I in `seq $1 $2`; do
	  if primos $I; then
		echo "$I"
	  fi  
	done
else
	echo -e "Usage: ./exercise2_b.sh \e[4mA\e[0m \e[4mB\e[0m"
	exit
fi

# factor 2018
#2018(0 posc): 2(1era posc) 1009(2da posc) No es primo
# factor 5
#5(0 posc): 5(1era posc) Es primo

#if [ -z "${factores[2]}" ] Evalua que la 2da posc de factor esté vacia por lo que seria primo como
#el ejemplo de arriba

