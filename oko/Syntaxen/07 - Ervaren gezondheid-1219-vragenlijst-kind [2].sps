* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Ervaren gezondheid-1219-vragenlijst-kind .
*** Versie 2 - 12 september 2023 .
*** Standaard vastgesteld op 10 januari 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl
********************************************************************************************************

*** Wijziging tov 2021:
    *Variable label en values van EBEGK3S2 aangepast, zodat het een 0/1-indicator is.

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** EBEGK3S2: % dat eigen gezondheid als (zeer) goed beoordeelt.
*** EBEGK3S3: % dat eigen gezondheid als (zeer) goed beoordeelt; % dat eigen gezondheid als matig beoordeelt; % dat eigen gezondheid als (zeer) slecht beoordeelt .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS 
  EBEGK311 'Hoe is over het algemeen je gezondheid?' .
EXECUTE .

VALUE LABELS
  EBEGK311 1 'Zeer goed' 2 'Goed' 3 'Gaat wel' 4 'Slecht' 5 'Zeer slecht' 9 'Onbekend' .
EXECUTE .

FORMATS
  EBEGK311 (F1.0) .
EXECUTE .

MISSING VALUES
  EBEGK311 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (EBEGK311) EBEGK311 = 9 .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat zijn/haar gezondheid als (zeer) goed beoordeelt; % dat zijn/haar gezondheid als matig of (zeer) slecht beoordeelt .

RECODE EBEGK311 (1=1)(2=1)(3=0)(4=0)(5=0)(else=copy) into EBEGK3S2 .
EXECUTE .

VARIABLE LABELS 
  EBEGK3S2 'Ervaart eigen gezondheid als (zeer) goed' .
EXECUTE .
  
VALUE LABELS
  EBEGK3S2 0 'Gaat wel of (zeer) slecht' 1 '(Zeer) goed'  9 'Onbekend' .
EXECUTE .

FORMATS
  EBEGK3S2 (F1.0) .
EXECUTE .

MISSING VALUES
  EBEGK3S2 (9) .
EXECUTE .

* Aanmaken indicator: % dat zijn/haar gezondheid als (zeer) goed beoordeelt; % dat zijn/haar gezondheid als matig beoordeelt; % dat zijn/haar gezondheid als (zeer) slecht beoordeelt .

RECODE EBEGK311 (1=1)(2=1)(3=2)(4=3)(5=3)(else=copy) into EBEGK3S3 .
EXECUTE .

VARIABLE LABELS 
  EBEGK3S3 'Ervaren gezondheid in 3 categorieën' .
EXECUTE .
  
VALUE LABELS
  EBEGK3S3 1 '(Zeer) goed' 2 'Gaat wel' 3 '(Zeer) slecht' 9 'Onbekend' .
EXECUTE .

FORMATS
  EBEGK3S3 (F1.0) .
EXECUTE .

MISSING VALUES
  EBEGK3S3 (9) .
EXECUTE .

*** EINDE VAN DE SYNTAX ***


