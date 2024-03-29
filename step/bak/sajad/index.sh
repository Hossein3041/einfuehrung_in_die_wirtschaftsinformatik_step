#!/bin/bash
echo "Content-Type: text/html"
echo 

echo "<!doctype html>"
echo "<html>"
echo "<head>"
echo "<meta charset='utf-8'>"
echo "<title>Zurück-Button</title>"
echo "</head>"
echo "<body>"
#Das soll auf der zweite Seite stehen , nachdem man der Name von Schiffe auswählt . Man kann zur vorherige Seite zurückkehren (Hauptseite).
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/step.sh'>Zurück</a>"
echo "<br>"

#Das soll auf der dritte Seite stehen , nachdem man das Datum auswählt . Man kann zur vorherige Seite zurückkehren (Datumseite).
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-01.sh'>Zurück</a>"
echo "<br>"

#Das soll auf der vierte Seite stehen , nachdem man die Uhrzeit auswählt . Man kann zur vorherige Seite zurückkehren (Uhrzeitseite).
echo "<a href='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/formular-02.sh'>Zurück</a>"

echo "</body>"
echo "</html>"
