#!/bin/bash
anfang=$(date +%s%N)
for i in $(wc -l /home/step2022/data/rhodes.txt)
do
 echo $1
done
ende=$(date +%s%N)
echo "Zeit in Millisekunden $(( (ende-anfang) / 1000000 ))"
