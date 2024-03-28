#!/bin/bash
cat /home/step2022/data/rhodes.txt | grep "^[^|]*|5" | cut -d "|" -f 3,6 | sort | uniq > schritt-01.txt
join -t "|" schritt-01.txt /home/step2022/data/mmsi-harbor.txt | sort -t "|" -k 2 | sed "s/^/|/g" | nl -n ln > schritt-02.txt

echo "<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <title>Titel</title>
  </head>
  <body>
    <table>" > schritt-03.txt
    echo "<tr><td>Nr</td><td>MMSI</td><td>Name</td><td>Hafen</td></tr>" >> schritt-03.txt
    sed "s/^/<tr><td>/g" schritt-02.txt | sed "s/|/<\/td><td>/g" | sed "s/$/<\/td><\/tr>/g" >> schritt-03.txt
    echo "</table>
  </body>
</html>" >> schritt-03.txt
tidy -iq schritt-03.txt > aufgabe-04.html
cp aufgabe-04.html /home/step2022/wochenblogs/hosakbari
cp aufgabe-04.html /var/www/html/hosakbari/
step-pruefe-aufgabe-04.sh
