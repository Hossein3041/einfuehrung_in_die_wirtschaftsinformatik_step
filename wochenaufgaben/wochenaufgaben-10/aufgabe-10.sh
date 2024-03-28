#!/bin/bash
cat /home/step2022/rhodes-2022-12-17.txt| grep "^[^|]*|1|"| cut -d "|" -f 1| cut -d ":" -f 1,2| cut -d " " -f 2| uniq -c| nl | awk -F " " '{ print $1 "|" $2 "|" $3 "|" }'| sed "s/|/ /g" > loesung-10.txt
cat loesung-10.txt





