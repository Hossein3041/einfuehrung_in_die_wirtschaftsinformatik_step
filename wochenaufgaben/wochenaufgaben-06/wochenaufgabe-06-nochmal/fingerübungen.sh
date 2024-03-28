#!/bin/bash

#Übung1
#Schreibt ein kleines Programm, das
#die Zeit misst, um die Anzahl der
#Zeilen in rhodes.txt zu zählen.

start=$(date +"%s")
cat /home/step2022/data/rhodes.txt| while read zeile; do echo " " ; done
ende=$(date +"%s")
echo "Die benötigte Zeit für das Lesen der Zeilen von rhodes $((ende-start))"


#zeilen=(wc /home/step2022/data/rhodes.txt)
#start=$(date +"%s")
#for i in $zeilen; do
# echo "$i"
#done
#ende=$(date +"%s")
#echo "Die benötigte Zeit für das Lesen der Zeilen von rhodes $((ende-start))"



#Übung2
#Lernt, auswändig zu tippen, wie
#Ihr an die zweite Spalte (den Namen)
#in mmsi-name.txt für eine
#gegebenen MMSI kommt.

cat /home/step2022/data/mmsi-name.txt| grep "$1"| cut -d "|" -f2
