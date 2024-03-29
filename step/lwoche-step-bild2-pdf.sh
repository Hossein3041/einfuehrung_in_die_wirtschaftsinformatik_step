#!/bin/bash
echo "content-type: application/pdf"
echo

mkdir -p /tmp/lwoche-$$
#Es wird Ein Verzeichnis im tmp Ordner mit der aktuellen Prozess ID erstellt
cd /tmp/lwoche-$$

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
#Die Zeichen welche nicht im ASCII Code vorhanden sind werden aus dem Query String in der URL zurück in ihre normale Form zurück geändert / Übersetzt


schiff=$(echo "$qscodiert" | cut -d '=' -f2)
#Der Name vom gesuchten Schiff wird aus dem Query String in die Variable geschrieben.


grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$schiff" /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d" " -f1 | sort | uniq -c | while read zahl datum; do echo "$datum $zahl"; done > lwoche.dat
#Aus der Rhodes-5 Datei werden all Einträge mit dem gesuchten Namen gefiltert, das Datum jeder rausgeschrieben, diese Sortiert und die Menge jedes Datums gezählt und in eine Datei (im erstellten TMP Ordner) geschrieben


cp /home/docker-step2022team08/step/lwoche-pdf.gp .

gnuplot lwoche-pdf.gp
#Die gnuplot Datei wird aufgerufen um den Graphen zu erstellen

cat lwoche.pdf

cd /tmp
rm -rf lwoche-$$
#Das Verzeichnis welcher zu beginn erstellt wurde wird wieder gelöscht

