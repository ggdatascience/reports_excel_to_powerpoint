* Encoding: UTF-8.
*aanmaken variabele afgelopen 4 weken zonder slokjes drinkers.
*GESC 2 juni 2020, ook voor CGM 2021 doen.

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** LBAGK3S13 'Laatste 4 weken alcohol gedronken (heel glas of meer)' .
*** LBAGK3S25 'Laatste 4 weken 5 of meer drankjes bij 1 gelegenheid (binge drinken)(heel glas of meer)' .
*** LBAGK3S26 'Ooit dronken of aangeschoten geweest (heel glas of meer)' .
*** LBAGK3S27 'Laatste 4 weken dronken of aangeschoten (heel glas of meer)' .

*aanmaken variabele alcohol zonder slokjes drinkers, wordt landelijk niet aangemaakt.
*pas runnen na basissyntax alcohol.

*CROSSTABS
  /TABLES=LBAGK3S20 BY LBAGK391
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

COMPUTE LBAGK3S13 = LBAGK3S20.

IF (LBAGK391 = 2) LBAGK3S13 = 0 .
EXECUTE .

IF missing (LBAGK3S13) LBAGK3S13 = 9.
EXECUTE.

VARIABLE LABELS 
  LBAGK3S13 'Laatste 4 weken alcohol gedronken (heel glas of meer)' .
EXECUTE .
 
VALUE LABELS 
  LBAGK3S13 0 'Nee' 1 'Ja' 9 'onbekend' .
EXECUTE .

FORMATS
  LBAGK3S13 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S13 (9) .
EXECUTE .

FREQUENCIES LBAGK3S13 LBAGK3S20.
EXECUTE.


*Aanmaken indicator: LBAGK3S25 binge drinken afgelopen 4 weken (heel glas of meer).

COMPUTE LBAGK3S25 = LBAGK3S15.

IF (LBAGK391 = 2) LBAGK3S25 = 0 .
EXECUTE .

IF missing (LBAGK3S25) LBAGK3S25 = 9.
EXECUTE.

VARIABLE LABELS 
  LBAGK3S25 'Laatste 4 weken 5 of meer drankjes bij 1 gelegenheid (binge drinken)(heel glas of meer)' .
EXECUTE .

VALUE LABELS 
  LBAGK3S25 0 'Nee' 1 'Ja' 9 'onbekend' .
EXECUTE .

FORMATS
  LBAGK3S25 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S25 (9) .
EXECUTE .

*Aanmaken indicator: LBAGK3S26: % dat ooit dronken of aangeschoten is geweest (heel glas of meer) 

COMPUTE LBAGK3S26 = LBAGK3S16.

IF (LBAGK391 = 2) LBAGK3S26 = 0 .
EXECUTE .

IF missing (LBAGK3S26) LBAGK3S26 = 9.
EXECUTE.

VARIABLE LABELS 
  LBAGK3S26 'Ooit dronken of aangeschoten geweest (heel glas of meer)' .
EXECUTE .

VALUE LABELS 
  LBAGK3S26 0 'Nee' 1 'Ja' 9 'onbekend' .
EXECUTE .

FORMATS
  LBAGK3S26 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S26 (9) .
EXECUTE .

* Aanmaken indicator: LBAGK3S27 % dat de laatste 4 weken dronken of aangeschoten is geweest zonder slokjes drinkers.

COMPUTE LBAGK3S27 = LBAGK3S17.

IF (LBAGK391 = 2) LBAGK3S27 = 0 .
EXECUTE .

IF missing (LBAGK3S27) LBAGK3S27 = 9.
EXECUTE.

VARIABLE LABELS 
  LBAGK3S27 'Laatste 4 weken dronken of aangeschoten (heel glas of meer)' .
EXECUTE .

VALUE LABELS 
 LBAGK3S27 0 'Nee' 1 'Ja' 9 'onbekend' .
EXECUTE .

FORMATS
  LBAGK3S27(F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S27 (9) .
EXECUTE .


*EINDE SYNTAX.
