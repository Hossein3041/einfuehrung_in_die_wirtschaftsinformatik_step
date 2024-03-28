#!/bin/bash

 
echo "$QUERY_STRING" | grep -q "^mmsi=[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$"

mmsi=$(echo "$QUERY_STRING" | cut -d '=' -f2)



echo 'content-type: text/html'
echo 
echo '<!DOCTYPE HTML><html><head>'
echo "<title>$mmsi</title>"
echo '<meta charset="utf-8"></head><body><table>'

cat teil1.txt | sed 's/[ ]*\t/|/g' | sed 's/^/<tr><td>/g' | sed 's/|/<\/td><td>/g' | sed 's/$/<\/td><\/tr>/g' > teil2.txt


if test $QUERY_STRING 
then 
  echo $(cat teil2.txt) 
else
  echo 'incorrect request' 
fi


echo '</table></body></html>'



