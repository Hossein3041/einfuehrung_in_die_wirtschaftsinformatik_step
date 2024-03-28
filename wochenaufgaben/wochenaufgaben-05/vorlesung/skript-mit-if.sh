#!/bin/bash
if grep "bremerhaven" /home/step2022/data/harbor.txt; then
  echo "ja"
fi

zahl=6
if test 6 = "$zahl"; then
  echo "die sind gleich"
else 
  echo "die sind nicht gleich"
fi
