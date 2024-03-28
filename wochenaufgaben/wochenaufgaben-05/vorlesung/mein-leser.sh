#!/bin/bash
cat data.txt | while read vorname nachname ergebnis; do
  echo "datensatz: $nachname"
done
