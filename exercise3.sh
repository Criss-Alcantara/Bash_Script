#!/bin/bash
# en $# se guarda el numero de parametros, si el valor de $# no es igual a 2 quiere decir que el numero de parametros introducidos es incorrecto
if [ $# -eq 2 ]; then
	primos () #funcion para detectar primos
	{
		factores=($(factor $1))
		if [ -z "${factores[2]}" ]; then #Es verdadero si la longitud de la cadena es zero
		  return 0 #Efectivamente es un numero primo
		else
		  return
		fi
	}

	for I in `seq $1 $2`; do #Se evalua la secuencia donde I inicia en $1 y termina en $2
	  if primos $I; then #Se llama a la funcion primos para evaluar cada valor de I
		 echo "$I" #De ser primo, se imprime el valor
	  fi  
	done
else 
	echo -e "Usage: ./exercise3_b.sh \e[4mA\e[0m \e[4mB\e[0m"  # "\e[4m....\e[0m" sirve para subrayar, este mensaje muestra como se debe de escribir el comando
	exit
fi

# factor 2018
#2018(posc 0): 2(1era posc) 1009(2da posc) No es primo
# factor 5
#5(posc 0): 5(1era posc) Es primo

#if [ -z "${factores[2]}" ] Evalua que la 2da posc de factor este vacia por lo que seria primo como el ejemplo de arriba

