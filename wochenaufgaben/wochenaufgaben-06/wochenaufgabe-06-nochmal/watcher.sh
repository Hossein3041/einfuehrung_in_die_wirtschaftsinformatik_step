#!/bin/bash

while true; do
  if diff -q zubeobachten.txt zuletzt.txt; then
    cp zubeobachten.txt zuletzt.txt
    ./konventiere.sh zuletzt.txt
  fi
  sleep 1
done
