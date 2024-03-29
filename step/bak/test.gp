set terminal pngcairo size 2048,1024 font 'Verdana,32'
set output 'nico.png'
set xlabel 'Schiffsname'
set ylabel 'Ankuftszeit in (h)'
set style fill solid border rgb 'black
set boxwidth 0.4 relative
set xrange [0:100]
set yrange [0:1500]
set xtics 10
set ytics 100
plot 'zahlen.dat' using 1:2 with boxes linewidth 4 linecolor rgb 'orange' title 'Acidum'
