#!/bin/bash

cat rhodes.txt | grep "^[^|]*|5" | cut -d "|" -f 3,6 | sort | uniq > mmsi-hosakbari.txt

grep "|hamburg" mmsi-harbor.txt | cut -d "|" -f 1 | sort > hamburg.txt
grep "|luebeck" mmsi-harbor.txt | cut -d "|" -f 1 | sort > luebeck.txt

join hamburg.txt luebeck.txt > beidehafen.txt
join -t "|" mmsi-hosakbari.txt beidehafen.txt | cut -d "|" -f 2| sort > loesung-03.txt

cp loesung-03.txt /home/step2022/wochenblogs/hosakbari
step-pruefe-aufgabe-03.sh

#!/bin/bash
#
# cat rhodes.txt | grep "[^|]*|5" | cut -d "|" -f 3,6 | sort | uniq > mmsi-hosakbari.txt
#
# grep "|hamburg" mmsi-harbor.txt | cut -d "|" -f 1 | sort > hamburg.txt
# grep "|luebeck" mmsi-harbor.txt | cut -d "|" -f 1 | sort > luebeck.txt
#
# join hamburg.txt luebeck.txt > beidehafen.txt
# join -t "|" mmsi-hosakbari.txt beidehafen.txt | cut -d "|" -f 2 | sort > loesung-03.txt
#
# cp loesung-03.txt /home/step2022/wochenblogs/hosakbari
# step-pruefe-aufgabe-03.sh
