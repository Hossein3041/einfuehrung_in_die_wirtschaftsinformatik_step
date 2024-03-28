#!/bin/bash

cat gesamt.txt | grep '^[^|]*|5|' | cut -d '|' -f3,6 | tr 'A-Z' 'a-z' | \
  while IFS='|' read mmsi name; do
    echo "$name|$mmsi"
  done | sort -t "|" -k 1,1 | uniq > loesung-08.txt
  cp /home/nicwinkler/step2022/Aufgabe-08/loesung-08.txt /home/step2022/wochenblogs/hosakbari/
   step-pruefe-aufgabe-08.sh
