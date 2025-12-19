* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Bewegen-1219-vragenlijst-kind .
*** Versie 7.0 / juli 2025.
*** Standaard vastgesteld op 12 april 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************

*** wijzigingen tov versie 6.1:
    * tov van 2023 zijn de antwoordcategorieën van de eerste vraag gelijk getrokken met die van de tweede en derde vraag.   
    * Daarom LBLBK321  'Hoe vaak ga je lopend of fietsend naar school of stage?' vervangen door  LBLBK335 omdat deze in verband met een extra antwoordcategorie niet koppelbaar is met 2023.
    * samengestelde indicator LBLBK3S14: % dat wekelijks actief is (sport/bewegen) in de vrije tijd vervalt.
    * indicator LBLBK3S17: % dat wekelijks sport zonder een club of sportschool toegevoegd.

*** Wijzigingen tov versie 6:
    *Aanpassing label LBLBK3S11 ('vereniging' is uit het label verwijderd ivm de aangepaste vraagstelling tov 2021).

*** Wijzigingen ten opzichte van vorige versie (versie 5).
* Tov 2021 is de vraag naar het bewegen van minimaal 1 uur per dag anders gesteld. Hiervoor worden nu nieuwe indicatoren aangemaakt.
* LBLBK3S15: % dat dagelijks minstens één uur beweegt (ipv LBLBK3S12).
* LBLBK3S16: % dat 5 of meer dagen per week minstens één uur beweegt (ipv LBLBK3S13).

***Wijzigingen in 2023 ten opzichte van vorige versie 2021 (versie 4):
*Tov 2021 zijn de antwoordcategorieën van de tweede en derde vraag opgesplitst naar meerdere opties en wordt de vraag over aantal dagen minstens 1 uur bewegen anders gesteld. De syntax is hierop aangepast.
*Formuleringen van de vragen zijn aangepast, labels zijn hierdoor ook aangepast.

*** In 2021 indicator toegevoegd voor wekelijks actief in de vrije tijd: LBLBK3S14.

*** AANPASSINGEN TEN OPZICHTE VAN DE VORIGE VERSIES: .
*** In versie 2 indicator LBLBK3S13 toegevoegd .
*** In versie 3 indicator LBLBK3S10 toegevoegd .
*** In versie 3 de tekst '(NNGB voor jeugdigen)' bij de indicatoren LBLBK3S12 en LBLBK3S13 verwijderd .
*** In versie 3 label bij 1e antwoordcategorie bij variabele LBLBK322 veranderd . 

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** LBLBK3S10: % dat 5 dagen per week loopt of fietst naar school of stageplek .
*** LBLBK3S11: % dat wekelijks sport bij een club of sportschool.
*** LBLBK3S15: % dat dagelijks minstens één uur beweegt .
*** LBLBK3S16: % dat 5 of meer dagen per week minstens één uur beweegt .
*** LBLBK3S14: % dat wekelijks actief is (sport/bewegen) in de vrije tijd .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  LBLBK335  'Hoe vaak ga je lopend of fietsend naar school of stage?'
  LBLBK325  'Hoe vaak sport je bij een club of sportschool?'
  LBLBK326  'Hoe vaak sport je in je vrije tijd zonder club of sportschool?'
  LBLBK327  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Maandag'
  LBLBK328  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Dinsdag'
  LBLBK329  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Woensdag'
  LBLBK330  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Donderdag'
  LBLBK331  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Vrijdag'
  LBLBK332  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Zaterdag'
  LBLBK333  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Zondag'
  LBLBK334  'Op welke dagen van de week sport of beweeg je minstens 1 uur per dag? - Geen enkele dag'.
EXECUTE.

VALUE LABELS
    LBLBK335 1 '(Bijna) nooit' 2 'Minder dan 1 dag per week' 3 '1 dag per week' 4 '2 dagen per week' 5 '3 dagen per week' 6 '4 dagen per week' 7 '5 dagen per week' 9 'Onbekend'/
    LBLBK325 1 '(Bijna) nooit' 2 'Minder dan 1 dag per week' 3 '1 dag per week' 4 '2 of 3 dagen per week' 5 '4 tot en met 6 dagen per week' 6 'Elke dag' 9 'Onbekend'/
    LBLBK326 1 '(Bijna) nooit' 2 'Minder dan 1 dag per week' 3 '1 dag per week' 4 '2 of 3 dagen per week' 5 '4 tot en met 6 dagen per week' 6 'Elke dag' 9 'Onbekend'/
    LBLBK327 LBLBK328 LBLBK329 LBLBK330 LBLBK331 LBLBK332 LBLBK333 LBLBK334 1 'Aangekruist' 2 'Niet aangekruist' 9 'Onbekend' .
EXECUTE .

FORMATS
    LBLBK335 LBLBK325 LBLBK326 LBLBK327 LBLBK328 LBLBK329 LBLBK330 LBLBK331 LBLBK332 LBLBK333 LBLBK334 (F1.0) .
EXECUTE .

MISSING VALUES
  LBLBK335 LBLBK325 LBLBK326 LBLBK327 LBLBK328 LBLBK329 LBLBK330 LBLBK331 LBLBK332 LBLBK333 LBLBK334 (9) .
EXECUTE .

*** Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
*** Als er bij meerkeuze-items niks is ingevuld, krijgt de variabele de waarde 2.
IF missing (LBLBK335) LBLBK335 = 9 .
IF missing (LBLBK325) LBLBK325 = 9 .
IF missing (LBLBK326) LBLBK326 = 9 .
IF missing (LBLBK327) LBLBK327 = 2 .
IF missing (LBLBK328) LBLBK328 = 2 .
IF missing (LBLBK329) LBLBK329 = 2 .
IF missing (LBLBK330) LBLBK330 = 2 .
IF missing (LBLBK331) LBLBK331 = 2 .
IF missing (LBLBK332) LBLBK332 = 2 .
IF missing (LBLBK333) LBLBK333 = 2 .
IF missing (LBLBK334) LBLBK334 = 2 .
EXECUTE .

*Als er bij de meerkeuzevraag niks is ingevuld, krijgen de variabelen de waarde 9.
COUNT anee = LBLBK327 LBLBK328 LBLBK329 LBLBK330 LBLBK331 LBLBK332 LBLBK333 LBLBK334 (2).
IF (anee=8) LBLBK327 = 9.
IF (anee=8) LBLBK328 = 9.
IF (anee=8) LBLBK329 = 9.
IF (anee=8) LBLBK330 = 9.
IF (anee=8) LBLBK331 = 9.
IF (anee=8) LBLBK332 = 9.
IF (anee=8) LBLBK333 = 9.
IF (anee=8) LBLBK334 = 9.
EXECUTE.

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat 5 dagen per week loopt of fietst naar school of stageplek .

RECODE LBLBK335 (1 thru 6=0)(7=1)(else=copy) into LBLBK3S10 .
EXECUTE .

VARIABLE LABELS 
    LBLBK3S10 'Loopt of fietst 5 dagen per week naar school of stageplek' .
EXECUTE .

VALUE LABELS
    LBLBK3S10 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    LBLBK3S10 (F1.0) .
EXECUTE .

MISSING VALUES
    LBLBK3S10 (9) .
EXECUTE .

* Aanmaken indicator: % dat wekelijks sport bij een club of sportschool .

RECODE LBLBK325 (1 thru 2=0)(3 thru 6=1)(else=copy) into LBLBK3S11 .
EXECUTE .

VARIABLE LABELS 
    LBLBK3S11 'Sport wekelijks bij een club of sportschool' .
EXECUTE .

VALUE LABELS
    LBLBK3S11 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    LBLBK3S11 (F1.0) .
EXECUTE .

MISSING VALUES
     LBLBK3S11 (9) .
EXECUTE .


* Aanmaken indicator: % dat wekelijks sport zonder een club of sportschool .

RECODE LBLBK326 (1 thru 2=0)(3 thru 6=1)(else=copy) into LBLBK3S17 .
EXECUTE .

VARIABLE LABELS 
    LBLBK3S17 'Sport wekelijks zonder een club of sportschool' .
EXECUTE .

VALUE LABELS
    LBLBK3S17 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    LBLBK3S17 (F1.0) .
EXECUTE .

MISSING VALUES
     LBLBK3S17 (9) .
EXECUTE .

* Aanmaken indicator: % dat dagelijks minstens één uur beweegt .

COUNT aja = LBLBK327 LBLBK328 LBLBK329 LBLBK330 LBLBK331 LBLBK332 LBLBK333 (1).
COMPUTE LBLBK3S15= 9.
IF (aja = 7) LBLBK3S15 = 1.
IF (aja<7) LBLBK3S15 = 0.
IF missing (LBLBK334) LBLBK3S15= 9.
EXECUTE .

VARIABLE LABELS 
    LBLBK3S15 'Beweegt dagelijks minstens 1 uur' .
EXECUTE .

VALUE LABELS
    LBLBK3S15 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    LBLBK3S15 (F1.0) .
EXECUTE .

MISSING VALUES
    LBLBK3S15 (9) .
EXECUTE .

* Aanmaken indicator: % dat 5 of meer dagen per week minstens één uur beweegt .

COMPUTE LBLBK3S16=9.
IF (aja GE 5) LBLBK3S16 = 1.
IF (aja<5) LBLBK3S16 = 0.
IF MISSING(LBLBK334) LBLBK3S16=9.
EXECUTE .

VARIABLE LABELS 
    LBLBK3S16 'Beweegt 5 of meer dagen per week minstens 1 uur' .
EXECUTE .

VALUE LABELS
    LBLBK3S16 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    LBLBK3S16 (F1.0) .
EXECUTE .

MISSING VALUES
    LBLBK3S16 (9) .
EXECUTE .

* Aanmaken combivariabele: wekelijks actief in de vrije tijd (gebaseerd op wekelijks sporten bij club aangevuld met wekelijks actief bewegen buiten club).

*COMPUTE LBLBK3S14 = 9.
*IF (LBLBK3S11 = 0 AND LBLBK326 < 3) LBLBK3S14 = 0.
*IF (LBLBK3S11 = 1 OR LBLBK326 > 2) LBLBK3S14 = 1.
*EXECUTE.

*VARIABLE LABELS 
*   LBLBK3S14 'Wekelijks actief (sport/bewegen) in de vrije tijd'.
*EXECUTE.

*VALUE LABELS    
*   LBLBK3S14 0 'Nee' 1 'Ja' 9 ' Onbekend'.
*EXECUTE.

*FORMATS LBLBK3S14 (F1.0) .
*EXECUTE. 

*MISSING VALUES LBLBK3S14 (9) .
*EXECUTE .


*Tijdelijke variabelen verwijderen.
DELETE VARIABLES anee aja.

*** EINDE VAN DE SYNTAX ***


