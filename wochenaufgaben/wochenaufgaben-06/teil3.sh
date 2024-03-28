 #!/bin/bash

#Schreibt Euch ein kleines Programm,
#das als Argument ($1) eine MMSI
#erwartet und den Namen aus der
#mmsi-name.txt heraussucht und
#mit echo zurückgibt, so dass Ihr
#das Programm nutzen könnit:
#
for mmsi in 05162000 305544000; do
  name=$(./name-mmsi.sh $mmsi)
  echo "$mmsi $name"
done



