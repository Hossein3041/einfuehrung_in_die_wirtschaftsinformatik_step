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




stunde=$(echo "$qscodiert"| cut -d "=" -f 1)
schiffname=$(echo "$qscodiert"| cut -d "=" -f 3| cut -d "&" -f 1 )
MMSI=$(echo "$qscodiert"| cut -d "=" -f 4)

zeile=$(cat typ-05.csv| grep "$schiffnamen"| grep "$datum"| grep "$uhrzeit")

a=$(echo "$zeile"| cut -d "|" -f 6)
b=$(echo "$zeile"| cut -d "|" -f 3)
f=$(echo "$zeile"| cut -d "|" -f 16)
g=$(echo "$zeile"| cut -d "|" -f 17)
h=$(echo "$zeile"| cut -d "|" -f 18)



stunden=$(( $f * 720 + $g * 24 + $h ))

#echo "stunde schiffname MMSI" > zahlen.dat
#echo "$stunde $schiffname $MMSI $stunden" >> zahlen.dat

echo "$stunden"
file="daten.dat"


#Gnuplot-Skript erzeugen

gnuplot_file="test.gp"
echo "set terminal pngcairo size 2048,1024 font 'Verdana,32'" > $gnuplot_file
echo "set output '$schiffname.png'" >> $gnuplot_file
echo "set xlabel 'Schiffsname'" >> $gnuplot_file
echo "set ylabel 'Ankuftszeit in (h)'" >> $gnuplot_file
echo "set style fill solid border rgb 'black" >> $gnuplot_file
echo "set boxwidth 0.4 relative" >> $gnuplot_file
echo "set xrange [0:100]" >> $gnuplot_file
echo "set yrange [0:1500]" >> $gnuplot_file
echo "set xtics 10" >> $gnuplot_file
echo "set ytics 100" >> $gnuplot_file


echo "plot '$file' using 1:2 with boxes linewidth 4 linecolor rgb 'orange' title '$schiffname'" >> $gnuplot_file


#Gnuplot ausführen
gnuplot $gnuplot_file

cp $schiffname.png /var/www/html/docker-step2022team08-web/









echo "Content-type: image/png"
echo ""
cat $schiffname.png
