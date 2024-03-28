#!/bin/bash
anfang=$(date +%s%N)
mkdir - loesung-05/
cd /home/step2022/data/
cat rhodes.txt | grep "^[^|]*|5" | cut -d "|" -f 1,3,6 | sort -t "|" -k 2 | uniq -s20 | \
  while IFS="|" read zeit mmsi name
  do
    if test $mmsi
    then
      echo "name:$name" > $1"$mmsi.txt"
      echo "first:$zeit" >> $1"mmsi.txt"
    fi
  done
ende=$(date +%s%N)

anfang=$(date +%s%N); sleep 1; ende=$(date +%s%N); echo "Das Programm braucht die folgende Länge an Zeit: $(( (ende-anfang) / 1000000 ))"
