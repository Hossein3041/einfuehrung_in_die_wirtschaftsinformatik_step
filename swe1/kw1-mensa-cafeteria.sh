#!/bin/bash
echo "Content-Type: text/html"
echo ""

# Hierbei wird der QUERY_STRING zweimal abgefangen, und einmal nach KW getrennt, und einmal nach Tag getrennt.

kw=$(echo $QUERY_STRING| cut -d "X" -f 1| cut -d "=" -f 2)
# Der KW ist hierbei entweder KW1 oder KW2

tag=$(echo $QUERY_STRING| cut -d "X" -f 2)
# Der Wochentag ist hierbei etwas zwischen Montag und Freitag.

echo "<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>$kw</title>
 <style>
  body {
   background-color: #CCEEFF;
   font-family: Arial, sans-serif;
}


#box {
  width: 450px;
  margin: 0 auto;
  height: 80px;
  border: 2px solid black;
  padding: 0px;
  background-color: #73a24e;
}
  h1 {
    color: #f9e45b;
} 
.tabelle {
    width: 70%;
    height: 90%;
    text-align: left;
    margin: 0 auto;
    background-color: white;

}
th {
  font-size: 40px;
  color: #f9e45b;
  background-color: #73a24e;
}
td {
  font-size: 30px;
  background-color: #a9c25d;
}
 </style>
</head>
<body>"

# Hierbei haben wir oben links in der Webseite, einen Fieltset erstellt, mit dem man zur Ausgabeseite, bzw. zu einer KW zurückgehen kann.
echo "<div id='container'>"
echo "<fieldset style='float: left; background-color: rgb(180, 180, 180); width: 10%; height: 10%'>"
echo "<legend style='background-color: rgb(180, 180, 180)'>KALENDERWOCHE</legend>"
echo "<form action='/docker-step2022team08-web/cgi-bin/swe1/ausgabe-kw.sh'>"
echo "<label for=field1>Woche:</label>"
echo "<select name='Woche'>"
echo "<option value='KW1'>KW1</option>"
echo "<option value='KW2'>KW2</option>"
echo "</select>"
echo "<br></br>"
echo "<input type=submit value='Anschauen'>"
echo "</form>"
echo "</fieldset>"


echo "<br></br>"
echo "<br></br>"
echo "<br></br>"

# Hierbei wurden die Variablen $kw und $tag verwendet, und damit aus der csv Datei, die Daten aus der richtigen Kalenderwoche, sowie davon wiederum, aus dem richtigen Wochentag zu nehmen, und diese wiederum in Tabellenform zu schreiben.


for i in Mensa Cafeteria; do
  echo "<div id='box'>"
  echo "<h1 style='text-align: center'>$kw - $tag - $i</h1>"
  echo "</div>
  <br></br>"

  echo "<table border='2' class='tabelle'>
  <tr>
  <th>$tag</th><th>Gericht</th><th>Preis</th><th>Ort</th>
  </tr>"
  cat /home/docker-step2022team08/swe1/karte.csv| grep "$kw.*$tag.*$i" |awk -F '|' '{print $4 "|" $2 "|" $3 "|" $6}'| sort -t "|" -k 1|sed 's/^/<tr><td>/g'| sed 's/|/<\/td><td>/g'| sed 's/$/<\/td><\/tr>/g'
  echo "</table>"
  echo "<br><br>"
done
echo "</body>
</html>"
