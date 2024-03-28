#!/bin/bash

curl https://informatik.hs-bremerhaven.de/step2022/rhodes/2022-12-{01..07}.txt > d1.txt

cat d1.txt grep '^[^|]*|5|' | cut -d '|' -f 3,6 > neuedatei.txt

cat neuedatei.txt | tr 'A-Z' 'a-z' > wiedereinedatei.txt

cat wiedereinedatei.txt | \
  while IFS='|' read mmsi name; do
    echo "$name|$mmsi"
  done > namemmsi.txt

  cat namemmsi.txt | sort -u > loesung-08.txt
