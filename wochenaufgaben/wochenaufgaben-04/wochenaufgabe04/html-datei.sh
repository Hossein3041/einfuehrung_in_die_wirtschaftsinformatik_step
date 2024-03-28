#!/bin/bash
echo "<!doctype html>
<html>
<head>
 <title>Das ist der Titel</title>
</head>
<body>
 <table>" > csv-in-html.txt
 sed "s/^/<tr><td>/g" datei.txt | sed "s/|/<\/td><td>/g" | sed "s/$/<\/td></tr>/g" >> csv-in-html.txt
 echo "</table>" >> csv-in-html.txt
 echo "</body>
</html>" >> csv-in-html.txt
tidy -i -q csv-in-html.txt > csv-in-html.html


#!/bin/bash
#
# echo "<!doctype html>
# <html>
# <head>
#   <title> Das ist der Titel </title>
# </head>
# <body>
#   <table>" > csv-in-html.txt
#  sed "s/^/<tr><td>/g" datei.txt | sed "s/|/<\/td><td>/g" | sed "s/$/<\/td><\/tr>/g" >> csv-in-html-txt
#  echo "</table>" >> csv-in-html.txt
#  echo "</body>
#        </html>" >> csv-in-html.txt
#  tidy -iq csv-in-html.txt > csv-in-html.html
