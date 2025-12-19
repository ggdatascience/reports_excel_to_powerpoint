* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Alcoholgebruik binge en aangeschoten-1219-vragenlijst-kind .
*** Versie 4 - 30 augustus 2023 .
*** Standaard vastgesteld op 27 maart 2023 .
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl .
********************************************************************************************************

*** N.B. De syntax  'Alcoholgebruik' (deel 1) dient voorafgaand aan deze syntax gerund te worden.

*** AANPASSINGEN 2023 TEN OPZICHTE VAN VORIGE VERSIE (versie 3.2):.
* kleine tekstuele wijzigingen doorgevoerd door het omzetten van matrixvragen in losse vragen en in de formelering van de antwoordopties. 
* Opschoning LBAGA395 aangepast door aangepaste routing:.
* Indien 'Nooit' geantwoord op LBAGK394, LBAGK395 niet voorgelegd. 
* Daarom is een extra opschoningsstap toegevoegd.
* In 2021 was 8 'Nvt' toegevoegd aan definiëren van oorspronkele variabelen, maar omdat deze waarde niet bestaat in de oorspronkelijke variabele is dit weggehaald.

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** LBAGK3S15: % dat de laatste 4 weken vijf of meer drankjes met alcohol bij één gelegenheid heeft gedronken (binge drinken)
*** LBAGK3S16: % dat ooit dronken of aangeschoten is geweest
*** LBAGK3S17: % dat de laatste 4 weken dronken of aangeschoten is geweest .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  LBAGK307  'Hoe vaak heb je in laatste 4 weken 5 of meer drankjes met alcohol gedronken bij één gelegenheid?'
  LBAGK394  'Hoe vaak ben je in je hele leven dronken/aangeschoten geweest door drinken alcohol?'
  LBAGK395  'Hoe vaak ben je in laatste 4 weken dronken/aangeschoten geweest door drinken alcohol?'.
EXECUTE .

VALUE LABELS
  LBAGK307 1 'Nooit' 2 '1 keer' 3 '2 keer' 4 '3 of 4 keer' 5 '5 of 6 keer' 6 '7 of 8 keer' 7 '9 keer of vaker' 9 'Onbekend'/
  LBAGK394 LBAGK395 1 'Nooit' 2 '1 keer' 3 '2 keer' 4 '3 keer' 5 '4 tot en met 10 keer' 6 '11 keer of vaker' 9 'Onbekend' .
EXECUTE .
  
FORMATS
  LBAGK307 LBAGK394 LBAGK395 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK307 LBAGK394 LBAGK395 (9) .
EXECUTE .

*** Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBAGK307) LBAGK307 = 9 .
IF missing (LBAGK394) LBAGK394 = 9 .
IF missing (LBAGK395) LBAGK395 = 9 .
EXECUTE .

* Op basis van de voorlopervraag LBAGK391 de vervolgvragen LBAGK307, LBAGK394 en LBAGK395 opschonen .
* Op basis van de vraag LBAGA399 de vervolgvragen LBAGK307 en LBAGK395 opschonen .
* Op basis van de vraag LBAGK394 de vervolgvraag LBAGK395 opschonen
* Hiertoe een nieuwe variabele voor de vervolgvragen aanmaken: LBAGA307, LBAGA394 en LBAGA395 .
COMPUTE LBAGA307 = LBAGK307 .
COMPUTE LBAGA394 = LBAGK394 .
COMPUTE LBAGA395 = LBAGK395 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBAGK307) LBAGA307 = 9 .
IF missing (LBAGK394) LBAGA394 = 9 .
IF missing (LBAGK395) LBAGA395 = 9 .
EXECUTE .

* Als bij de voorlopervraag LBAGK391 niets is ingevuld, dan worden de vervolgvragen op missend (waarde 9) gezet .
IF missing (LBAGK391) LBAGA307 = 9 .
IF missing (LBAGK391) LBAGA394 = 9 .
IF missing (LBAGK391) LBAGA395 = 9 .
EXECUTE .

* Als de voorlopervraag LBAGK391 met 'nee' is beantwoord, dan worden de vervolgvragen op 'nvt' (waarde 8) gezet .
IF (LBAGK391 = 3) LBAGA307 = 8 .
IF (LBAGK391 = 3) LBAGA394 = 8 .
IF (LBAGK391 = 3) LBAGA395 = 8 .
EXECUTE .

* Als de vraag LBAGA399 met 'nooit' is beantwoord, dan worden de vervolgvragen LBAGA307 en LBAGA395 op 'nvt' (waarde 8) gezet .
IF (LBAGA399 = 1) LBAGA307 = 8 .
IF (LBAGA399 = 1) LBAGA395 = 8 .
EXECUTE .

* Als de vraag LBAGK394 met 'nooit' is beantwoord, dan wordt de vervolgvraag LBAGK395 op 'nvt' (waarde 8) gezet.
IF (LBAGK394 = 1) LBAGA395 = 8 .
EXECUTE .

VARIABLE LABELS 
  LBAGA307 'Hoe vaak in laatste 4 weken 5 of meer drankjes met alcohol bij één gelegenheid? (opgeschoond)'
  LBAGA394 'Hoe vaak dronken/aangeschoten in hele leven? (opgeschoond)'
  LBAGA395 'Hoe vaak dronken/aangeschoten in laatste 4 weken? (opgeschoond)' .
EXECUTE .

VALUE LABELS
  LBAGA307 1 'Nooit' 2 '1 keer' 3 '2 keer' 4 '3 of 4 keer' 5 '5 of 6 keer' 6 '7 of 8 keer' 7 '9 keer of vaker' 8 'Nvt' 9 'Onbekend'/
  LBAGA394 LBAGA395 1 'Nooit' 2 '1 keer' 3 '2 keer' 4 '3 keer' 5 '4 tot en met 10 keer' 6 '11 keer of vaker' 8 'Nvt' 9 'Onbekend' .
EXECUTE .
  
FORMATS
  LBAGA307 LBAGA394 LBAGA395 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGA307 LBAGA394 LBAGA395 (9) .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat de laatste 4 weken vijf of meer drankjes met alcohol bij één gelegenheid heeft gedronken (binge drinken) .

RECODE LBAGA307 (1=0)(2 thru 7=1)(8=0)(else=copy) into LBAGK3S15 .
EXECUTE .

VARIABLE LABELS 
  LBAGK3S15 'Laatste 4 weken 5 of meer drankjes bij 1 gelegenheid (binge drinken)' .
EXECUTE .

VALUE LABELS 
  LBAGK3S15 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGK3S15 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S15 (9) .
EXECUTE .

* Aanmaken indicator: % dat ooit dronken of aangeschoten is geweest .

RECODE LBAGA394 (1=0)(2 thru 6=1)(8=0)(else=copy) into LBAGK3S16 .
EXECUTE .

VARIABLE LABELS 
  LBAGK3S16 'Ooit dronken of aangeschoten geweest' .
EXECUTE .

VALUE LABELS 
  LBAGK3S16 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGK3S16 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S16 (9) .
EXECUTE .

* Aanmaken indicator: % dat de laatste 4 weken dronken of aangeschoten is geweest .

RECODE LBAGA395 (1=0)(2 thru 6=1)(8=0)(else=copy) into LBAGK3S17 .
EXECUTE .

VARIABLE LABELS 
  LBAGK3S17 'Laatste 4 weken dronken of aangeschoten geweest' .
EXECUTE .

VALUE LABELS 
  LBAGK3S17 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBAGK3S17 (F1.0) .
EXECUTE .

MISSING VALUES
  LBAGK3S17 (9) .
EXECUTE .



*** EINDE VAN DE SYNTAX ***

