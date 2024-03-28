#!/bin/bash
anfang=$(date +%s%N)
cat /home/step2022/data/mmsi-name.txt | sort -t "|" -k2 | sed "s/^/|/g" | nl -n ln > mmsi-list.txt
mkdir schritt-01 loesung-06

echo "<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>Register</title>
</head>
<body>
<table>
<tr><th>Nr</th><th>MMSI</th><th>Name</th></tr>" > schritt-01/index.html
cat mmsi-list.txt |while IFS="|" read a b c ; do echo "<tr><td>$a</td><td><a href='$b.html'>$b</a></td><td>$c</td></tr>" ; done >> schritt-01/index.html
echo "</table>
</body>
</html>" >> schritt-01/index.html
tidy -iq schritt-01/index.html > loesung-06/index.html

for mmsi in $(cat mmsi-list.txt | cut -d "|" -f2); do
echo "<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>$mmsi</title>
</head>
<body>
<table>
<tr><th>Nr</th><th>Zeitstempel</th><th>MMSI</th><th>Longitude</th><th>Latitude</th></tr>" > schritt-01/$mmsi.html
grep "$mmsi" /home/step2022/data/rhodes.txt | grep -e "^[^|]*|1" -e "^[^|]*|3" |cut -d "|" -f 1,3,9,10 | sed "s/^/|/g"| sort -t "|" | nl -n ln | while IFS="|" read nr zeit mmsi long lati; do echo "<tr><t    d>$nr</td><td>$zeit</td><td>$mmsi</td><td>$long</td><td>$lati</td></tr>"; done >> schritt-01/$mmsi.html
echo "</table>
</body>
</html>" >> schritt-01/$mmsi.html
tidy -iq schritt-01/$mmsi.html > loesung-06/$mmsi.html

done
cp -r loesung-06 /var/www/html/$USER/
cp -r loesung-06 /home/step2022/wochenblogs/$USER/
ende=$(date +%s%N)
echo $(( (ende-anfang)/1000000 ))
step-pruefe-aufgabe-06.sh
