#/bin/bash

#Schreibt Euch ein kleines Programm,
#das als Argument ($1) eine MMSI
#erwartet und den Namen aus der
#mmsi-name.txt heraussucht und
#mit echo zurückgibt, so dass Ihr
#das Programm nutzen könnt:
#
#for i in 305162000 305544000; do
#   name=$(./find-name-for-mmsi.sh $i)
#   echo "$mmsi $name"
#done

for i in 305162000 305544000; do
  name=$(./fingerübungen.sh $i)
  echo "$mmsi $name"
done
