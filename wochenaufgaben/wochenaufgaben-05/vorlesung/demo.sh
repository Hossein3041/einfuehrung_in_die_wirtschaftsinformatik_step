#!/bin/bash
filename="data.txt"
meinevariable="das ist der inhalt"
echo "inhalt von meinevariable $meinevariable"

cat "$filename"| sort -r

if ls /gibtesnicht; then
  echo "gibt es nicht"
fi
if ls . ; then
  echo gibt es
fi

cat $filename|while read a b c; do
  echo "$a-$b-$c"
done

#java                     bash
#while (...) { }          while programm; do ... done
#if(...) { }              if programm; then ... fi
#                         exit codes: $?
#args[]                   "$@" $1 $2 $3
#for(..;..;..) { }        for((..;..;..))
#for(int i: arr){ ... }   for i in a b c d; do ... done
#String s = ".."          s="das ist ${var}"
#int var = 7; var++;      var=$((7+1))
#                         test  [   [[
#                         {a..z}
#                         find |xargs
#Scanner                  read
#                         while true; do ... done
#Threads                  Prozesse
