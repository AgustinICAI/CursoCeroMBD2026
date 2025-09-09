#!/bin/bash
ficheros=$(ls $1)

if [ $# -lt 2 ];
then
 echo "no hay suficientes argumentos" 
else
 for destino in "${@:2}" ; do
  fecha=$(date +%Y%m%d_%H%M%S)
  nuevodestino=$destino"_"$fecha
  echo "copiando de " $1 "a" $nuevodestino
  cp -r $1 $nuevodestino
 done
fi


