#!/bin/bash
echo "content-type: image/png"
echo

mkdir -p /tmp/lwoche-$$
# Ein Verzeichnis wird im Temp Ordner mit der aktuellen Prozess ID erstellt

cd /tmp/lwoche-$$     
# Das Skript wechselt in das erstellte Verzeichnis

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


schiff=$(echo "$qscodiert" | cut -d '=' -f2)
#Der Name vom gesuchten Schiff wird aus dem Query String in die Variable geschrieben.

grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$schiff" /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d" " -f1 | sort | uniq -c | while read zahl datum; do echo "$datum $zahl"; done > lwoche.dat
# Aus rhodes-5.csv werden alle Einträge, für den gesuchten Namen gefiltert.
# Alle Daten für diesen Namen werden rausgeschrieben. Diese werden sortiert, und mit uniq -c, die Häufigkeit jedes Datums geschrieben.
# Diese werden in dem tmp-Verzeichnis, in lwoche.dat geschrieben.




cp /home/docker-step2022team08/step/lwoche.gp .
# Die gnuplot Datei zum erstellen der Grafik wird ebenfalls in den tmp-Verzeichnis, in den aktuellen Verzeichnis (durch den Punkt) kopiert.

gnuplot lwoche.gp
# Die gnuplot Datei wird aufgerufen um den Graphen zu erstellen.

cat lwoche.png
# Die Datei vom Graphen wird aufgerufen und auf der Seite angezeigt

cd /tmp
# Das Programm wechselt raus aus dem Verzeichnis in das TMP Verzeichnes selbst

rm -rf lwoche-$$
# Das Verzeichnis welcher zu beginn erstellt wurde wird wieder gelöscht
