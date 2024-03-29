set terminal pngcairo  size 1280,600 font 'sans,12' 
set out '/var/www/html/docker-step2022team08-web/step/beispiel.png'
set title "Zeitreihe"
set xdata time
set timefmt '%Y-%m-%d'
set xrange [ '2023-01-21': ]
set format x '%d.%m.%Y' 
plot 'beispiel.txt' using 1:2  title 'Sicherung'  with  lines  \
     linewidth 4  linecolor rgb '#204080'
