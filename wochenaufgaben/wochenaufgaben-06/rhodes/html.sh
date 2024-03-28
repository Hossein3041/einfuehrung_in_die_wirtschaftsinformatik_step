#!/bin/bash
anfang=$(date +%s%N)
cat /home/step2022/data/mmsi-name.txt | sort -t "|" -k2 | sed "s/^/|/g" | nl -n ln > mmsi-liste.txt

echo "<!doctype html>
<html>
  <head>
    <meta charset='utf-8'>
    <title>Schiffliste</title>
  </head>
  <body>
    <table>
      <tr><th>Nr</th><th>MMSI</th><th>Name</th></tr>" > /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/index.html
cat mmsi-liste.txt |while IFS="|" read Nummer MMSI Name
do echo"
      <tr> 
        <td>$Nummer</td>
        <td><a href='$MMSI.html'>$MMSI</a></td>
        <td>$Name</td>
      </tr>"; done >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/index.html
    echo "</table>
  </body>
</html>" >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/index.html
tidy -iq /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/index.html > /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/html-01/index.html

for mmsi in $(cat mmsi-liste.txt | cut -d "|" -f2); do
echo "<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>$mmsi</title>
  </head>
  <body>
  <table>
    <tr>
      <th>Nr</th>
      <th>Zeitstempel</th>
      <th>MMSI</th>
      <th>Longitude</th>
      <th>Latitude</th>
    </tr>" > /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/$mmsi.html
    grep "$mmsi" /home/step2022/data/rhodes.txt | grep -e "^[^|]*|1" -e "^[^|]*|3" |cut -d "|" -f 1,3,9,10 | sed "s/^/|/g" | sort -t "|" | nl -n ln | while IFS="|" read nr zeit mmsi long lati; do echo "<tr><td>$nr</td><td>$zeit</td><td>$mmsi</td><td>$long<td/><td>$lati</td></tr>"; done >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/$mmsi.html
  echo "</table>
    </body>
</html>" >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/$mmsi.html
tidy -iq /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/rhodes/$mmsi.html > /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/html-01/$mmsi.html

done
cp -r /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/html-01 /var/www/html/$USER/
cp -r /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/html-01 /home/step2022/wochenblogs/$USER/
ende=$(date +%s%N)
echo $(( (ende-anfang)/1000000 ))
step-pruefe-aufgabe-06.sh
