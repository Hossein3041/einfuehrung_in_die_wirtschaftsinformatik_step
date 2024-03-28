#!/bin/bash
grep "oliver" person.txt > schritt-01.txt
grep "karin" person.txt >> schritt-01.txt
grep "stud" person.txt | grep "geboren:19" >> schritt-01.txt
grep "nachname:f" person.txt| grep "vorname:f" >> schritt-01.txt
cat schritt-01.txt | sort | uniq |nl -n ln > schritt-02.txt
cp schritt-02.txt /home/step2022/wochenblogs/hosakbari/loesung-02.txt
cat schritt-02.txt
step-pruefe-aufgabe-02.sh
