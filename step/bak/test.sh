#!/bin/bash

datum=$(cat typ-05.csv | grep "$schiffnamen"| cut -d '|' -f 1| cut -d ' ' -f 1 | sort| uniq)
  datum_neu=""

 echo "$datum"

 echo "$datum" while read -r line; do datum_neu="$datum_neu\n$line"; done

  echo "
  <form action='https://informatik.hs-bremerhaven.de/docker-step2022team08-web/cgi-bin/step/zweite-seite.sh    '>
  <label for='datum'>Wählen Sie einen Datum aus:</label>
  <select id='datum' name='datum'>
  "


 for dat in $datum_neu; do echo "<option value='$dat'>$dat</option>"; done

  echo "
  </select>
  <input type='submit' value='Absenden'>
  </form>
  "
