* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Geslacht-1219-vragenlijst-kind .
*** Versie 2.1 / 14 november 2023.
*** Standaard vastgesteld op 23 maart 2023. 
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl	.
********************************************************************************************************

***Aanpassingen tov versie uit 2021:
*** In 2023 is de antwoordoptie 'Anders' aangepast naar 'Anders dan een jongen of een meisje'.
***Variable labels van GENDER en BBGSK4S1 aangepast. Ook variabele naam aangepast van 'GESLACHT' naar 'GENDER'.

*** AANPASSINGEN TEN OPZICHTE VAN VERSIE 1 (versie 1 / 1 december 2015):
*** In 2021 is de vraagstelling aangepast met een extra antwoordcategorie 'Anders.'
*** Variabelenaam en syntax hierop aangepast.
*** Twee indicatoren voor geslacht: één met twee categorieën voor vergelijking met eerdere jaren en één met drie categorieën. 

*** MET DEZE SYNTAX WORDT DE VOLGENDE INDICATOR AANGEMAAKT: .
*** GENDER: Gender in twee categorieën.
*** BBGSK4S1: Gender in drie categorieën.

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS 
  BBGSK402 'Ben je ... ?' .
EXECUTE .
  
VALUE LABELS
  BBGSK402 1 'Een jongen' 2 'Een meisje' 3 'Anders dan een jongen of een meisje' 9 'Onbekend' .
EXECUTE .

FORMATS
  BBGSK402 (F1.0) .
EXECUTE .

MISSING VALUES
  BBGSK402 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (BBGSK402) BBGSK402 = 9 .
EXECUTE .

*** STAP 2: INDICATOR AANMAKEN ***

* Aanmaken indicator: % jongens / % meisjes .

RECODE BBGSK402 (1=1)(2=2)(3=9)(else=copy) INTO GENDER.
EXECUTE .

VARIABLE LABELS 
  GENDER 'Gender in twee categorieën' .
EXECUTE .
  
VALUE LABELS
  GENDER 1 'Jongen' 2 'Meisje' 9 'Onbekend' .
EXECUTE .

FORMATS
  GENDER (F1.0) .
EXECUTE .

MISSING VALUES
  GENDER (9) .
EXECUTE .

* Aanmaken indicator: Gender in drie categorieën .

COMPUTE BBGSK4S1 = BBGSK402.
EXECUTE.

VARIABLE LABELS 
  BBGSK4S1 'Gender in drie categorieën' .
EXECUTE .
  
VALUE LABELS
  BBGSK4S1 1 'Jongen' 2 'Meisje' 3 'Anders dan een jongen of een meisje' 9 'Onbekend' .
EXECUTE .

FORMATS
  BBGSK4S1 (F1.0) .
EXECUTE .

MISSING VALUES
  BBGSK4S1 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (BBGSK4S1) BBGSK4S1 = 9 .
EXECUTE .

*** EINDE VAN DE SYNTAX ***


