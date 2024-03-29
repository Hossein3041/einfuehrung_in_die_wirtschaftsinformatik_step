#!/bin/bash
echo "Content-Type: text/html"
echo ""

#a=$(cat typ-05-02.csv| cut -d "|" -f 1)
#b=$(cat typ-05-02.csv| cut -d "|" -f 2)
#c=$(cat typ-05-02.csv| cut -d "|" -f 3)
#d=$(cat typ-05-02.csv| cut -d "|" -f 4)
#e=$(cat typ-05-02.csv| cut -d "|" -f 5)
#f=$(cat typ-05-02.csv| cut -d "|" -f 6)
#g=$(cat typ-05-02.csv| cut -d "|" -f 7)
#h=$(cat typ-05-02.csv| cut -d "|" -f 8)
#i=$(cat typ-05-02.csv| cut -d "|" -f 9)
#j=$(cat typ-05-02.csv| cut -d "|" -f 10)
#k=$(cat typ-05-02.csv| cut -d "|" -f 11)

#n=$(cat typ-05-02.csv| cut -d "|" -f 14)
#o=$(cat typ-05-02.csv| cut -d "|" -f 15)
#p=$(cat typ-05-02.csv| cut -d "|" -f 16)
#q=$(cat typ-05-02.csv| cut -d "|" -f 17)
#rr=$(cat typ-05-02.csv| cut -d "|" -f 18)
#s=$(cat typ-05-02.csv| cut -d "|" -f 19)
#t=$(cat typ-05-02.csv| cut -d "|" -f 20)
#u=$(cat typ-05-02.csv| cut -d "|" -f 21)
#v=$(cat typ-05-02.csv| cut -d "|" -f 22)

echo "<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>STEP-Projekt</title>
<style>
  body {
    font-size: 12px;
}
</style>
<head>
<body>
<table border='6'>"
#echo "
#<tr>
#<td>Name des Schiffes</td>
#<td>MMSI-Nummer</td>
#<td>Typ des Schiffes</td>
#<td>Bestimmungsort</td>
#<td>Ankunftszeit</td>
#<td>Ankunftszeit in Monaten</td>
#<td>Ankunftszeit in Tagen</td>
#<td>Ankunftszeit in Stunden</td>
#<td>Ankunftszeit in Minute</td>
#</tr>"
#
#cat typ-05.csv| while IFS="|" read a b c d e f g h i j k l m n o p q rr s t u v; do echo "<tr><td>$f</td><td>$c</td><td>$b</td><td>$u</td><td>$n</td><td>$p</td><td>$q</td><td>$rr</td><td>$s</td></tr>"; done

cat typ-05.csv| while IFS="|" read a b c d e f g h i j k l m n o p q rr s t u v; do echo "

 <tr>
 <th>Name des Schiffes</th>
 <th>MMSI-Nummer</th>
 <th>Typ des Schiffes</th>
 <th>Bestimmungsort</th>
 <th>Ankunftszeit</th>
 <th>Ankunftszeit in Monaten</th>
 <th>Ankunftszeit in Tagen</th>
 <th>Ankunftszeit in Stunden</th>
 <th>Ankunftszeit in Minute</th>
</tr>
<tr>
<td><$f</td><td>$c</td><td>$b</td><td>$u</td><td>$n</td><td>$p</td><td>$q</td><td>$rr</td><td>$s</td>
</tr>



"; done


#for i in $(cat typ-05.csv); do \
#echo "
#<tr>
#<td>Name des Schiffes</td>
#<td>MMSI-Nummer</td>
#<td>Typ des Schiffes</td>
#<td>Bestimmungsort</td>
#<td>Ankunftszeit</td>
#<td>Ankunftszeit in Monaten</td>
#<td>Ankunftszeit in Tagen</td>
#<td>Ankunftszeit in Stunden</td>
#<td>Ankunftszeit in Minute</td>
#</tr>" 
#
#
#
#
#
#;done

echo "</table>
</body>
</html>"
