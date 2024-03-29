#!/bin/bash

echo "Content-type: text/html"
echo ""
echo "<html>"
echo "<head>"
echo "<title>CGI-Skript Beispiel</title>"
echo "</head>"
echo "<body>"
echo "<table>"
echo "<tr>"
echo "<th>Spalte 2</th>"
echo "</tr>"

cat /home/docker-step2022team08/swe1/hossein-bearbeitung/KW1.csv| awk -F "X" '{print "<tr><td>" $2 "</td></tr>"}'

echo "</table>"

cat /home/docker-step2022team08/swe1/hossein-bearbeitung/KW1.csv| awk -F "X" '{print "<p>"$1"</p><p>"$3"</p><p>"$4"</p>"}'

echo "</body>"
echo "</html>"
