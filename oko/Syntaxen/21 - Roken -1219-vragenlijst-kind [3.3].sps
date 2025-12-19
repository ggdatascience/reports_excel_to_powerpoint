* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Roken actief-1219-vragenlijst-kind .
*** Versie 3.3 / 13 februari 2023.
*** Standaard vastgesteld op 4 april 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl
********************************************************************************************************

***Aanpassingen tov versie 3.2:
    * Combi-indicatoren voor roken en vapen toegevoegd: LBRAK3S20, LBRAK3S21, LBRAK3S22.

*** AANPASSINGEN 2023 TEN OPZICHTE VAN 2021 (versie 2.1): .
*** beperkte tekstuele wijziging in een antwoordcategorieën bij LBRAK312 en LBRAA312 doorgevoerd in verband met aanpassing in vragenlijst.
*** variabelen LBGEK302, LBGEK303, LBGEA304 en de indicatoren LBGEK3S3, LBGEK3S4 en LBGEK3S5 over vapen toegevoegd. 
*** LBGEK302 is variabele uit 2019, antwoordcategorieën bevatten beperkte tekstuele wijziging.
*** LBGEK303 is nieuwe variale, omdat vraagstelling en antwoordcategorieën teveel afwijken van LBGEK301 uit 2019.
*** LBGEK3S2 en LBGEK3S3 hebben de variable name uit 2019 behouden ivm vergelijkbaarheid. LBGEK3S4 heeft een nieuwe naam gekregen ivm afwijkende vraagstelling. 
*** valuelabels voor 8 'nvt' bij ruwe variabelen weggehaald, want wordt pas bij opschoning toegevoegd.

***Aanpassingen tov versie 2. 
*** Value label voor 8 'nvt' toegevoegd voor LBRAK312 in versie 2.1.

*** AANPASSINGEN 2019 TEN OPZICHTE VAN 2015 (versie 1 / 1 december 2015): .
*** In versie 2 indicatoren LBRAK3S13, LBRAK3S14, LBRAK3S15 en LBRAK3S16 verwijderd (zie achtergronddocument) .
*** In versie 2 indicatoren LBRAK3S18 en LBRAK3S19 toegevoegd .

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** LBRAK3S11: % dat ooit gerookt heeft (een hele sigaret of meer) .
*** LBRAK3S12: % dat ooit gerookt heeft (alleen een paar trekjes of een hele sigaret of meer) .
*** LBRAK3S18: % dat nu dagelijks rookt .
*** LBRAK3S19: % dat nu ≥ wekelijks rookt .
*** LBGEK3S4: % dat ooit een vape (e-sigaret) heeft gebruikt .
*** LBGEK3S3: % dat nu ≥ wekelijks een vape (e-sigaret) gebruikt..
*** LBGEK3S2: % dat nu dagelijks een vape (e-sigaret) gebruik.
*** LBRAK3S20: % dat ooit gerookt heeft (alleen een paar trekjes of een hele sigaret of meer) en/of ooit een vape (e-sigaret) heeft gebruikt.
*** LBRAK3S21:% dat nu ≥ wekelijks rookt en/of een vape (e-sigaret) gebruikt.
*** LBRAK3S22: % dat nu dagelijks rookt en/of een vape (e-sigaret) gebruikt.

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  LBRAK311 'Heb je ooit gerookt?'
  LBRAK312 'Hoe vaak rook je nu?'
  LBGEK303 'Heb je ooit een vape gebruikt (e-sigaret)?'
  LBGEK302 'Hoe vaak vape je nu?'.
EXECUTE .

VALUE LABELS
  LBRAK311 1 'Ja, een hele sigaret of meer' 2 'Ja, alleen een paar trekjes' 3 'Nee' 9 'Onbekend' /
  LBRAK312 1 'Elke dag' 2 'Minstens 1 keer per week, maar niet elke dag' 3 'Minder dan 1 keer per week' 4 'Ik rook niet meer' 9 'Onbekend' /
  LBGEK303 1 'Ja' 2 'Nee' 9 'Onbekend'/
  LBGEK302 1 'Elke dag' 2 'Minstens 1 keer per week, maar niet elke dag' 3 'Minder dan 1 keer per week' 4 'Ik vape niet meer' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK311 LBRAK312 LBGEK303 LBGEK302 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK311 LBRAK312 LBGEK303 LBGEK302 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBRAK311) LBRAK311 = 9 .
IF missing (LBRAK312) LBRAK312 = 9 .
IF missing (LBGEK303) LBGEK303 = 9 .
IF missing (LBGEK302) LBGEK302 = 9 .
EXECUTE .

* Op basis van de voorlopervragen LBRAK311 en LBGEK303 de vervolgvragen LBRAK312 en LBGEK302 opschonen .
* Hiertoe nieuwe variabele voor de vervolgvragen aanmaken .
COMPUTE LBRAA312 = LBRAK312 .
COMPUTE LBGEA302 = LBGEK302 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBRAK312) LBRAA312 = 9 .
IF missing (LBGEK302) LBGEA302 = 9 .
EXECUTE .

* Als bij de voorlopervraag niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (LBRAK311) LBRAA312 = 9 .
IF missing (LBGEK303) LBGEA302 = 9 .
EXECUTE .

* Als de voorlopervraag met 'nee' is beantwoord, dan wordt de vervolgvraag op 'nvt' (waarde 8) gezet .
IF (LBRAK311 = 3) LBRAA312 = 8 .
IF (LBGEK303 = 2) LBGEA302 = 8 .
EXECUTE .

VARIABLE LABELS 
  LBRAA312 'Hoe vaak rook je nu? (opgeschoond)'
  LBGEA302 'Hoe vaak vape je nu? (opgeschoond)'.
EXECUTE .

VALUE LABELS
  LBRAA312 1 'Elke dag' 2 'Minstens 1 keer per week, maar niet elke dag' 3 'Minder dan 1 keer per week' 4 'Ik rook niet meer' 8 'Nvt' 9 'Onbekend' /
  LBGEA302 1 'Elke dag' 2 'Minstens 1 keer per week, maar niet elke dag' 3 'Minder dan 1 keer per week' 4 'Ik vape niet meer' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAA312 LBGEA302 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAA312 LBGEA302 (9) .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat ooit gerookt heeft (een hele sigaret of meer) .

RECODE LBRAK311 (1=1)(2=0)(3=0)(else=copy) into LBRAK3S11 .
EXECUTE .

VARIABLE LABELS 
  LBRAK3S11 'Ooit gerookt (hele sigaret of meer)' .
EXECUTE .

VALUE LABELS 
  LBRAK3S11 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S11 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S11 (9) .
EXECUTE .

* Aanmaken indicator: % dat ooit gerookt heeft (alleen een paar trekjes of een hele sigaret of meer) .

RECODE LBRAK311 (1=1)(2=1)(3=0)(else=copy) into LBRAK3S12 .
EXECUTE .

VARIABLE LABELS 
  LBRAK3S12 'Ooit gerookt (alleen trekjes of hele sigaret of meer)' .
EXECUTE .

VALUE LABELS 
  LBRAK3S12 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S12 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S12 (9) .
EXECUTE .

* Aanmaken indicator: % dat nu dagelijks rookt .

RECODE LBRAA312 (1=1)(2 thru 4=0)(8=0)(else=copy) into LBRAK3S18 .
EXECUTE .

VARIABLE LABELS 
  LBRAK3S18 'Rookt nu dagelijks' .
EXECUTE .

VALUE LABELS 
  LBRAK3S18 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S18 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S18 (9) .
EXECUTE .

* Aanmaken indicator: % dat nu ≥ wekelijks rookt .

RECODE LBRAA312 (1 thru 2=1)(3 thru 4=0)(8=0)(else=copy) into LBRAK3S19 .
EXECUTE .

VARIABLE LABELS 
  LBRAK3S19 'Rookt nu ≥ wekelijks' .
EXECUTE .

VALUE LABELS 
  LBRAK3S19 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S19 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S19 (9) .
EXECUTE .


* Aanmaken indicator: % dat ooit een vape (e-sigaret) heeft gebruikt .

RECODE LBGEK303 (1=1)(2=0)(else=copy) into LBGEK3S4 .
EXECUTE .

VARIABLE LABELS 
  LBGEK3S4 'Ooit vape (e-sigaret) gebruikt' .
EXECUTE .

VALUE LABELS 
  LBGEK3S4 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK3S4 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK3S4 (9) .
EXECUTE .

* Aanmaken indicator: % dat tenminste wekelijks een vape (e-sigaret) gebruikt 

RECODE LBGEA302 (1 thru 2=1)(3 thru 4=0)(8=0)(else=copy) into LBGEK3S3 .
EXECUTE .

VARIABLE LABELS 
  LBGEK3S3 'Vapet nu ≥ wekelijks' .
EXECUTE .

VALUE LABELS 
  LBGEK3S3 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK3S3 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK3S3 (9) .
EXECUTE .

* Aanmaken indicator: % dat dagelijks een vape (e-sigaret) gebruikt.

RECODE LBGEA302 (1=1)(2 thru 4=0)(8=0)(else=copy) into LBGEK3S2 .
EXECUTE .

VARIABLE LABELS 
  LBGEK3S2 'Vapet nu dagelijks' .
EXECUTE .

VALUE LABELS 
  LBGEK3S2 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK3S2 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK3S2 (9) .
EXECUTE .


* Aanmaken indicator: % dat ooit gerookt heeft (alleen een paar trekjes of een hele sigaret of meer) en/of ooit een vape (e-sigaret) heeft gebruikt.

COMPUTE LBRAK3S20 = 9.
IF (LBRAK3S12 = 1 OR LBGEK3S4 = 1) LBRAK3S20 = 1.
IF (LBRAK3S12 = 0 AND LBGEK3S4 = 0) LBRAK3S20 = 0.
EXECUTE.

VARIABLE LABELS 
  LBRAK3S20 'Ooit gerookt (alleen trekjes of hele sigaret of meer) en/of een vape (e-sigaret) gebruikt' .
EXECUTE .

VALUE LABELS
  LBRAK3S20 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S20 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S20 (9) .
EXECUTE .

* Aanmaken indicator: % dat nu ≥ wekelijks rookt en/of een vape (e-sigaret) gebruikt.

COMPUTE LBRAK3S21 = 9.
IF (LBRAK3S19 = 1 OR LBGEK3S3 = 1) LBRAK3S21 = 1.
IF (LBRAK3S19 = 0 AND LBGEK3S3 = 0) LBRAK3S21 = 0.
EXECUTE.

VARIABLE LABELS 
  LBRAK3S21 'Rookt en/of vapet nu ≥ wekelijks' .
EXECUTE .

VALUE LABELS
  LBRAK3S21 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S21 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S21 (9) .
EXECUTE .

* Aanmaken indicator: % dat nu dagelijks rookt en/of een vape (e-sigaret) gebruikt.

COMPUTE LBRAK3S22 = 9.
IF (LBRAK3S18 = 1 OR LBGEK3S2 = 1) LBRAK3S22 = 1.
IF (LBRAK3S18 = 0 AND LBGEK3S2 = 0) LBRAK3S22 = 0.
EXECUTE.

VARIABLE LABELS 
  LBRAK3S22 'Rookt en/of vapet nu dagelijks' .
EXECUTE .

VALUE LABELS
  LBRAK3S22 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK3S22 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK3S22 (9) .
EXECUTE .

*** EINDE VAN DE SYNTAX ***


