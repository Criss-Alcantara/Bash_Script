#!/bin/bash
WHAT=$(zenity --list --checklist --column Yes/No --column Item TRUE usr/include/ FALSE usr/share/backgrounds/ FALSE usr/share/pixmaps/ TRUE usr/share/man/ | tr \| \ );
SIZE=$(stat --printf=%s $0)
OR=$0 
ORIGEN=$(echo $HOME${OR:1}) #almacena la ruta actual del script
if [ -n "$WHAT" ]; then
	echo "Indique la ruta de descompresion:" $HOME"/"
	read DESTINO #lee en esta variable la ruta introducida por el usuario
	mkdir -p $DESTINO #crea la carpeta de destino si no exisia previamente
	cd $DESTINO  #cambia de directorio al destino especificado por el usuario
  (tail -n +14 $ORIGEN | pv -n -s $SIZE -i 0.25 | base64 -d | tar -xzf - $WHAT ) 2>&1  | zenity --progress --text=Descomprimiendo... --auto-close --auto-kill 
fi
exit 0;