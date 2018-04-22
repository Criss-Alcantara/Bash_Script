#!/bin/bash
# en $# se guarda el numero de parametros, si el valor de $# no es igual a 2 quiere decir que el numero de parametros introducidos es incorrecto
if [ $# -ne 2 ];
then
	echo -e "Usage: ./exercise2_b.sh \e[4mFILE\e[0m \e[4mNUM\e[0m" # "\e[4m....\e[0m" sirve para subrayar, este mensaje muestra como se debe de escribir el comando
	exit
fi

tr -c [:alnum:] [\\n\*] < $1 | sort | uniq -c | sort -nr | head -$2
