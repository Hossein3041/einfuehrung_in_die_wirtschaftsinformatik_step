#!/bin/bash
echo "<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Das ist der Titel</title>
  </head>
  <body>
    <table>" > aufgabe-06.html
    cat $1 | sed "s/^/<tr><td>/g" | sed "s/$/<\/td><\/tr>/g" >> aufgabe-06.html
    echo "</table>
  </body>
</html>" >> aufgabe-06.html
cp aufgabe-06.html /var/www/html/$USER/
