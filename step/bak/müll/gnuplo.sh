#!/bin/bash


#QUERY_STRING in einer Variable speichern

#test=$(echo $QUERY_STRING | sed 's/[^0-9,]//g')


#Daten in eine Datei schreiben

#echo "$test" > gnuplo.dat

#Datei mit den Daten

file="quadrat.dat"


# Gnuplot-Skript erzeugen
gnuplot_file=" abc.gp"
echo "set terminal pngcairo size 2048,1024 font 'Verdana,32'" > $gnuplot_file
echo "set output 'gnuplo.png'" >> $gnuplot_file
echo "set xlabel 'Schiffsname'" >> $gnuplot_file
echo "set ylabel 'Ankuftszeit in (h)'" >> $gnuplot_file
echo "set style fill solid border rgb 'black" >> $gnuplot_file
echo "set boxwidth 0.4 relative" >> $gnuplot_file
echo "set xrange [0:100]" >> $gnuplot_file
echo "set yrange [0:1500]" >> $gnuplot_file
echo "set xtics 10" >> $gnuplot_file
echo "set ytics 100" >> $gnuplot_file


echo "plot '$file' using 1:2 with boxes linewidth 4 linecolor rgb 'orange' title 'Acidum'" >> $gnuplot_file


# Gnuplot ausführen
gnuplot $gnuplot_file

cp gnuplo.png /var/www/html/docker-step2022team08-web/
