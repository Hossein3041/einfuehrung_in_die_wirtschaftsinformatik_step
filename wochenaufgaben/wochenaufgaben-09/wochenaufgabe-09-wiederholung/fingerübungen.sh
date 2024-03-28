#/bin/bash

#Schreibt ein kleines cgi-Script,
#das mit grep aus einer Datei
#Zeilen filtert und diese als
#reinen Text ausgibt (text/plain).



#Schreibt ein cgi-Script, das den
#Anfang einer Html-Seite mit cat
#aus einer Datei liest und
#rausschreibt, dann mit einer
#while-Schleife aus einer csv-Datei
#liest und mit echo jede Zeile
#wieder mit zusätzlichem <br>-Tag
#rausschreibt und schließlich
#das Ende der Html-Seite wieder
#aus einer Datei liest.


#Nutzt das Verzeichnis /tmp/
#um im Verlaufe des cgi-Scripts
#zunächst eine Html-Datei
#zu erzeugen, die am Ende
#des cgi-Scriptes mit cat
#komplett rausgeschrieben wird.


#Messt die vergangene Zeit von
#Beginn des Script-Aufrufes bis
#zum Ende und hängt die Zeit
#mit echo an eine Datei namens
#/tmp/cgi-timing.txt an.
#Messt die Zeit des Aufrufes von
#hopper aus per curl mit time und
#vergleicht die Zeit mit der in
#dem Script gemessenen Zeit.
