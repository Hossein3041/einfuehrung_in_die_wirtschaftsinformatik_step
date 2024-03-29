#!/bin/bash

#-----------------------------------------------------------------------------------
# Sonderzeichen, die vorher falsch kodiert worden sind, werden abgefangen,
# und dann wieder in die richtige Form umgewandelt.
# ----------------Beispiel-------------------------
# Leerzeichen wird als "+" kodiert.
#
# Wir nehmen das "+", und wandeln es durch sed, wieder in Leerzeichen um. --> Also sed 's/+/ /g'
# ----------------------------------------------------------------------------------------------
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
#----------------------------------
# Hier wird getestet, ob $qscodiert, leer ist.
# Falls ja, dann ist der Inhalt von $qscodiert --> "seite=1&sortierung=k2
if test -z $qscodiert ; then qscodiert="seite=1&sortierung=k2"; fi
#-----------------------------------

# Der Inhalt von $qscodiert ist seite=2&sortierung=k2.
# Zunächst wollen wir den Wert von seite, also seite=2, in die Variable $seite reinschreiben.
seite=$( echo $qscodiert |cut -d"&" -f1 | cut -d"=" -f2)

# Hierbei wollen wir mit dem Wert der Variable $seite, den wir * 50 rechnen, den Wert von  der Variable $anzahl festlegen.
# Wenn der Wert von $seite, 2 ist, dann ist der Wert von $anzahl 100.
# Wenn der Wert von $seite, 3 ist, dann ist der Wert von $anzahl 150, usw. 
anzahl=$((seite*50))

# Hierbei wollen wir den Wert der Variable $sortierung festlegen.
# Hierfür brechen wir den Wert von $qscodiert, welches seite=1&sortierung=k2 ist, auf k2, und speichern dies in $sortierung
# Der Wert von $sortierung wird für den Befehl (sort -t"|" -$sortierung) eine große Rolle spielen.
# Durch $sortierung wird bestimmt, wonach das Ergebnis sortiert sein soll.
sortierung=$(echo $qscodiert | cut -d"&" -f2 | cut -d"=" -f2)
#-------------------------------------


echo "Content-Type: text/html"
echo ""


echo "<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>STEP-Projekt</title>

<meta name='viewport' content='width=device-width, initial-scale=1'/>
<link rel='stylesheet' href='/docker-step2022team08-web/step/style.css'> 
</head>
<body>"
#--------------------------------------
# Hierbei werden aus rhodes-5.csv, die Schiffnamen rausgenommen, die alle zusammen in einer Zeile geschrieben werden.
# Zuerst wird mit cut, die Spalte der Namen ausgewählt. Diese werden mit sort, sortiert, und danach mit uniq, die doppelten Namen weggemacht. Mit tail wählt man alle Namen, ab dem zweiten Namen aus.
namenauscsv=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d "|" -f 6| sort| uniq| tail -n +2)
#--------------------------------------
# Hier wird eine Überschrift geschrieben, die ebenfalls eine Verlinkung zur Teamwebseite darstellt.
echo "<h1 class='mitte'><a href='https://informatik.hs-bremerhaven.de/step2022team08/'>team08 Teamwebseite</a></h1>" 





#--------------------------------------
# Hierbei wird eine Dropdown-Formular, für die Schiffnamen festgelegt.
echo "<form action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-01.sh' method='get'>
   <label for='schiffnamen'>Schiffseinträge suchen:</label>
   <select id='schiffnamen' name='schiffnamen'>"

#mit while Schleife die Schiffsnamens auslesen und dann darum die option Tags, damit die Schiffsnamen in der Dropdownauswahl erscheinen
echo "$namenauscsv" | while read line; do echo "<option value='$line'>$line</option>"; done

echo "</select>
<input type='submit' value='Absenden'>
    </form><br>"
#-------------------------------------



# Hierbei wird eine Dropdown-Formular geschrieben, die zur Sortierung der Einträge gilt, für die jeweilige Seitenzahl.
# Die Seitenzahl mit $seite festgelegt.
echo "<form class='mitte' action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh'>
<label for='sortierung'>Sortierung:</label>
<select id='sortierung' name='seite=$seite&sortierung'>
<option value='k1'>Datum aufwärts</option>
<option value='k1 -r'>Datum abwärts</option>
<option value='k2'>MMSI aufwärts</option>
<option value='k2 -r'>MMSI abwärts</option>
<option value='k3'>Name aufwärts</option>
<option value='k3 -r'>Name abwärts</option>
</select>:
<input type='submit' value='Absenden'>
</form>"
#-------------------------------------





#aus der Rhodes Datei werden nur die relevanten Felder mit cut rausgeschnitten. Mittels der Sortiervariable aus dem querystring findet hier auch die Sortierung zum Schluss statt.
echo "<div class='matrix-box'>"


# Aus rhodes-5.csv werden die relevanten Spalten rausgeschnitten.
# Danach wird mit dem ersten sort und uniq dafür gesorgt, dass jede MMSI 1mal auftaucht.
# Mit dem zweiten sort beginnt die eigentliche Sortierung: Diese erfolgt mit $sortierung:
#               
#               1. Fall:   sort -t"|" -k[1,2,3,4,5,6,7]         - Je nachdem nach welcher Spalte (Datun und Uhrzeit, MMSI, Schiffname ...) man sortiert.
#               2. Fall:   sort -t"|" -k[1,2,3,4,5,6,7] -r      - Durch -r sortiert man diese umgekehrt.
#
datei=$(cat /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d"|" -f 1,3,6,9,10,11,12 | sort -t"|" -k2 -r| uniq -s19 | sort -t"|" -$sortierung)


# Hierbei sorgen wir dafür, dass zuerst die richtige Seitenanzahl gewählt wird:
# Wir teilen alle Einträge auf 7 Seiten, mit jeweils 50 Eiträgen.
# 
# Wollen Seite 2 aufrufen, dann nehmen wir aus der $datei mit Einträgen, mit head -n"$anzahl", die ersten x Einträgen. Also:
# 
#   head -n100 --> Hierdurch kommen die ersten 100 Einträgen.
#   head -n100 | tail -50  --> Hierdurch nehmen wir daraus dann die letzten 50 Einträgen.
#
# Je nachdem, welche Seite wir auswählen, wählen wir auch die ersten x Einträgen.
# Diese Einträge tun wir mit der while Schleife, jeweils folgendermaßen in Boxen rein:
#
# Hierfür wählen wir aus jedem Eintrag, die richtigen Spalten aus, und geben diese in einem div tag, untereinander wieder, jeweils mit einem br tag.
# Für Länge und Breite, rechnen wir diese mit den richtigen Spalten, in einer Kommando-Substitution aus.
echo "$datei"| head -n"$anzahl" | tail -n50 | while IFS="|" read last mmsi name lae1 lae2 brei1 brei2; do echo "<div class='schiff-box'>$mmsi<br> $name<br> Länge: $((lae1+lae2)) m<br> Breite: $((brei1+brei2)) m<br><a href='https://www.marinetraffic.com/en/ais/details/ships/mmsi:$mmsi' target='_blank'>Marinetraffic (externer Link)</a><br> Zuletzt gesehen: $last <br></div>" ; done
echo "</div>"






#-----------------------SEITENNAVIGATION-----------------------
echo "<div class='mitte'>";

# Wenn man bei Seite 1 ist, dann soll nur die aktuelle Seite, sowie die Verlinkung zur nächsten Seite auftauchen.
# Diese wird mit einer if-Verzweigung getestet.
if [ $seite -eq 1 ]; then

  echo "|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AKTUELLE SEITE: $seite&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  | <a style='text-decoration: none;' href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh?seite=$((seite+1))&sortierung=$sortierung'>NÄCHSTE SEITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>";


# Sonst, wenn man bei Seite 7 ist, dann soll keine Verlinkung zur nächsten Seite auftauchen, da es keine Einträge gibt.
elif [ $seite -eq 7 ]; then
  
  echo "<a style='text-decoration: none;' href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh?seite=$((seite-1))&sortierung=$sortierung'>VORHERIGE SEITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

  |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AKTUELLE SEITE: $seite&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  |";

# Sonst, wenn man zwischen Seite 2 und 6 ist, sollen Verlinkung zur vorherigen, sowie nächsten Seite auftauchen, sowie die aktuelle Seitenzahl gezeigt werden.
else

  echo "<a style='text-decoration: none;' href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh?seite=$((seite-1))&sortierung=$sortierung'>VORHERIGE SEITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

  |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AKTUELLE SEITE: $seite&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  | <a style='text-decoration: none;' href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh?seite=$((seite+1))&sortierung=$sortierung'>NÄCHSTE SEITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>";

fi

echo "</div>";

#--------------------KOMMENTAR ZUR SEITENNAVIGATION:--------------
#
# Es gibt folgende Situation:
# 
# Die Seitenzahlen sind so gemacht worden, dass die Einträge ab Seitenzahl 1 beginnen, und ab Seitenzahl 7 enden.
# Also: Vor Seitenzahl 1 kommen keine Einträge, und nach Seitenzahl 7 kommen ebenfalls keine Einträge. Deshalb habe ich den obigen Code geschrieben.
#
# Der Code funktioniert folgendermaßen:
#
#                Wenn Seitenzahl gleich 1 ist, dann schreibe:
#
#                KEINE SEITEN MEHR VERFÜGBAR | AKTUELLE SEITE: 1 | NÄCHSTE SEITE(Verlinkung)
#
#
#                Ansonsten, wenn Seitenzahl gleich 7 ist, dann schreibe:
#
#                VORHERIGE SEITE(Verlinkung) | AKTUELLE SEITE: 7 | KEINE SEITEN MEHR VERFÜGBAR
#
#                
#                Ansonsten (Also zwischen Seitenzahl 2 bis 6), schreibe:
#
#                VORHERIGE SEITE(Verlinkung) | AKTUELLE SEITE: [2-6] | NÄCHSTE SEITE
#-----------------------------------------------------------------
echo "</body>
</html>"
