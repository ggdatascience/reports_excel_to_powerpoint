* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Gebruik wiet of hasj 12-19-jarigen.
*** Versie 4 / 20 november 2023.
*** Standaard vastgesteld op 23 maart 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.	
********************************************************************************************************

***Aanpassingen ten opzichte van versie 3 (19 oktober 2021).
*In de GMJ2023 wordt de vraag naar aantal dagen gebruik in je hele leven niet meer gesteld en de bijbehorende variabelen zijn daarom uit deze syntax gehaald.

***Aanpassingen ten opzichte van vorige versie (versie 3):
***VALUE LABELS LBSDK308, value code 1 'Nooit' is verwijderd, omdat dit antwoord niet mogelijk is.

*** AANPASSINGEN TEN OPZICHTE VAN DE VORIGE VERSIE (versie 2 / 11 januari 2016): .
*** In versie 3 zijn de variabelen LBSDK302 'Hoeveel dgn wiet of hasj in hele leven?' en LBSDK303 'Hoeveel dgn wiet of hasj in laatste 4 wkn?' vervangen door
*** LBSDK308 'Hoeveel dgn wiet of hasj in hele leven?' en LBSDK309  'Hoeveel dgn wiet of hasj in laatste 4 wkn?' vanwege het inperken van de antwoordcategorieën .
*** En daarmee zijn ook de opgeschoonde variabelen LBSDA302 en LBSDA303 vervangen door LBSDA308 en LBSDA309 .
*** In versie 3 is overal het woordje 'marihuana' weggehaald .


*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
* LBSDK3S1: % dat ooit wiet of hasj heeft gebruikt.
* LBSDK3S2: % dat in de laatste 4 weken wiet of hasj heeft gebruikt.


*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  LBSDK301 'Heb je ooit wiet of hasj gebruikt?'
  LBSDK309 'Op hoeveel dagen wiet of hasj gebruikt in laatste 4 weken?'.
EXECUTE .

VALUE LABELS 
  LBSDK301 1 'Ja' 2 'Nee' 9 'Onbekend'/
  LBSDK309 1 'Nooit' 2 '1 of 2 dagen' 3 '3 tot en met 5 dagen' 4 '6 tot en met 9 dagen' 5 '10 dagen of meer' 9 'Onbekend'.
EXECUTE .

FORMATS
  LBSDK301 LBSDK309 (F1.0).
EXECUTE .

MISSING VALUES
  LBSDK301 LBSDK309 (9).
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9.
IF missing (LBSDK301) LBSDK301 = 9.
IF missing (LBSDK309) LBSDK309 = 9.
EXECUTE .

* Op basis van de voorlopervraag LBSDK301 de vervolgvraag LBSDK309 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: LBSDA309 .
COMPUTE LBSDA309 = LBSDK309.
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9.
IF missing (LBSDK309) LBSDA309 = 9.
EXECUTE .

* Als bij de voorlopervraag LBSDK301 niets is ingevuld, dan worden de vervolgvragen op missend (waarde 9) gezet .
IF missing (LBSDK301) LBSDA309 = 9.
EXECUTE .

* Als de voorlopervraag LBSDK301 met 'nee' is beantwoord, dan worden de vervolgvragen op 'nvt' (waarde 8) gezet .
IF (LBSDK301 = 2) LBSDA309 = 8.
EXECUTE .

VARIABLE LABELS 
  LBSDA309 'Op hoeveel dagen wiet of hasj gebruikt in laatste 4 weken? (opgeschoond)' .
EXECUTE .

VALUE LABELS 
  LBSDA309 1 'Nooit' 2 '1 of 2 dagen' 3 '3 tot en met 5 dagen' 4 '6 tot en met 9 dagen' 5 '10 dagen of meer' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBSDA309 (F1.0) .
EXECUTE .

MISSING VALUES
  LBSDA309 (9) .
EXECUTE .


*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat ooit wiet of hasj heeft gebruikt.

RECODE LBSDK301 (1=1)(2=0)(else=copy) into LBSDK3S1 .
EXECUTE .

VARIABLE LABELS 
  LBSDK3S1 'Ooit wiet of hasj gebruikt' .
EXECUTE .

VALUE LABELS 
  LBSDK3S1 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBSDK3S1 (F1.0) .
EXECUTE .

MISSING VALUES
  LBSDK3S1 (9) .
EXECUTE .

* Aanmaken indicator: % dat de laatste 4 weken wiet of hasj heeft gebruikt .

RECODE LBSDA309 (1=0)(2 thru 5=1)(8=0)(else=copy) into LBSDK3S2 .
EXECUTE .

VARIABLE LABELS 
  LBSDK3S2 'Laatste 4 weken wiet of hasj gebruikt' .
EXECUTE .

VALUE LABELS 
  LBSDK3S2 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBSDK3S2 (F1.0) .
EXECUTE .

MISSING VALUES
  LBSDK3S2 (9) .
EXECUTE .

*** EINDE VAN DE SYNTAX ***
