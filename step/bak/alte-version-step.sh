#!/bin/bash
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

#testet, ob querystring NULL ist
if test -z $qscodiert ; then qscodiert="seite=1&sortierung=k2"; fi

seite=$( echo $qscodiert |cut -d"&" -f1 | cut -d"=" -f2)
anzahl=$((seite*50))
sortierung=$(echo $qscodiert | cut -d"&" -f2 | cut -d"=" -f2)

echo "Content-Type: text/html"
echo ""


echo "<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>STEP-Projekt</title>
<meta name='viewport' content='width=device-width, initial-scale=1'/>
<link rel='stylesheet' href='/docker-step2022team08-web/step/style.css'> 
<body>"

namenauscsv=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d "|" -f 6| sort| uniq| tail -n +2)


echo "<form action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-01.sh' method='get'>
   <label for='schiffnamen'>SCHIFFNAME:</label>
   <select id='schiffnamen' name='schiffnamen'>"

#mit while Schleife die Schiffsnamens auslesen und dann darum die option Tags, damit die Schiffsnamen in der Dropdownauswahl erscheinen
echo "$namenauscsv" | while read line; do echo "<option value='$line'>$line</option>"; done

echo "</select>
<br><br>
<input type='submit' value='Absenden'>
    </form>"

echo "<form action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh'>
<label for='sortierung'>Sortierung:</label>
<select id='sortierung' name='seite=$seite&sortierung'>
<option value='k1'>Datum aufwärts</option>
<option value='k1 -r'>Datum abwärts</option>
<option value='k2'>MMSI aufwärts</option>
<option value='k2 -r'>MMSI abwärts</option>
<option value='k3'>Name aufwärts</option>
<option value='k3 -r'>Name abwärts</option>
</select>
<input type='submit' value='Absenden'>
</form>"


#aus der Rhodes Datei werden nur die relevanten Felder mit cut rausgeschnitten. Mittels der Sortiervariable aus dem querystring findet hier auch die Sortierung zum Schluss statt.
echo "<div class='matrix-box'>"
datei=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d"|" -f 1,3,6,9,10,11,12 | sort -t"|" -k2 -r| uniq -s19 | sort -t"|" -$sortierung)
echo "$datei"| head -n"$anzahl" | tail -n49 | while IFS="|" read last mmsi name lae1 lae2 brei1 brei2; do echo "<div class='schiff-box'>$mmsi<br> $name<br> Länge: $((lae1+lae2))<br> Breite: $((brei1+brei2))<br> <a href='https://www.marinetraffic.com/en/ais/details/ships/mmsi:$mmsi' target='_blank'>Marinetraffic (externer Link)</a><br> Zuletzt gesehen: $last <br></div>" ; done
echo "</div>"


echo "<div class='mitte'> <a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh?seite=$((seite-1))&sortierung=$sortierung'>vorherige Seite</a> | <a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh?seite=$((seite+1))&sortierung=$sortierung'>nächste Seite</a></div>"

echo "</body>
</html>"
