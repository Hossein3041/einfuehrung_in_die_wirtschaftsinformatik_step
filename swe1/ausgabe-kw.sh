#!/bin/bash

echo "Content-type: text/html"
echo
woche=$(echo "$QUERY_STRING"| cut -d "=" -f 2)
echo "<!doctype html>
<html><head>
<style>
table, th, td{
  border: 2px solid;
  border-radius: 5px;
  margin: auto;
  background-color: #20639B;
}
h1,h2 {
  text-align: center;
}
.container {
  display: flex;
  flex-wrap: nowrap;
  justify-content: center;
}
.box {
  border-style: solid;
  border-radius: 5px;
  background-color: #20639B;
}
body {
  background-color: black;
  color: white;
}

</style>
<link href='/docker-step2022team08-web/swe1/index-style.css' rel='stylesheet'>
<meta charset='utf-8'><title>Essensplan $woche</title></head><body>"
echo "<div>
<h1>Essensplan</h1>
<h2>team08</h2>
<a href='/docker-step2022team08-web/swe1/Login.html' style='float: right; color: white;' class='box';'>Login  <a href='https://informatik.hs-bremerhaven.de/step2022team08/' style='color: white;' class='box'>team08 Webseite</a></span></a>
</div>" 

echo "<div class="container">"


echo "<div class='box'>
<legend>KALENDERWOCHE</legend>"
echo "<form action='/docker-step2022team08-web/cgi-bin/swe1/ausgabe-kw.sh'>"
echo "<label for=field1>Woche:</label>"
echo "<select name="Woche">"
echo "<option value="KW1">KW1</option>"
echo "<option value="KW2">KW2</option>"
echo "</select>"
echo "<br></br>"
echo "<input type=submit value='Anschauen'>"
echo "</form>
</div>"



echo "<div class='box'>
<legend>ESSENSKATEGORIE</legend>"
echo "<form action='/docker-step2022team08-web/cgi-bin/swe1/ausgabe-kw.sh'>"
echo "<label for=field1>Essenskategorie:</label>"
echo "<select name="Essenskategorie">"
echo "<option value="Vegan">Vegan</option>"
echo "<option value="Vegetarisch">Vegetarisch</option>"
echo "<option value="Schweinefleisch">Schweinefleisch</option>"
echo "<option value="Rindfleisch">Rindfleisch</option>"
echo "<option value="Lamm">Lamm</option>"
echo "<option value="Gefluegel">Gefluegel</option>"
echo "<option value="Fleisch">Fleisch</option>"
echo "<option value="Fisch">Fisch</option>"
echo "</select>"
echo "<br></br>"
echo "<input type=submit value='Anschauen'>"
echo "</form>
</div>"


echo "<div class='box'>
<legend>WOCHENTAG KW 1</legend>"
echo "<form id='formular1' action='/docker-step2022team08-web/cgi-bin/swe1/kw1-mensa-cafeteria.sh'>"
echo "<label for=field1>Tag:</label>"
echo "<select id='filter' name='filter'>"
echo "<option value='KW1XMontag'>Montag</option>"
echo "<option value='KW1XDienstag'>Dienstag</option>"
echo "<option value='KW1XMittwoch'>Mittwoch</option>"
echo "<option value='KW1XDonnerstag'>Donnerstag</option>"
echo "<option value='KW1XFreitag'>Freitag</option>"
echo "</select>"
echo "<br></br>"
echo "<input type='submit' value='Anschauen'>"
echo "</form>
</div>"

echo "<div class='box'>
<legend>WOCHENTAG KW 2</legend>"
echo "<form id='formular2' action='/docker-step2022team08-web/cgi-bin/swe1/kw1-mensa-cafeteria.sh'>"
echo "<label for=field1>Tag:</label>"
echo "<select id='filter' name='filter'>"
echo "<option value='KW2XMontag'>Montag</option>"
echo "<option value='KW2XDienstag'>Dienstag</option>"
echo "<option value='KW2XMittwoch'>Mittwoch</option>"
echo "<option value='KW2XDonnerstag'>Donnerstag</option>"
echo "<option value='KW2XFreitag'>Freitag</option>"
echo "</select>"
echo "<br></br>"
echo "<input type='submit' value='Anschauen'>"
echo "</form>
</div>"


echo "</div>"
#echo "<h1>$woche Mensa</h1>"
#echo "<table>"
#for i in Montag Dienstag Mittwoch Donnerstag Freitag; do
# echo "<tr><th>$i</th>"
# grep "$woche.*$i|Mensa" /home/docker-step2022team08/swe1/karte.csv | sort | while IFS="|" read kw name preis kategorie tag ort;do echo "<td>$name<br> $(echo $preis | tr '.' ',' )<br> $kategorie<br> $ort</td>";done
#echo "</tr>"
#done
#echo "</table>"     
for j in Mensa Cafeteria; do 
  echo "<h1>"$woche" "$j"</h1>"
  echo "<table>"
  for i in Montag Dienstag Mittwoch Donnerstag Freitag; do
    echo "<tr><th>"$i"</th>"
    grep ""$woche".*"$i"|"$j"" /home/docker-step2022team08/swe1/karte.csv | sort | while IFS="|" read kw name preis kategorie tag ort;do echo "<td>"$name"<br> $( echo "$preis" | tr '.' ',')<br> "$kategorie"<br> "$ort"</td>";done
  echo "</tr>"
  done
  echo "</table>"
done
  
echo "</body>
</html>"


