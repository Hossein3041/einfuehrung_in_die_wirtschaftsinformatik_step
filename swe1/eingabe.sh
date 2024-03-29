#!/bin/bash

echo "Content-type: text/html"
echo ""


woche=$(echo $QUERY_STRING | cut -d"&" -f2 | cut -d"=" -f2)
gericht=$(echo $QUERY_STRING | cut -d"&" -f5 | cut -d"=" -f2)
preis=$( echo $QUERY_STRING | cut -d"&" -f6 | cut -d"=" -f2)
kategorie=$( echo $QUERY_STRING | cut -d "&" -f1 | cut -d"=" -f2)
tag=$(echo $QUERY_STRING | cut -d"&" -f3 | cut -d"=" -f2)
ort=$(echo $QUERY_STRING | cut -d"&" -f4 | cut -d"=" -f2)

echo ""$woche"|$(echo "$gericht"| tr '+' ' ')|$(echo "$preis" | tr '.' ',' | tr '+' ' ' | sed "s/%2C/,/g")|"$kategorie"|"$tag"|"$ort"" >> /home/docker-step2022team08/swe1/karte.csv
echo "<!doctype html>
</html>
<head>
<meta charset='utf-8'>
<meta http-equiv='refresh' content='4; URL=https://informatik.hs-bremerhaven.de/docker-step2022team08-web/swe1/eingabe.html'>
<title>Eingabe</title>
</head><body>"

echo "<h1>team08</h1>"

echo "Du hast gerade $woche|$gericht|$(echo $preis | tr '.' ',' | tr '+' ' ' | sed "s/%2C/,/g")|$kategorie|$tag|$ort hinzugefügt!"

echo "<br><a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/swe1/ausgabe-kw.sh?Woche=KW1'>Zur Ausgabe</a>
<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/swe1/eingabe.html'>Zurück zur Eingabe</a>"

</body>
</html>
