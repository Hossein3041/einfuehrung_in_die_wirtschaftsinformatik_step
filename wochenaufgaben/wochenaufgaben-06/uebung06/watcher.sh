#!/bin/bash

echo "nix" > zuletzt.txt
while true; do
  if diff -q zubeobachten.txt zuletzt.txt
  then
    cp zubeobachten.txt zuletzt.txt
    ./konvertiere.sh zuletzt.txt
  fi
  sleep 1
done
