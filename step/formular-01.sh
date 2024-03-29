#!/bin/bash
echo "Content-Type: text/html"
echo ""



echo "<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>STEP-Projekt</title>
<meta name='vieweport' content='width=device-width, initial-scale=1'/>
<link rel='stylesheet' href='/docker-step2022team08-web/step/style.css'>
<body>"
#Das soll auf der zweite Seite stehen , nachdem man der Name von Schiffe auswählt . Man kann zur vorherige Seite zurückkehren (Hauptseite).
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh'>Zurück</a>"
echo "<br>"
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

#-------------------------------------------
# Hierbei werden aus rhodes-5.csv, die Spalten mit den Schiffnamen rausgenommen. Diese werden sortiert, und die doppelten Namen weg gemacht.
namenauscsv=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d "|" -f 6| sort| uniq)

# Hierbei werden aus dem $qs-codiert "schiffnamen=ACADIA DESGAGNES", der Schiffname gefiltert.
schiffnamen=$(echo $qscodiert| cut -d "=" -f 2)

# Hierbei wollen wir für den jeweiligen Schiffnamen, alle Daten rausnehmen, und diese in $datum reinschreiben.
# Dafür nehmen wir für den Schiffnamen, die Daten, und tun diese, mit einer while-Schleife, untereinander, und speichern diese in $datum.
datum=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$schiffnamen"| cut -d '|' -f 1| cut -d ' ' -f 1 | sort| uniq| while read -r line; do echo "$line <br>"; done)
#----------------------------------------------




# Wenn $namenauscv nicht NULL ist, dann tue folgendes:
if [ -n "$namenauscsv" ]; then


echo "<form class='mitte' action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-02.sh?teil-1=$schiffnamen' method='get' disabled>
   <label for='schiffnamen'>SCHIFFNAME:</label>
   <select id='schiffnamen' name='schiffnamen' disabled>" # Schreibe einen Dropdown für Schiffnamen, die jedoch deaktiviert ist.

cat $namenauscsv| while IFS="=" read i; do echo "<option value='$i'>'$i'</option>"; done
echo "</select>


<br>
<label for='datum'>DATUM:</label>
<select id='datum' name='datum'>" # Schreibe einen Dropdown für Daten, die für den jeweiligen Schiff gedacht sind.

# Aufgrund dessen, dass die Variable $datum, in jeder zweiten (geraden) Zeile, eine leere Zeile enthählt, soll durch der untigen if-Verzweigung, alle geraden Zeilen in den Dropdown geschrieben werden.
# In diese Zeilen sind die Daten drinne.
# Hierfür wird durch einen Counter, jeder Zeile, einen nach oben aufzählenden Wert zugewiesen:
#       1. Zeile bekommt 0
#       2. Zeile bekommt 1
#       3. Zeile bekommt 2
#       4. ...
# der, wenn diese modulo zwei genommen, 0 ist, ausgeführt wird.

   counter=0
 for dat in $datum; do
   if [ $((counter % 2 )) -eq 0 ]; then
   echo "<option value='$dat'>$dat</option>"
   echo "disabled"
   fi
   counter=$((counter + 1));
 done


# Es wird hierbei durch einen Hidden-Tag, der ausgewählte Schiffname, in den QUERY_STRING, ebenfalls weitergegeben.
echo "</select>
<br><br>

<input type='hidden' name='schiffnamen' value='$schiffnamen'>
<input type='submit' value='Absenden'>
</form>"

fi

echo "</body>
</html>"
