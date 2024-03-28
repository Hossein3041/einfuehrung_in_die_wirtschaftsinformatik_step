#!/bin/bash
cat teams-pipe.txt | while IFS="|" read team a b c d e f g h i;
do echo "$team $a $team $b $team $c $team $d $team $e $team $f $team $g $team $h $team $i" > team-getrennt.txt;
done



