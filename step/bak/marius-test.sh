#!/bin/bash


if test -z $QUERY_STRING; then
  QUERY_STRING=1
fi
seite=$(echo QUERY_STRING | cut -d"=" -f2)
suche=$((seite*50))

echo "Content-type: text/html"
echo ""

echo "<!doctype html>"
echo "<html>"
echo "<head>"
echo "<meta charset='utf-8'>"
echo "<title>Suche</title>"
echo "</head>"
echo "<body>"
marius=$(nl /var/www/html/docker-step2022team08-web/step/rhodes-5.txt | head -n"$suche"| tail -n1 | sed "s/$/<br>/g")
echo "<p>$marius</p>"
echo "1 8
2 30
3 45
4 5
5 10
5 15
5 13
6 7
6 4
7 8
8 9
9 19
10 15
7 23
8 64
9 45
10 5
11 33
12 11
13 18
14 27
15 44
16 52
17 1
18 9
19 10
20 41" > /tmp/verlauf.dat
gnuplot /tmp/verlauf.gp
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/marius-test.sh?seite=$((seite-1))'>vorherige Seite</a>"
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/marius-test.sh?seite=$((seite+1))'>nächste Seite</a>"
echo "</body>"
echo "</html>"
