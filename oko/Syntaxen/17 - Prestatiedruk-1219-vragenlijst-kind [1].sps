* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Prestatiedruk
*** Versie 1 / 13 september 2023.
*** Standaard vastgesteld op 12 april 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .

*SBPDK3S1: % dat regelmatig/vaak prestatiedruk ervaart (vanuit zichzelf of vanuit anderen)
*SBPDK3S2: % dat regelmatig/vaak prestatiedruk ervaart vanuit zichzelf
*SBPDK3S3: % dat regelmatig/vaak prestatiedruk ervaart vanuit anderen
*SBPDK3S4: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit ouder(s)/verzorger(s)
*SBPDK3S5: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit leraren/school
*SBPDK3S5: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit vrienden/vriendinnen
*SBPDK3S7: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit coach of trainer van sport
*SBPDK3S8: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit docent van muziek, dans of toneel
*SBPDK3S9: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit social media 
*SBPDK3S10: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit iemand/iets anders 

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS 
  SBPDK301  'Voel je druk om aan je eigen verwachtingen te voldoen?'
  SBPDK302  'Voel je druk om aan de verwachtingen van iemand anders te voldoen?'
  SBPDK303  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn ouder(s) / verzorger(s)'
  SBPDK304  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn leraren / school'
  SBPDK305  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn vrienden / vriendinnen'
  SBPDK306  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn coach of trainer van mijn sport'
  SBPDK307  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn docent van muziek, zang, dans of toneel'
  SBPDK308  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door social media'
  SBPDK309  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door anders'.
EXECUTE. 

VALUE LABELS 
  SBPDK301 SBPDK302  1 'Nee nooit' 2 'Ja, soms' 3 'Ja, regelmatig' 4 'Ja, vaak' 9 'Onbekend'/
  SBPDK303 SBPDK304 SBPDK305 SBPDK306 SBPDK307 SBPDK308 SBPDK309 1 'Aangekruist' 2 'Niet aangekruist' 9 'Onbekend'.
EXECUTE. 

FORMATS
  SBPDK301 SBPDK302 SBPDK303 SBPDK304 SBPDK305 SBPDK306 SBPDK307 SBPDK308 SBPDK309 (F1.0) .
EXECUTE .

MISSING VALUES 
  SBPDK301 SBPDK302 SBPDK303 SBPDK304 SBPDK305 SBPDK306 SBPDK307 SBPDK308 SBPDK309 (9).
EXECUTE. 

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
*** Als er niets is ingevuld bij de meerkeuze-items, dan krijgt de variabele de waarde 2 (Niet aangekruist).
IF missing (SBPDK301) SBPDK301 = 9.
IF missing (SBPDK302) SBPDK302 = 9.
IF missing (SBPDK303) SBPDK303 = 2.
IF missing (SBPDK304) SBPDK304 = 2.
IF missing (SBPDK305) SBPDK305 = 2.
IF missing (SBPDK306) SBPDK306 = 2.
IF missing (SBPDK307) SBPDK307 = 2.
IF missing (SBPDK308) SBPDK308 = 2.
IF missing (SBPDK309) SBPDK309 = 2.
EXECUTE.

*** Als er niets is ingevuld bij de meerkeuzevraag, dan wordt de totale vraag op missend gezet.

COUNT anee = SBPDK303 SBPDK304 SBPDK305 SBPDK306 SBPDK307 SBPDK308 SBPDK309 (2).

IF (anee = 7) SBPDK303 = 9 .
IF (anee = 7) SBPDK304 = 9 .
IF (anee = 7) SBPDK305 = 9 .
IF (anee = 7) SBPDK306 = 9 .
IF (anee = 7) SBPDK307 = 9 .
IF (anee = 7) SBPDK308 = 9 .
IF (anee = 7) SBPDK309 = 9 .
EXECUTE .

* Op basis van de voorlopervraag SBPDK302  de vervolgvragen opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvragen aanmaken:

COMPUTE SBPDA303 = SBPDK303.
COMPUTE SBPDA304 = SBPDK304 .
COMPUTE SBPDA305 = SBPDK305.
COMPUTE SBPDA306 = SBPDK306.
COMPUTE SBPDA307 = SBPDK307.
COMPUTE SBPDA308 = SBPDK308.
COMPUTE SBPDA309 = SBPDK309.
EXECUTE .

*** Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SBPDK303) SBPDA303 = 9.
IF missing (SBPDK304) SBPDA304 = 9.
IF missing (SBPDK305) SBPDA305 = 9.
IF missing (SBPDK306) SBPDA306 = 9.
IF missing (SBPDK307) SBPDA307 = 9.
IF missing (SBPDK308) SBPDA308 = 9.
IF missing (SBPDK309) SBPDA309 = 9.
EXECUTE.

* Als bij de voorlopervraag SBPDK302 niets is ingevuld, dan worden de vervolgvragen op missend (waarde 9) gezet .
IF missing (SBPDK302) SBPDA303 = 9.
IF missing (SBPDK302) SBPDA304 = 9.
IF missing (SBPDK302) SBPDA305 = 9.
IF missing (SBPDK302) SBPDA306 = 9.
IF missing (SBPDK302) SBPDA307 = 9.
IF missing (SBPDK302) SBPDA308 = 9.
IF missing (SBPDK302) SBPDA309 = 9.
EXECUTE.

* Als de voorlopervraag SBPDK302 met 'nee, nooit' of 'ja, soms' is beantwoord, dan worden de vervolgvragen op 'nvt' (waarde 8) gezet .
IF (SBPDK302 = 1 OR SBPDK302 = 2) SBPDA303 = 8.
IF (SBPDK302 = 1 OR SBPDK302 = 2) SBPDA304 = 8.
IF (SBPDK302 = 1 OR SBPDK302 = 2) SBPDA305 = 8.
IF (SBPDK302 = 1 OR SBPDK302 = 2) SBPDA306 = 8.
IF (SBPDK302 = 1 OR SBPDK302 = 2) SBPDA307 = 8.
IF (SBPDK302 = 1 OR SBPDK302 = 2) SBPDA308 = 8.
IF (SBPDK302 = 1 OR SBPDK302 = 2) SBPDA309 = 8.
EXECUTE .

VARIABLE LABELS 
  SBPDA303  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn ouder(s) / verzorger(s) (opgeschoond)'
  SBPDA304  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn leraren / school(opgeschoond)'
  SBPDA305  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn vrienden / vriendinnen (opgeschoond)'
  SBPDA306  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn coach of trainer van mijn sport (opgeschoond)'
  SBPDA307  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door mijn docent van muziek, zang, dans of toneel (opgeschoond)'
  SBPDA308  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door social media (opgeschoond)'
  SBPDA309  'Ik voel druk om aan de verwachtingen van iemand anders te voldoen - door anders (opgeschoond)'.
EXECUTE. 

VALUE LABELS 
  SBPDA303 SBPDA304 SBPDA305 SBPDA306 SBPDA307 SBPDA308 SBPDA309 1 'Aangekruist' 2 'Niet aangekruist' 8 'Nvt' 9 'Onbekend'.
EXECUTE. 

FORMATS
  SBPDA303 SBPDA304 SBPDA305 SBPDA306 SBPDA307 SBPDA308 SBPDA309 (F1.0) .
EXECUTE .

MISSING VALUES 
  SBPDA303 SBPDA304 SBPDA305 SBPDA306 SBPDA307 SBPDA308 SBPDA309 (9).
EXECUTE.

*** STAP 2: INDICATOREN AANMAKEN ***

*SBPDK3S1: % dat regelmatig/vaak prestatiedruk ervaart.

COMPUTE SBPDK3S1 = 9.
IF ((SBPDK301 = 1 OR SBPDK301 = 2) AND (SBPDK302 = 1 OR SBPDK302 = 2)) SBPDK3S1 = 0.
IF (SBPDK301 = 3 OR SBPDK302 = 3 OR SBPDK301 = 4 OR SBPDK302 = 4) SBPDK3S1 = 1.
EXECUTE .

VARIABLE LABELS 
  SBPDK3S1 'Ervaart regelmatig/vaak prestatiedruk (vanuit zichzelf of vanuit anderen)' .
EXECUTE .

VALUE LABELS 
  SBPDK3S1 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S1 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S1 (9) .
EXECUTE .

*SBPDK3S2: % dat regelmatig/vaak prestatiedruk ervaart vanuit zichzelf

RECODE SBPDK301 (1=0)(2=0)(3=1)(4=1)(else=copy) into SBPDK3S2 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S2 'Ervaart regelmatig/vaak prestatiedruk vanuit zichzelf' .
EXECUTE .

VALUE LABELS 
  SBPDK3S2 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S2 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S2 (9) .
EXECUTE .

*SBPDK3S3: % dat regelmatig/vaak prestatiedruk ervaart vanuit anderen

RECODE SBPDK302 (1=0)(2=0)(3=1)(4=1)(else=copy) into SBPDK3S3 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S3 'Ervaart regelmatig/vaak prestatiedruk vanuit anderen' .
EXECUTE .

VALUE LABELS 
  SBPDK3S3 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S3 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S3 (9) .
EXECUTE .

*SBPDA3S4: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit ouder(s)/verzorger(s)

RECODE SBPDA303 (1=1)(2=0)(8=0)(else=copy) into SBPDK3S4 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S4 'Ervaart regelmatig/vaak prestatiedruk, waaronder druk vanuit ouder(s)/verzorger(s)' .
EXECUTE .

VALUE LABELS 
  SBPDK3S4 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S4 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S4 (9) .
EXECUTE .

*SBPDA3S5: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit leraren/school

RECODE SBPDA304 (1=1)(2=0)(8=0)(else=copy) into SBPDK3S5 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S5 'Ervaart regelmatig/vaak prestatiedruk, waaronder druk vanuit leraren/school' .
EXECUTE .

VALUE LABELS 
  SBPDK3S5 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S5 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S5 (9) .
EXECUTE .

*SBPDA3S5: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit vrienden/vriendinnen

RECODE SBPDA305 (1=1)(2=0)(8=0)(else=copy) into SBPDK3S6 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S6 'Ervaart regelmatig/vaak prestatiedruk, waaronder druk vanuit vrienden/vriendinnen' .
EXECUTE .

VALUE LABELS 
  SBPDK3S6 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S6 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S6 (9) .
EXECUTE .

*SBPDA3S7: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit coach of trainer van sport

RECODE SBPDA306 (1=1)(2=0)(8=0)(else=copy) into SBPDK3S7 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S7 'Ervaart regelmatig/vaak prestatiedruk, waaronder druk vanuit coach of trainer van sport' .
EXECUTE .

VALUE LABELS 
  SBPDK3S7 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S7 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S7 (9) .
EXECUTE .

*SBPDA3S8: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit docent van muziek, dans of toneel

RECODE SBPDA307 (1=1)(2=0)(8=0)(else=copy) into SBPDK3S8 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S8 'Ervaart regelmatig/vaak prestatiedruk, waaronder druk vanuit docent van muziek, dans of toneel' .
EXECUTE .

VALUE LABELS 
  SBPDK3S8 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S8 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S8 (9) .
EXECUTE .

*SBPDA3S9: % % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit social media 

RECODE SBPDA308 (1=1)(2=0)(8=0)(else=copy) into SBPDK3S9 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S9 'Ervaart regelmatig/vaak prestatiedruk, waaronder druk vanuit social media' .
EXECUTE .

VALUE LABELS 
  SBPDK3S9 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S9 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S9 (9) .
EXECUTE .

*SBPDA3S10: % dat regelmatig/vaak prestatiedruk ervaart, waaronder druk vanuit iemand/iets anders 

RECODE SBPDA309 (1=1)(2=0)(8=0)(else=copy) into SBPDK3S10 .
EXECUTE .

VARIABLE LABELS 
  SBPDK3S10 'Ervaart regelmatig/vaak prestatiedruk, waaronder vanuit iemand/iets anders' .
EXECUTE .

VALUE LABELS 
  SBPDK3S10 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBPDK3S10 (F1.0) .
EXECUTE .

MISSING VALUES
  SBPDK3S10 (9) .
EXECUTE .

* Tijdelijke variabelen verwijderen .
DELETE VARIABLES anee.
EXECUTE.

*** EINDE VAN DE SYNTAX ***