#!/bin/bash
 cat /home/step2022/data/rhodes.txt | grep "^[^|]*|5" | cut -d "|" -f 3,6 | sort | uniq > schritt-01.txt
join -t "|" schritt-01.txt /home/step2022/data/mmsi-harbor.txt | sort -t "|" -k 2 | sed "s/^/|/g" | nl -n ln > schritt-02.txt


echo "<!Doctype html><html>
<head><meta charset='utf-8'><title>Das ist der Titel</title></head>
<body>" > schritt-03.txt
echo "<table>" >> schritt-03.txt
echo "<tr><th>Nr</th><th>MMSI</th><th>Name</th><th>Hafen</th></tr>" >> schritt-03.txt
sed "s/|/<\/td><td>/g" schritt-02.txt | sed "s/^/<tr><td>/g" | sed "s/$/<\/td><\/tr>/g" >> schritt-03.txt
echo "</table>" >> schritt-03.txt
echo "</body>
</html>" >> schritt-03.txt
tidy -iq schritt-03.txt > aufgabe-04.html
cp aufgabe-04.html /home/step2022/wochenblogs/hosakbari
step-pruefe-aufgabe-04.sh
