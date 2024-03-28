#!/bin/bash
cat rhodes.txt | grep '^[^|]*|5'| cut -d '|' -f 1,3,6 | sort -t "|" -k 2 | uniq -s20 > mmsi+name.txt

cat mmsi+name.txt | while IFS='|' read time mmsi name
do
  echo "name:$name" > /home/step2022/wochenblogs/hosakbari/loesung-05/$mmsi
  echo "first:$time" >> /home/step2022/wochenblogs/hosakbari/loesung-05/$mmsi;
done
step-pruefe-aufgabe-05.sh



#!/bin/bash
#
# cat rhodes.txt | grep "^[^|]*|5"| cut -d "|" -f 1,3,6 | sort -t "|" -k 2 | uniq -s20 > mmsi+name.txt
#
# cat mmsi+name.txt | while IFS="|" read time mmsi name
#
# echo "name:$name" > /home/step2022/wochenblogs/hosakbari/loesung-05/$mmsi
# echo "first:$time" >> /home/step2022/wochenblogs/hosakbari/loesung-05/$mmsi;
# done
# step-pruefe-aufgabe-05.sh
