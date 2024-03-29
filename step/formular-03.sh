#!/bin/bash
echo "Content-Type: text/html"
echo ""

echo "
<html>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>STEP-Projekt</title>
    <link rel='stylesheet' href='/docker-step2022team08-web/step/style.css'> 
</head>
<body>"

qscodiert=$(echo "$QUERY_STRING" | sed 's/+/ /g' \
                                 | sed 's/%20/ /g' \
                                 | sed 's/%21/!/g' \
                                 | sed 's/%22/"/g' \
                                 | sed 's/%23/#/g' \
                                 | sed 's/%24/$/g' \
                                 | sed 's/%25/%/g' \
                                 | sed 's/%26/\&/g' \
                                 | sed 's/%28/(/g' \
                                 | sed 's/%29/)/g' \
                                 | sed 's/%2A/*/g' \
                                 | sed 's/%2B/+/g' \
                                 | sed 's/%2C/,/g' \
                                 | sed 's/%2F/\//g' \
                                 | sed 's/%3A/:/g' \
                                 | sed 's/%3B/;/g' \
                                 | sed 's/%3C/</g' \
                                 | sed 's/%3D/=/g' \
                                 | sed 's/%3E/>/g' \
                                 | sed 's/%3F/?/g' \
                                 | sed 's/%40/@/g' \
                                 | sed 's/%5B/[/g' \
                                 | sed 's/%5C/\\/g' \
                                 | sed 's/%5D/]/g' \
                                 | sed 's/%5E/\^/g' \
                                 | sed 's/%5F/_/g' \
                                 | sed 's/%60/`/g' \
                                 | sed 's/%7B/{/g' \
                                 | sed 's/%7C/|/g' \
                                 | sed 's/%7D/}/g' \
                                 | sed 's/%7E/~/g')

#-----------------------------
# Hierbei werden die Werte aus den QUERY_STRING, also Schiffnamen, Datum und Uhrzeit, in die jeweiligen Variablen geschrieben.
schiffnamen=$(echo "$qscodiert"| cut -d "=" -f 4)
datum=$(echo "$qscodiert"| cut -d "=" -f 3| cut -d "&" -f 1)
uhrzeit=$(echo "$qscodiert"| cut -d "=" -f 2| cut -d "&" -f 1)



#-----------------------------
# Hierbei gibt es eine Verlinkung zum vorheringen Prozess, mit den jeweiligen QUERY_STRING.
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-02.sh?datum=$datum&schiffnamen=$schiffnamen'>Zurück</a>"

# Hierbei gibt es eine Verlinkung zur Teamwebseite.
echo "<h1 class='mitte'><a href='https://informatik.hs-bremerhaven.de/step2022team08/'>team08 Teamwebseite</a></h1>"






#-----------------------------
# Hierbei soll mit den Variablen $schiffnamen, $datum, sowie $uhrzeit, die jeweilige Zeile, oder Eintrag, durhc grep rausgenommen werden.
zeile=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv| grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$schiffnamen" | grep "$datum"| grep "$uhrzeit")


# Hierbei werden, für die später erstellte Tabelle, die jeweiligen Spalten, aus der vorherigen $zeile, in jeweilige Spalten reingeschrieben.
a=$(echo "$zeile"| cut -d "|" -f 6)
b=$(echo "$zeile"| cut -d "|" -f 3)
c=$(echo "$zeile"| cut -d "|" -f 2)
d=$(echo "$zeile"| cut -d "|" -f 21)
e=$(echo "$zeile"| cut -d "|" -f 14)
f=$(echo "$zeile"| cut -d "|" -f 16)
g=$(echo "$zeile"| cut -d "|" -f 17)
h=$(echo "$zeile"| cut -d "|" -f 18)
i=$(echo "$zeile"| cut -d "|" -f 19)

lae1=$(echo "$zeile"| cut -d "|" -f 9)
lae2=$(echo "$zeile"| cut -d "|" -f 10)
laenge=$(( $lae1 + $lae2 ))

brei1=$(echo "$zeile"| cut -d "|" -f 11)
brei2=$(echo "$zeile"| cut -d "|" -f 12)
breite=$(( $brei1 + $brei2 ))

flaeche=$(( $laenge * $breite ))







#--------------------------------
# Hierbei werden mit den richtigen Spalten, eine Tabelle geschrieben, in der die richtigen Daten, eingetragen werden.
echo "<table class='matrix-box' style='border-style: none;' border='1'>

<tr><td>Name des Schiffes</td><td>$a</td></tr>
<tr><td>MMSI-Nummer</td><td>$b</td></tr>
<tr><td>Typ des Schiffes</td><td>$c</td></tr>
<tr><td>Bestimmungsort</td><td>$d</td></tr>
<tr><td>Ankunftszeit</td><td>$e</td></tr>
<tr><td>Ankunftszeit in Monaten</td><td>$f</td></tr>
<tr><td>Ankunftszeit in Tagen</td><td>$g</td></tr>
<tr><td>Ankunftszeit in Stunden</td><td>$h</td></tr>
<tr><td>Ankunftszeit in Minuten</td><td>$i</td></tr>
<tr><td>Länge des Schiffes</td><td>$laenge m</td></tr>
<tr><td>Breite des Schiffes</td><td>$breite m</td></tr>
<tr><td>Fläche des Schiffes</td><td>$flaeche m²</td></tr>

</table>"
echo "<br><br><br>"






#-------------------------------------
# Hierbei gibt es eine Verlinkung zur Startseite
echo "<form class='mitte' action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh' method='get'>
<input type='submit' value='Neues Schiff auswählen (zur Startseite)'>
</form>"






#--------------------------------------
echo "<div class='matrix-box'>"

# tag-1.sh wird hierbei aufgerufen, wobei die Statistik gezeigt wird.
echo "<img src='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/tag1.sh?ss=$schiffnamen'><br>"
# tag1-pdf.sh wird hierbei aufgerufen, wobei die Statistik als PDF-Format angezeigt wird.
echo "<a class='grafik' href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/tag1-pdf.sh?ss=$schiffnamen' target='_blank'>Hier zur PDF von Grafik 1</a>"

# Die Statistik zeigt die Anzahl der Meldungen pro Stunde, für alle Uhrzeiten.








#---------------------------------------
# lwoche-step-bild2.sh wird hierbei aufgerufen, wobei die Statistik gezeigt wird.
echo "<img src='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/lwoche-step-bild2.sh?ss=$schiffnamen'><br>"
# lwoche-step-bild2-pdf.sh wird hierbei aufgerufen, wobeid ie Statistik als PDF-Format gezeigt wird.
echo "<a class='grafik' href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/lwoche-step-bild2-pdf.sh?ss=$schiffnamen' target='_blank'>Hier zur PDF von Grafik 2</a>"

# Die Statistik zeigt die Anzahl der Meldungen pro Tag, für alle Tagen.

echo "<br><br></div>"









#---------------------------------------
# rVideo.sh wird hierbei aufgerufen, wobei dann das Video der letzten 10 Einträge gezeigt wird.
echo "
<div class='matrix-box' ><div><h3>Letzten 10 Einträge (Video)</h3></div>
<video controls width='900' autoplay muted loop>
     Video aus bashskript<source src='/docker-step2022team08-web/cgi-bin/step/rVideo.sh?ss=$schiffnamen' type='video/mp4'>
   </video></div>"
echo "</body>
<html>"
