#!/bin/bash
ficheros=$(ls $1)

if [ $# -lt 2 ];
then
 echo "no hay suficientes argumentos" 
else
 for destino in "${@:2}" ; do
  echo "copiando de " $1 "a" $destino
  cp -r $1 $destino
 done
fi


