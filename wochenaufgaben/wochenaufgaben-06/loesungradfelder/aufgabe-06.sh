#!/bin/bash

grep "^[^|]*|5|" /home/step2022/data/rhodes.txt| cut -d '|' -f 3,6| sort -k 2 -t'|'|uniq > mmsi-name.txt

cat mmsi-name.txt| nl -nln -s'|'| sed 's/   *//g' > mmsi-name-sortiert-nummeriert.txt

cat mmsi-name.txt| cut -d '|' -f1 > mmsi-list.txt

rm -rf result
mkdir -p result

diemmsis=$(cat mmsi-list.txt)
for mmsi in $diemmsis; do 
  grep "|$mmsi|" /home/step2022/data/rhodes.txt | grep '^[^|]*|[13]|'| cut -d'|' -f 1,3,9,10| nl -nln -s'|'> result/$mmsi

done

cat mmsi-name-sortiert-nummeriert.txt | while IFS="|" read nr mmsi name; do
  echo "<tr><td>$nr</td><td><a href='$mmsi.html'>$mmsi</a></td><td>$name</td></tr>"
done > index-table-content.txt
echo "<!doctype html><html><head><meta charset='utf-8'><title>Register</title></head>
<body>
<table>
<tr><td>Nr</td><td>MMSI</td><td>Name</td></tr>" > index.html
cat index-table-content.txt >> index.html
echo "</table></body></html>" >> index.html
mkdir -p /var/www/html/$USER/loesung-06/
cat index.html| tidy -i -q  > /var/www/html/$USER/loesung-06/index.html

mkdir -p htmla htmlb
for mmsi in $(cat mmsi-list.txt); do
  cat result/$mmsi| sed 's/^/<tr><td>/g' |sed 's/|/<\/td><td>/g'| \
    sed 's/$/<\/td><\/tr>/g' > htmla/$mmsi
    echo "<!doctype html><html><head><title>$mmsi</title><meta charset='utf-8'></head>
<body> 
<table>
<tr><td>Nr</td><td>Zeitstempel</td><td>MMSI</td><td>Longitude</td><td>Latitude</td></tr>" >> htmlb/$mmsi.html
cat htmla/$mmsi >> htmlb/$mmsi.html
echo "</table>
</body></html>" >> htmlb/$mmsi.html
cp htmlb/$mmsi.html /var/www/html/$USER/loesung-06/
done
step-pruefe-aufgabe-06.sh
