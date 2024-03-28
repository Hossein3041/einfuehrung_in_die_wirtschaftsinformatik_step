#!/bin/bash
rm -rf rhodes
mkdir rhodes
cat /home/step2022/data/rhodes.txt| grep "^[^|]*|5|"| cut -d "|" -f3,6| sort -t "|" -k2| uniq| nl -s "|" > schritt-01.txt


echo "<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Das ist der Titel</title>
  </head>
  <body>
    <table>
      <tr>
        <th>Nr</th>
        <th>MMSI</th>
        <th>NAME</th>
      </tr>" > /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/rhodes/index.html
    cat schritt-01.txt| while IFS="|" read Nr MMSI Name sed; do echo "<tr><td>$Nr</td><td><a href="$MMSI.html" >$MMSI</a></td><td>$Name</td>" >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/rhodes/index.html; done
    echo "</table>
  </body>
</html>" >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/rhodes/index.html | tidy >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/rhodes/index.html
cat schritt-01.txt | cut -d "|" -f 2 > mmsi-list.txt

for mmsi in $(cat mmsi-list.txt); do
  touch /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/$mmsi.html
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
          </tr>" > /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/$mmsi.html
        cat /home/step2022/data/rhodes.txt| grep "^[^|]*|[13]"| cut -d "|" -f 1,3,9,10| sort -t "|" -k1| uniq| nl -nln -s "|" | sed "s/^/<tr><td>/g"| sed "s/|/<\/td><td>/g"| sed "s/$/<\/td><\/tr>/g" >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/$mmsi.html
        echo "</table>
      </body>
    </html>" >> /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/$mmsi.html
    cat /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/$mmsi.html| tidy -iq
  done
cp /home/hosakbari/step/wochenaufgaben/wochenaufgaben-06/wochenaufgabe-06-nochmal/ /home/step2022/wochenblogs/hosakbari/loesung-06/ 
  step-pruefe-aufgabe-06.sh

