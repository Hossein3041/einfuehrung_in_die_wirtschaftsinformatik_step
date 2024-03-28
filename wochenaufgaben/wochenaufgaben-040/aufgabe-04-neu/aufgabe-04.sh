#!/bin/bash
cat rhodes.txt | grep '^[^|]*|5' | cut -d '|' -f3,6 | sort | uniq > schritt-01.txt
join -t '|' schritt-01.txt mmsi-harbor.txt | sort -t '|' -k2| nl -s '|' > schritt-02.txt

echo "<!doctype html>
<html>
 <head>
  <meta charset='utf-8'>
  <title>Titel</title>
  </head>
  <body>
  <table>
   <tr>
    <td>Nr</td><td>MMSI</td><td>Name</td><td>Hafen</td>
     </tr>" > aufgabe-04.html
     cat schritt-02.txt | sed 's/^/<tr><td>/g' | sed 's/|/<\/td><td>/g'| sed 's/$/<\/td><\/tr>/g' | tidy -iq >> aufgabe-04.html
    echo "</table>
  </body>
</html>" >> aufgabe-04.html
step-pruefe-aufgabe-04.sh
