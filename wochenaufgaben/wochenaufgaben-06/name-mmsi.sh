#!/bin/bash


#Lernt, auswändig zu tippen, wie
#Ihr an die zweite Spalte (den Namen)
#in mmsi-name.txt für eine
#gegebenen MMSI kommt.

cat /home/step2022/data/mmsi-name.txt | grep $1 | cut -d'|' -f 2 > schritt1.txt
cat schritt1.txt
