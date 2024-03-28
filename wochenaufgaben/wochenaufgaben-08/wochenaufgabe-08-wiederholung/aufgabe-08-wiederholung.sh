#!/bin/bash

#Sorgt dafür, dass in Eurem
# Wochenblog-Verzeichnis in der
# Datei loesung-08.txt
# - alle Namen und MMSI
# - einmalig
# - mit durchgängig klein
#   geschriebenem Namen
# - sortiert nach dem Namen
# - jeweils in der Reihenfolge
#   Name MMSI
#- getrennt durch das |-Zeichen
#stehen.


cat datei.txt| grep "^[^|]*|5|"| cut -d "|" -f 3,6 | tr "A-Z" "a-z" | sort -t "|" -k 2 | uniq| \
 while IFS="|" read mmsi name; do echo "$name|$mmsi"; done > loesung-08.txt

cp loesung-08.txt /home/step2022/wochenblogs/hosakbari/
step-pruefe-aufgabe-08.sh
