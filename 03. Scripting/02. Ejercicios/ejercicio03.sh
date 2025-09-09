#!/bin/bash

ficheros=$(ls $1)

for f in $ficheros;
do
  if [ -d "$1/$f" ]; then
   echo "$f->es un directorio"
  elif [ -f "$1/$f" ]; then
   echo "$f->es un fichero"
  else
      echo "$f->desconocido"
  fi
done
