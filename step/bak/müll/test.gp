set terminal pngcairo size 2048,1024 font 'Verdana,32'
set output '$schiffname.png'
set xlabel 'Schiffsname'
set ylabel 'Ankuftszeit in (h)'
set style fill solid border rgb 'black
set boxwidth 0.4 relative
set xrange [0:15]
set yrange [0:1500]
set xtics 1
set ytics 100
plot 'quadrat.dat' using 1:2 with boxes linewidth 4 linecolor rgb 'pink' title 'Acidum'
