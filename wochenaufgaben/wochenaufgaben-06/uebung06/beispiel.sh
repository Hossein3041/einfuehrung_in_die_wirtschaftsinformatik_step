#!/bin/bash


mmsi=211537690
name=$(grep "&mmsi" /home/step2022/data/mmsi-name.txt | cut -d "|" -f2)
echo "name von $mmsi: $home"

lastpos=$(grep -v '^[^|]*|5|' |sort |cut -d "|" -f 9,10 |tail -n1)
longitude=$(e)


mmsi=211537690
name=$(grep "$mmsi" /home/step2022/data/mmsi-name.txt | cut -d '|' -f2)
echo "name von $mmsi: $name"

lastpos=$(grep "$mmsi" /home/step2022/data/rhodes.txt|\
          grep -v '^[^|]*|5|' |sort|cut -d '|' -f 9,10 |tail -n1)
longitude=$(echo "$lastpos" | cut -d'|' -f1)
latitude=$(echo "$lastpos" | cut -d'|' -f2)
echo "$longitude $latitude"

lines=$(nl /home/step2022/data/rhodes.txt|tail -n1|cut -f1)
