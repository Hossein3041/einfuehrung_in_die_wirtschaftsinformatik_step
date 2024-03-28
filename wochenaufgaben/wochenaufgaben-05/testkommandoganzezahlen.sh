#!/bin/basz

# [$a -eq $b]    $a ist gleich $b (equal)
#     -ne       $a ungleich $b (not equal)
#     -lt       $a kleiner als $b (less then)
#     -gt       $a größer als $b (greather than)
#     -le       $a kleiner oder gleich $b (less or equal)
#     -ge       $a größer oder gleich $b (greather or equal)

a=11
b=13

if [ $a -eq $b ]
then
      echo "$a ist gleich mit $b"
else
      echo "$a ist ungleich $b"
fi


if [ $a -gt $b ]
then
      echo "$a ist größer als $b"
elif [ $a -lt $b ]
then
      echo "$a ist kleiner als $b"
else
      echo "$a ist gleich mit $b"
fi
if [ 10 -eq $b ]
then 
      echo "$b ist gleich mit 13"
fi

counter=7

if test "$counter" = "7"; then
  echo "$counter ist 7"
fi  

# oder

if test "$counter"
then
  echo "$counter ist 7"
fi

# oder

if test "$counter" = "7"; then echo "$counter ist 7"; fi



counter="0"
while test "$counter" != 10; do
  echo "in der Schleife $counter"
  counter=$((counter+1))
done
echo "nach der Schleife"

cat rhodes.txt | while IFS="|" read zeit typ mmsi rest; do
 echo "$mmsi $zeit"
done

