#!/bin/bash

ficheros=$(ls $1)

for f in $ficheros;
do
  echo "->"$f
done
