#!/bin/bash
qscodiert=$(echo "$QUERY_STRING" | sed 's/+/ /g' \
                                 | sed 's/%20/ /g' \
                                 | sed 's/%21/!/g' \
                                 | sed 's/%22/"/g' \
                                 | sed 's/%23/#/g' \
                                 | sed 's/%24/$/g' \
                                 | sed 's/%25/%/g' \
                                 | sed 's/%26/\&/g' \
                                 | sed 's/%28/(/g' \
                                 | sed 's/%29/)/g' \
                                 | sed 's/%2A/*/g' \
                                 | sed 's/%2B/+/g' \
                                 | sed 's/%2C/,/g' \
                                 | sed 's/%2F/\//g' \
                                 | sed 's/%3A/:/g' \
                                 | sed 's/%3B/;/g' \
                                 | sed 's/%3C/</g' \
                                 | sed 's/%3D/=/g' \
                                 | sed 's/%3E/>/g' \
                                 | sed 's/%3F/?/g' \
                                 | sed 's/%40/@/g' \
                                 | sed 's/%5B/[/g' \
                                 | sed 's/%5C/\\/g' \
                                 | sed 's/%5D/]/g' \
                                 | sed 's/%5E/\^/g' \
                                 | sed 's/%5F/_/g' \
                                 | sed 's/%60/`/g' \
                                 | sed 's/%7B/{/g' \
                                 | sed 's/%7C/|/g' \
                                 | sed 's/%7D/}/g' \
                                 | sed 's/%7E/~/g')

echo "Content-type: text/html"
echo ""

suche=$(echo "$qscodiert" | cut -d"=" -f2)
cd /tmp
mkdir -p data
rm -rf data/*

i=0
#liest die letzten 10 Zeilen aus der rhodes Datei von diesem Schiff aus und liest den Output mit while zeilenweise ein und erzeugt für jede Zeile ein eigenes Bild.
grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$suche" /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | tail -n10 | while read line; do
  i=$((i+1))
  name=data/image-$((1000+i))
  convert -size 2500x300 canvas:skyblue \
  -fill blue -stroke black  \
  -fill black -font Roboto -pointsize 30 \
  -gravity center \
  -draw "text 0,0 '$line'"\
  $name.png
done
#erzeugt aus den Bilder mit ffmpeg ein Video
ffmpeg -y -r 3 -i data/image-1%3d.png -pix_fmt yuv420p data/video.mp4
