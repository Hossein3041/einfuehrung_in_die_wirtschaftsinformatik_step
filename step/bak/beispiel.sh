#!/bin/bash
echo "Content-Type: text/plain"
echo ""


cat typ-05-02.csv| while read line; do a=$(echo $line | cut -d "|" -f 1) \
                                    b=$(echo $line | cut -d "|" -f 2) \
                                    c=$(echo $line | cut -d "|" -f 3) \
                                    d=$(echo $line | cut -d "|" -f 4) \
                                    e=$(echo $line | cut -d "|" -f 5) \
                                    f=$(echo $line | cut -d "|" -f 6) \
                                    g=$(echo $line | cut -d "|" -f 7) \
                                    h=$(echo $line | cut -d "|" -f 8) \
                                    i=$(echo $line | cut -d "|" -f 9) \
                                    j=$(echo $line | cut -d "|" -f 10) \
                                    k=$(echo $line | cut -d "|" -f 11) \
                                    l=$(echo $line | cut -d "|" -f 12) \
                                    m=$(echo $line | cut -d "|" -f 13) \
                                    n=$(echo $line | cut -d "|" -f 14) \
                                    o=$(echo $line | cut -d "|" -f 15) \
                                    p=$(echo $line | cut -d "|" -f 16) \
                                    q=$(echo $line | cut -d "|" -f 17) \
                                    rr=$(echo $line | cut -d "|" -f 18) \
                                    s=$(echo $line | cut -d "|" -f 19) \
                                    t=$(echo $line | cut -d "|" -f 20) \
                                    u=$(echo $line | cut -d "|" -f 21) \
                                    v=$(echo $line | cut -d "|" -f 22) echo "$a"; done
