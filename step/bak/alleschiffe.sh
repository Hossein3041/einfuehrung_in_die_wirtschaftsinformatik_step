#!/bin/bash
echo "Content-Type: text/html"
echo ""

echo "<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>STEP-Projekt</title>
<meta name='vieweport' content='width=device-width, initial-scale=1'/>
<link href='zweite-seite.css' rel='stylesheet'>
<head>
<style>

body {
 font-size: 21px;
}
table {
 margin: 0 auto;
}
td {
 width: 30%;
 height: 20px;
 font-size: 15px;
}
th {
  width: 30%;
  height: 20px;
  font-size: 15px;
  text-align: left;
}

</style>
<body>"

echo "<a href="https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh" class="verlinkung">Zurück</a>"



#counter=0
#page=1
#max_per_page=3
#
#echo "<table>"
#
#cat 5-wenig.csv | while IFS="|" read a1 b2 c3 d4 e5 f6 g7 h8 i9 j10 k11 l12 m13 n14 o15 p16 q17 rr18 s19 t20 u21 v22; do
#  laenge=$(( i9 + j10 ))
#  breite=$(( k11 + l12 ))
#  flaeche=$(( laenge * breite ))
#
# if [ $(($counter % $max_per_page)) == 0 ]; then
#    if [ $counter -ne 0 ]; then
#      echo "</tr>"
#      echo "</table>"
#      echo "<table style='display:none' id='table$page'>"
#    fi
#    echo "<tr>"
#  fi
#
#  echo "
#  <td>
#  <div>
#  <table border='1'>
#  <tr><th>Name des Schiffes</th><td>$f6</td></tr>
#  <tr><th>MMSI-Nummer</th><td>$c3</td></tr>
#  <tr><th>Typ des Schiffes</th><td>$b2</td></tr>
#  <tr><th>Bestimmungsort</th><td>$u21</td></tr>
#  <tr><th>Ankunftszeit</th><td>$n14</td></tr>
#  <tr><th>Ankunftszeit in Monaten</th><td>$p16</td></tr>
#  <tr><th>Ankunftszeit in Tagen</th><td>$q17</td></tr>
#  <tr><th>Ankunftszeit in Stunden</th><td>$rr18</td></tr>
#  <tr><th>Länge des Schiffes:</th><td>$laenge m</td></tr>
#  <tr><th>Breite des Schiffes:</th><td>$breite m</td></tr>
#  <tr><th>Fläche des Schiffes:</th><td>$flaeche m²</td></tr>
#  </table>
#  </div>
#  <br><br>
#  </td>"
#  counter=$(($counter + 1))
#
#  if [ $(($counter % $max_per_page)) == 0 ]; then
#    echo "</tr>"
#    page=$(($page + 1))
#  fi
#done
#
#echo "</tr>"
#echo "</table>"



echo "<form action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/alleschiffe.sh'>"





#csv=$(cat 5-wenig.csv)
#
#gesamttabelle=0
#
#for i in $csv; do gesamttabelle=$(( $gesamttabelle + 1 )); done
#
#tabelleproseite=3
#gesamtseitenanzahl=$(( $gesamttabelle / $tabelleproseite ))

#gesamtseitenanzahlneu=""
#for i in $(seq 1 $gesamtseitenanzahl); do gesamtseitenanzahlneu="$gesamtseitenanzahlneu$i<br>"; done
#
#for i in $gesamtseitenanzahlneu; do echo $i; done
#
#echo "$gesamttabelle"
#echo "$tabelleproseite"
#echo "$gesamtseitenanzahlneu"





#echo "<form action="https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/alleschiffe.sh" method="get">
#  <label for="dropdown_select">Wähle eine Option:</label>
#  <select name="dropdown_select" id="dropdown_select">
#    <option value="option_1">Option 1</option>
#    <option value="option_2">Option 2</option>
#    <option value="option_3">Option 3</option>
#  </select>
#  <input type="submit" value="Absenden">
#</form>"











#counter=0
#page=1
#max_per_page=3
#echo "<table>"
#
#cat 5-wenig.csv| while IFS="|" read a1 b2 c3 d4 e5 f6 g7 h8 i9 j10 k11 l12 m13 n14 o15 p16 q17 rr18 s19 t20 u21 v22; do
#  laenge=$(( i9 + j10 ))
#  breite=$(( k11 + l12 ))
#  flaeche=$(( laenge * breite ))
#
#  if [ $(($counter % $max_per_page)) == 0 ]; then
#    if [ $counter -ne 0 ]; then
#      echo "</tr>"
#      echo "<br>"
#      echo "<input type='button' onclick='previous()' value='previous'>"
#      echo "<input type='button' onclick='next()' value='next'>"
#      echo "</table>"
#      echo "<table style='display:none' id='table$page'>"
#    fi
#    echo "<tr>"
#  fi
#
#  echo "
#  <td>
# <div>
#  <table border='1'>
#  <tr><th>Name des Schiffes</th><td>$f6</td></tr>
#  <tr><th>MMSI-Nummer</th><td>$c3</td></tr>
#  <tr><th>Typ des Schiffes</th><td>$b2</td></tr>
#  <tr><th>Bestimmungsort</th><td>$u21</td></tr>
#  <tr><th>Ankunftszeit</th><td>$n14</td></tr>
#  <tr><th>Ankunftszeit in Monaten</th><td>$p16</td></tr>
#  <tr><th>Ankunftszeit in Tagen</th><td>$q17</td></tr>
#  <tr><th>Ankunftszeit in Stunden</th><td>$rr18</td></tr>
#  <tr><th>Länge des Schiffes:</th><td>$laenge m</td></tr>
#  <tr><th>Breite des Schiffes:</th><td>$breite m</td></tr>
#  <tr><th>Fläche des Schiffes:</th><td>$flaeche m²</td></tr>
#  </table>
#  </div>
#  <br><br>
#  </td>"

#  counter=$(($counter + 1))
#
#  if [ $(($counter % $max_per_page)) == 0 ]; then
#    echo "</tr>"
#    page=$(($page + 1))
#  fi
#done
#
#echo "</tr>"
#echo "</table>"



#counter=0
#current_page=1
#total_rows=$(wc -l 5-wenig.csv | awk '{print $1}')
#total_pages=$(( (total_rows + 2) / 3 ))
#
#echo "<table>"
#
#cat 5-wenig.csv | while IFS="|" read a1 b2 c3 d4 e5 f6 g7 h8 i9 j10 k11 l12 m13 n14 o15 p16 q17 rr18 s19 t20 u21 v22; do
#  laenge=$(( i9 + j10 ))
#  breite=$(( k11 + l12 ))
#  flaeche=$(( laenge * breite ))
#
#  if [ $(($counter % 3)) == 0 ]; then
#    echo "<tr>"
#  fi
#
#  echo "
#  <td>
#  <div>
#  <table border='1'>
#  <tr><th>Name des Schiffes</th><td>$f6</td></tr>
#  <tr><th>MMSI-Nummer</th><td>$c3</td></tr>
#  <tr><th>Typ des Schiffes</th><td>$b2</td></tr>
#  <tr><th>Bestimmungsort</th><td>$u21</td></tr>
#  <tr><th>Ankunftszeit</th><td>$n14</td></tr>
#  <tr><th>Ankunftszeit in Monaten</th><td>$p16</td></tr>
#  <tr><th>Ankunftszeit in Tagen</th><td>$q17</td></tr>
#  <tr><th>Ankunftszeit in Stunden</th><td>$rr18</td></tr>
#  <tr><th>Länge des Schiffes:</th><td>$laenge m</td></tr>
#  <tr><th>Breite des Schiffes:</th><td>$breite m</td></tr>
#  <tr><th>Fläche des Schiffes:</th><td>$flaeche m²</td></tr>
#  </table>
#  </div>
#  <br><br>
#  </td>"


#counter=$(($counter + 1))
#
#  if [ $(($counter % 3)) == 0 ] || [ $counter == $total_rows ]; then
#    echo "</tr>"
#  fi
#done
#
#echo "</table>"
#echo "<br>"
#echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/alleschiffe.sh?page=$((current_page-1))'>Previous</a> Page $current_page of $total_pages <a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/alleschiffe.sh?page=$((current_page+1))'>Next</a>"














counter=0
echo "<table>"

cat 5-wenig.csv| while IFS="|" read a1 b2 c3 d4 e5 f6 g7 h8 i9 j10 k11 l12 m13 n14 o15 p16 q17 rr18 s19 t20 u21 v22; do
laenge=$(( i9 + j10 ))
breite=$(( k11 + l12 ))
flaeche=$(( laenge * breite ))

if [ $(($counter % 3)) == 0 ]; then
echo "<tr>"
fi

echo "
<td>
<div>
<table border='1'>
<tr><th>Name des Schiffes</th><td>$f6</td></tr>
<tr><th>MMSI-Nummer</th><td>$c3</td></tr>
<tr><th>Typ des Schiffes</th><td>$b2</td></tr>
<tr><th>Bestimmungsort</th><td>$u21</td></tr>
<tr><th>Ankunftszeit</th><td>$n14</td></tr>
<tr><th>Ankunftszeit in Monaten</th><td>$p16</td></tr>
<tr><th>Ankunftszeit in Tagen</th><td>$q17</td></tr>
<tr><th>Ankunftszeit in Stunden</th><td>$rr18</td></tr>
<tr><th>Länge des Schiffes:</th><td>$laenge m</td></tr>
<tr><th>Breite des Schiffes:</th><td>$breite m</td></tr>
<tr><th>Fläche des Schiffes:</th><td>$flaeche m²</td></tr>
</table>
</div>
<br><br>
</td>"

counter=$(($counter + 1))

if [ $(($counter % 3)) == 0 ]; then
echo "</tr>"
fi
done

echo "</table>"







#counter=0
#echo "<table>"
#cat typ-05.csv| while IFS="|" read a1 b2 c3 d4 e5 f6 g7 h8 i9 j10 k11 l12 m13 n14 o15 p16 q17 rr18 s19 t20 u21 v22; do
#
#laenge=$(( i9 + j10 ))
#breite=$(( k11 + l12 ))
#flaeche=$(( laenge * breite ))



#if [ $(($counter % 4)) == 0 ]; then
#echo "<tr>"
#
#
#
#fi
#echo "
#<td>
#  <table border='1'>
#    <tr><td>Name des Schiffes</td><td>$f6</td></tr>
#    <tr><td>MMSI-Nummer</td><td>$c3</td></tr>
#    <tr><td>Typ des Schiffes</td><td>$b2</td></tr>
#    <tr><td>Bestimmungsort</td><td>$u21</td></tr>
#    <tr><td>Ankunftszeit</td><td>$n14</td></tr>
#    <tr><td>Ankunftszeit in Monaten</td><td>$p16</td></tr>
#    <tr><td>Ankunftszeit in Tagen</td><td>$q17</td></tr>
#   <tr><td>Ankunftszeit in Stunden</td><td>$rr18</td></tr>
#    <tr><td>Länge des Schiffes:</td><td>$laenge m</td></tr>
#    <tr><td>Breite des Schiffes:</td><td>$breite m</td></tr>
#    <tr><td>Fläche des Schiffes:</td><td>$flaeche m²</td></tr>
#  </table>
#</td>"
#counter=$(($counter + 1))
#if [ $(($counter % 4)) == 0 ]; then
#echo "</tr>"
#fi
#done
#echo "</table>"


echo "</body>
</html>"
