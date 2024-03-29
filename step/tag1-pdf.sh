#!/bin/bash
echo "content-type: application/pdf"
echo

mkdir -p /tmp/tag-$$
cd /tmp/tag-$$
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

schiff=$(echo "$qscodiert" | cut -d '=' -f2)

grep "^[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|$schiff" /var/www/html/docker-step2022team08-web/step/rhodes-5.csv | cut -d"|" -f1 | cut -d" " -f2 | sort | uniq -w2 -c | sed "s/:.*//g"| while read zahl tag; do echo "$tag $zahl"; done > tag.dat

cp /home/docker-step2022team08/step/tag-pdf.gp .

gnuplot tag-pdf.gp

cat tag.pdf

cd /tmp
rm -rf tag-$$
