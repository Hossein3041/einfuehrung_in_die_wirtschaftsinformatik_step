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

namenauscsv=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d "|" -f 6| sort| uniq| tail -n +2)
schiffnamen=$(echo $qscodiert| cut -d "=" -f 3)
datum=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$schiffnamen"| cut -d '|' -f 1| cut -d ' ' -f 1 | sort| uniq| while read -r line; do echo "$line <br>"; done)
adatum=$(echo "$qscodiert"| cut -d "=" -f 2| cut -d "&" -f 1)
uhrzeit=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$schiffnamen"| grep "$adatum"| cut -d "|" -f 1| cut -d " " -f 2| sort| uniq| while read -r line; do echo "$line <br>"; done)
#Das soll auf der dritte Seite stehen , nachdem man das Datum auswählt . Man kann zur vorherige Seite zurückkehren (Datumseite).
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-01.sh?schiffnamen=$schiffnamen'>Zurück</a>"
echo "<br>"


if [ -n "$datum" ]; then


echo "<form class='mitte' action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-03.sh' method='get'>
   <label for='schiffnamen'>SCHIFFNAME:</label>
   <select id='schiffnamen' name='schiffnamen' disabled>"

cat $namenauscsv| while IFS="=" read i; do echo "<option value='$i'>'$i'</option>"; done
echo "</select>


<br>
<label for='datum'>DATUM:</label>
<select id='datum' name='datum' disabled>"


   counter=0
 for dat in $datum; do
   if [ $((counter % 2 )) -eq 0 ]; then
   echo "<option value='$dat'>$dat</option>"
   echo "disabled"
   fi
   counter=$((counter + 1));
 done

echo "</select>

<br>
<label for='datum'>UHRZET:</label>
  <select id='uhrzeit' name='uhrzeit'>"

     counter=0
   for uhr in $uhrzeit; do
     if [ $((counter % 2 )) -eq 0 ]; then
     echo "<option value='$uhr'>$uhr</option>"
     fi
     counter=$((counter + 1));
   done

  echo "</select>
  <br><br>
    <input type='hidden' name='datum' value="$adatum">
    <input type='hidden' name='schiffnamen' value='$schiffnamen'>     
     <input type='submit' value='Absenden'>
   </form>"

fi


echo "</body>
</html>"
