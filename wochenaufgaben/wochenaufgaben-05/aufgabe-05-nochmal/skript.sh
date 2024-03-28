#!/bin/bash
counter="0"

while test "$counter" != 11
do
  echo "in der Schleife $counter"
  counter=$((counter+1))
done
echo "nach der Schleife"




