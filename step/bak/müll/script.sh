 #!/bin/bash
   echo "Content-Type: text/plain"
   echo ""
  
  
   qscodiert=$(echo "$QUERY_STRING")
  
  
  schiffnamen=$(echo "$qscodiert"| cut -d "=" -f 4)
  datum=$(echo "$qscodiert")
  uhrzeit=$(echo "$qscodiert"| cut -d "=" -f 2| cut -d "&" -f 1)
 
  zeile=$(cat typ-05.csv| grep "$schiffnamen"| grep "$uhrzeit" |grep "$datum")
 
  a=$(echo "$zeile"| cut -d "|" -f 6)
  f=$(echo "$zeile"| cut -d "|" -f 16)
  g=$(echo "$zeile"| cut -d "|" -f 17)
  h=$(echo "$zeile"| cut -d "|" -f 18)


echo "$a"

 #echo "$a" | sed "s/\n/\t/g" > dat.dat
  #echo "$f $g $h"
