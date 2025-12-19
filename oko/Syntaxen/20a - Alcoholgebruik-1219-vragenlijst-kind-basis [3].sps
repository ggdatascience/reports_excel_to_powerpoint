* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Alcoholgebruik-1219-vragenlijst-kind-basis .
*** Versie 3 - 30 augustus 2023 .
*** Standaard vastgesteld op 27 maart 2023 .
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************

*** AANPASSINGEN 2023 TEN OPZICHTE VAN VORIGE VERSIE (versie 2.1):.
* kleine tekstuele wijzigingen doorgevoerd door het omzetten van matrixvragen in losse vragen en in de formulering van de antwoordopties. 
* LBAGK398 komt te vervallen, omdat de bijbehorende vraag niet is gesteld.

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** LBAGK3S11: % dat ooit alcohol heeft gedronken (een heel glas of meer)
*** LBAGK3S12: % dat ooit alcohol heeft gedronken (alleen een paar slokjes of een heel glas of meer)
*** LBAGK3S20: % dat de laatste 4 weken alcohol heeft gedronken

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  LBAGK391 'Heb je ooit alcohol gedronken?'/
  LBAGK399 'Op hoeveel dagen heb je in de laatste 4 weken alcohol gedronken?' .
EXECUTE .

VALUE LABELS
  LBAGK391 1 'Ja, een heel glas of meer' 2 'Ja, alleen een paar slokjes' 3 'Nee' 9 'Onbekend'/
  LBAGK399 1 'Nooit' 2 '1 of 2 dagen' 3 '3 tot en met 5 dagen' 4 '6 tot en met 9 dagen' 5 '10 dagen of meer' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGK391 LBAGK399 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK391 LBAGK399 (9) .
EXECUTE .

*** Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBAGK391) LBAGK391 = 9 .
IF missing (LBAGK399) LBAGK399 = 9 .
EXECUTE .

* Op basis van de voorlopervraag LBAGK391 de vervolgvraag LBAGK399 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: LBAGA399 .
COMPUTE LBAGA399 = LBAGK399 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBAGK399) LBAGA399 = 9 .
EXECUTE .

* Als bij de voorlopervraag LBAGK391 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (LBAGK391) LBAGA399 = 9 .
EXECUTE .

* Als de voorlopervraag LBAGK391 met 'nee' is beantwoord, dan wordt de vervolgvraag op 'nvt' (waarde 8) gezet .
IF (LBAGK391 = 3) LBAGA399 = 8 .
EXECUTE .

VARIABLE LABELS 
  LBAGA399 'Op hoeveel dagen heb je in de laatste 4 weken alcohol gedronken? (opgeschoond)' .
EXECUTE .

VALUE LABELS
  LBAGA399 1 'Nooit' 2 '1 of 2 dagen' 3 '3 tot en met 5 dagen' 4 '6 tot en met 9 dagen' 5 '10 dagen of meer' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGA399 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGA399 (9) .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat ooit alcohol heeft gedronken (een heel glas of meer) .

RECODE LBAGK391 (1=1)(2=0)(3=0)(else=copy) into LBAGK3S11 .
EXECUTE .

VARIABLE LABELS 
  LBAGK3S11 'Ooit alcohol gedronken (heel glas of meer)' .
EXECUTE .
 
VALUE LABELS 
  LBAGK3S11 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGK3S11 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S11 (9) .
EXECUTE .

* Aanmaken indicator: % dat ooit alcohol heeft gedronken (alleen een paar slokjes of een heel glas of meer) .

RECODE LBAGK391 (1=1)(2=1)(3=0)(else=copy) into LBAGK3S12 .
EXECUTE .

VARIABLE LABELS 
  LBAGK3S12 'Ooit alcohol gedronken (alleen slokjes of heel glas of meer)' .
EXECUTE .
 
VALUE LABELS 
  LBAGK3S12 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGK3S12 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S12 (9) .
EXECUTE .

* Aanmaken indicator: % dat de laatste 4 weken alcohol heeft gedronken .

RECODE LBAGA399 (1=0)(2 thru 5=1)(8=0)(else=copy) into LBAGK3S20 .
EXECUTE .

VARIABLE LABELS 
  LBAGK3S20 'Laatste 4 weken alcohol gedronken' .
EXECUTE .
 
VALUE LABELS 
  LBAGK3S20 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGK3S20 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S20 (9) .
EXECUTE .


*** EINDE VAN DE SYNTAX ***

