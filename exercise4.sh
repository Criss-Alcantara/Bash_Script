#!/bin/bash
#En $1 se guarda el parametro introducido
for pictures in $(ls $1/*.jpg) #De esta manera leemos solo aquellos archivos que sean .jpg
do	
	FILESIZE=$(stat -c%s "$pictures") #Obtenemos el tama�o de las imagemes
	if [ $FILESIZE -gt 1000000 ]; then  #Verificamos que sean mayores a 1MB 
		mogrify -resize 720 $pictures #Al ser mayores se modifica su tama�o a 720
		echo "$pictures"	#Se imprime aquellas imagenes que han sido modificadas
	fi
done
