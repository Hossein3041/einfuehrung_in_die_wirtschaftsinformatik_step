#!/bin/bash
echo "Content-Type: text/html"
echo ""
echo "
<!doctype html>
<html>
  <head>
    <meta charset='utf-8'>
    <title>Wochentage</title>
  </head>
  <body>
    <div class='fieldset-container'> 
    <fieldset style='float: left;'>
    <legend>KALENDERWOCHE</legend>
    <form action='/docker-step2022team08-web/cgi-bin/swe1/ausgabe-kw.sh'>
      <label for=field1>Woche:</label>
      <select name="Woche">
      <option value='Auswählen'>Auswählen</option>
      <option value="KW1">KW1</option>
        <option value="KW2">KW2</option>
      </select>
      <br></br>
      <input type=submit value='Anschauen'>
   </form>
  </fieldset>
    <fieldset style='float: left;'>
        <legend>WOCHENTAG KW 1</legend>
        <form id='formular1' action='script.sh'>
          <label for=field1>Tag:</label>
          <select id='filter' name='filter'>
            <option value='Auswählen'>Auswählen</option>
            <option value='Montag'>Montag</option>
            <option value='Dienstag'>Dienstag</option>
            <option value='Mittwoch'>Mittwoch</option>
            <option value='Donnerstag'>Donnerstag</option>
            <option value='Freitag'>Freitag</option>
          </select>
          <br></br>
          <input type='submit' value='Anschauen'>
        </form>
      </fieldset>
      <fieldset style='float: left;'>
      <legend>WOCHENTAG KW 2</legend>
      <form id='formular2' action='script.sh'>
      <label for=field1>Tag:</label>
      <select id='filter' name='filter'>
        <option value='Auswählen'>Auswählen</option>
        <option value='Montag'>Montag</option>
        <option value='Dienstag'>Dienstag</option>
        <option value='Mittwoch'>Mittwoch</option>
        <option value='Donnerstag'>Donnerstag</option>
        <option value='Freitag'>Freitag</option>
      </select>
      <br></br>
      <input type='submit' value='Anschauen'>
    </form>
    </fieldset>
    </div>
  </body>
</html>"
