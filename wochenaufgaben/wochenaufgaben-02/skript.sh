#!/bin/bash
grep -E -w "vorname:oliver|vorname:karin" person.txt > dreib.txt
grep "stud" person.txt | grep "geboren:19" >> dreib.txt
grep "nachname:f" person.txt | grep "vorname:f" >> dreib.txt
cat dreib.txt | sort | uniq | nl -n ln > loesung-02.txt | cp loesung-02.txt /home/step2022/wochenblogs/hosakbari/
step-pruefe-aufgabe-02.sh
