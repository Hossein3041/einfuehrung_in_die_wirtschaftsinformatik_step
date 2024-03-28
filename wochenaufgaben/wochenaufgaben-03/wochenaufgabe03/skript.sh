#!/bin/bash
cat rhodes.txt | grep "^[^|]*|5" | cut -d "|" -f3,6 | sort | uniq > mmsi-name.txt

cat mmsi-harbor.txt | grep "luebeck" | cut -d "|" -f1 | sort > luebeck.txt
cat mmsi-harbor.txt | grep "hamburg" | cut -d "|" -f1 | sort > hamburg.txt

join luebeck.txt hamburg.txt > luebeck-hamburg.txt
join -t "|" mmsi-name.txt luebeck-hamburg.txt > loesung-03.txt

cp loesung-03.txt /home/step2022/wochenblogs/loesung-03.txt
step-pruefe-aufgabe-03.sh
