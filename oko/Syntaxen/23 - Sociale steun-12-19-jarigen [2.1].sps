* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Sociale steun 12-19-jarigen.
*** Versie 2.1 / 14 december 2023.
*** Standaard vastgesteld op 4 april 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************

***Wijzigingen tov versie 2:
    * De variable names van de indicatoren zijn hernoemd, omdat de vraag onvoldoende of niet te vergelijken is met 2021.
    * GBZOK3S1 t/m GBSOK3S7 is vervangen door GBZOK3S11 t/m GBZOK3S17. 

***Wijzigingen in 2023 t.o.v. vorige versie uit 2021 (versie 1):
* In 2021 heette deze standaard zorg en ondersteuning.
* Ten opzichte van de standaard in 2021 is alleen de eerste vraag behouden. Deze is qua antwoordcategorieën aangepast. De syntax is hierop aangepast.

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
* GBZOK3S11: % dat bij iemand terecht kan bij een probleem of als diegene ergens mee zit.
* GBZOK3S12: % dat bij de ouder(s) of verzorger(s) terecht kan bij een probleem of als diegene ergens mee zit. 
* GBZOK3S13: % dat bij andere familieleden dan de ouder(s)/ verzorger(s) terecht kan bij een probleem of als diegene ergens mee zit. 
* GBZOK3S14: % dat bij vriend(en)/ vriendin(nen) terecht kan bij een probleem of als diegene ergens mee zit. 
* GBZOK3S15: % dat bij een volwassene op school terecht kan bij een probleem of als diegene ergens mee zit.
* GBZOK3S16: % dat bij een hulpverlener terecht kan bij een probleem of als diegene ergens mee zit.
* GBZOK3S17: % dat bij iemand anders terecht kan bij een probleem of als diegene ergens mee zit.


*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS 
  GBZOK310  'Bij wie terecht kunnen bij probleem of als je ergens mee zit? - Mijn ouder(s) of verzorger(s)'
  GBZOK311  'Bij wie terecht kunnen bij probleem of als je ergens mee zit? - Andere familieleden'
  GBZOK312  'Bij wie terecht kunnen bij probleem of als je ergens mee zit? - Mijn vriend(en)/ vriendin(nen)'
  GBZOK313  'Bij wie terecht kunnen bij probleem of als je ergens mee zit? - Een volwassene op school (zoals docent, mentor, vertrouwenspersoon)'
  GBZOK314  'Bij wie terecht kunnen bij probleem of als je ergens mee zit? - Een hulpverlener (zoals huisarts, psycholoog, jeugdverpleegkundige)'
  GBZOK315  'Bij wie terecht kunnen bij probleem of als je ergens mee zit? - Iemand anders (zoals jongerenwerker, trainer, buren)'
  GBZOK316  'Bij wie terecht kunnen bij probleem of als je ergens mee zit? - Ik kan bij niemand terecht'.
EXECUTE .

VALUE LABELS
   GBZOK310 GBZOK311 GBZOK312 GBZOK313 GBZOK314 GBZOK315 GBZOK316 1 'Aangekruist' 2 'Niet aangekruist' 9 'Onbekend'.
EXECUTE .

FORMATS
  GBZOK310 GBZOK311 GBZOK312 GBZOK313 GBZOK314 GBZOK315 GBZOK316 (F1.0). 
EXECUTE .

MISSING VALUES
  GBZOK310 GBZOK311 GBZOK312 GBZOK313 GBZOK314 GBZOK315 GBZOK316 (9).
EXECUTE .

*** Als er niets is ingevuld bij de meerkeuze-items, dan krijgt de variabele de waarde 2 (Niet aangekruist).
IF (missing(GBZOK310)) GBZOK310=2.
IF (missing(GBZOK311)) GBZOK311=2.
IF (missing(GBZOK312)) GBZOK312=2.
IF (missing(GBZOK313)) GBZOK313=2.
IF (missing(GBZOK314)) GBZOK314=2.
IF (missing(GBZOK315)) GBZOK315=2.
IF (missing(GBZOK316)) GBZOK316=2.
Execute.

*** Als er niets is ingevuld bij de meerkeuzevraag, dan wordt de totale vraag op missend gezet.
COUNT anee = GBZOK310 GBZOK311 GBZOK312 GBZOK313 GBZOK314 GBZOK315 GBZOK316 (2).
EXECUTE.

IF (anee = 7) GBZOK310 = 9 .
IF (anee = 7) GBZOK311 = 9 .
IF (anee = 7) GBZOK312 = 9 .
IF (anee = 7) GBZOK313 = 9 .
IF (anee = 7) GBZOK314 = 9 .
IF (anee = 7) GBZOK315 = 9 .
IF (anee = 7) GBZOK316 = 9 .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat bij iemand terecht kan bij een probleem of als diegene ergens mee zit. Op basis van GBZOK316. 

RECODE GBZOK316 (1=0)(2=1)(else=copy) into GBZOK3S11 .
EXECUTE .

VARIABLE LABELS 
  GBZOK3S11 'Kan bij iemand terecht bij een probleem of als diegene ergens mee zit' .
EXECUTE .

VALUE LABELS 
  GBZOK3S11 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  GBZOK3S11 (F1.0) .
EXECUTE .

MISSING VALUES
  GBZOK3S11 (9) .
EXECUTE .

*Aanmaken indicator: % dat bij de ouder(s) of verzorger(s) terecht kan bij een probleem of als diegene ergens mee zit.
RECODE GBZOK310 (1=1)(2=0) (else=copy) INTO GBZOK3S12.
EXECUTE .

VARIABLE LABELS 
  GBZOK3S12 'Kan bij ouder(s) of verzorger(s) terecht bij een probleem of als diegene ergens mee zit'.
EXECUTE .

VALUE LABELS 
  GBZOK3S12 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  GBZOK3S12 (F1.0) .
EXECUTE .

MISSING VALUES
  GBZOK3S12 (9) .
EXECUTE .


*Aanmaken indicator: % dat bij andere familieleden dan de ouder(s)/ verzorger(s) terecht kan bij een probleem of als diegene ergens mee zit. 
RECODE GBZOK311 (1=1)(2=0) (else=copy) INTO GBZOK3S13.
EXECUTE .

VARIABLE LABELS 
  GBZOK3S13 'Kan bij andere familieleden dan ouder(s)/verzorger(s) terecht bij een probleem of als diegene ergens mee zit'.
EXECUTE .

VALUE LABELS 
  GBZOK3S13 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  GBZOK3S13 (F1.0) .
EXECUTE .

MISSING VALUES
  GBZOK3S13 (9) .
EXECUTE .

*Aanmaken indicator: % dat bij vriend(en)/ vriendin(nen) terecht kan bij een probleem of als diegene ergens mee zit. 
RECODE GBZOK312 (1=1)(2=0) (else=copy) INTO GBZOK3S14.
EXECUTE .

VARIABLE LABELS 
  GBZOK3S14 'Kan bij vriend(en)/vriendin(nen) terecht bij een probleem of als diegene ergens mee zit'.
EXECUTE .

VALUE LABELS 
  GBZOK3S14 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  GBZOK3S14 (F1.0) .
EXECUTE .

MISSING VALUES
  GBZOK3S14 (9) .
EXECUTE .

*Aanmaken indicator: % dat bij een volwassene op school terecht kan bij een probleem of als diegene ergens mee zit.
RECODE GBZOK313 (1=1)(2=0) (else=copy) INTO GBZOK3S15.
EXECUTE .

VARIABLE LABELS 
  GBZOK3S15 'Kan bij een volwassene op school terecht bij een probleem of als diegene ergens mee zit'.
EXECUTE .

VALUE LABELS 
  GBZOK3S15 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  GBZOK3S15 (F1.0) .
EXECUTE .

MISSING VALUES
  GBZOK3S15 (9) .
EXECUTE .

*Aanmaken indicator: % dat bij een hulpverlener terecht kan bij een probleem of als diegene ergens mee zit.
RECODE GBZOK314 (1=1)(2=0) (else=copy) INTO GBZOK3S16.
EXECUTE .

VARIABLE LABELS 
  GBZOK3S16 'Kan bij een hulpverlener terecht bij een probleem of als diegene ergens mee zit'.
EXECUTE .

VALUE LABELS 
  GBZOK3S16 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  GBZOK3S16 (F1.0) .
EXECUTE .

MISSING VALUES
  GBZOK3S16 (9) .
EXECUTE .

*Aanmaken indicator: % dat bij iemand anders terecht kan bij een probleem of als diegene ergens mee.
RECODE GBZOK315 (1=1)(2=0) (else=copy) INTO GBZOK3S17.
EXECUTE .

VARIABLE LABELS 
  GBZOK3S17 'Kan bij iemand anders terecht bij een probleem of als diegene ergens mee zit'.
EXECUTE .

VALUE LABELS 
  GBZOK3S17 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  GBZOK3S17 (F1.0) .
EXECUTE .

MISSING VALUES
  GBZOK3S17 (9) .
EXECUTE .


* Tijdelijke variabelen verwijderen .
DELETE VARIABLES anee.
EXECUTE.

*** EINDE VAN DE SYNTAX ***
