* Encoding: UTF-8.

********************************************************************************************************
*** Syntax Houding ouders roken
*** Versie 2 / 18 november 2022 Stephanie Brinkhues, Gea 20/12/2022 nvt 8 ook op missing gezet.
*** Versie 3 / 14 november 2025 Marijke von Bergh

*** Contactpersoon: 

********************************************************************************************************
 ***OKO Gezondheidsmonitor Jeugd 2025
********************************************************************************************************
***nieuw in 2025 is de houding van ouders tov vapen; vraagstelling/indicatoren gelijk aan die van roken.
***de aangemaakte indicatoren in 2023 hebben ten onrechte een S ipv een A gekregen. Vanaf nu is de  S veranderd in een A.
***LBRAK303A7: variable label aangepast; was slecht Nederlands en niet in lijn met de rest.
***Variabele houding ouders tov roken resp vapen (opgeschoonde versie) gerecodeerd in een 'logische' volgorde: 
*** - roken: LBRAA305 en LBRAA306, bestaande uit een gehercodeerde LBRAK303 en LBRAK304 
*** - vapen: LBGEA306 en LBGEA307, bestaande uit een gehercodeerde LBGEK304 resp LBGEK305.

********************************************************************************************************
 ***OKO Gezondheidsmonitor Jeugd 2022
********************************************************************************************************
***deze syntax runnen na  Standaard Roken actief-1219-vragenlijst-kind 

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:

***LBRAK303A1: % ouders dat het rookgedrag van zijn/haar kind goed vindt 
***LBRAK303A2:% ouders dat vindt dat zijn/haar kind minder moet roken
***LBRAK303A3:% ouders dat zijn/haar kind het roken afraadt
***LBRAK303A4:% ouders dat zijn/haar kind roken verbiedt
***LBRAK303A5:% ouders dat niets zegt van het rookgedrag van zijn/haar kind
***LBRAK303A6:% ouders dat niet weet dat zijn/haar kind rookt
***LBRAK303A7:% ouders dat rookgedrag goedkeurt of er niets van zegt
***LBRAK303A8:% ouders dat rookgedrag afkeurt of er niets van weet   

***LBRAK304A1: % ouders dat het rookgedrag van zijn/haar kind goed zou vinden 
***LBRAK304A2:% ouders dat zijn/haar kind het roken zou afraden 
***LBRAK304A3:% ouders dat zijn/haar kind roken zou verbieden
***LBRAK304A4:% ouders dat niets zou zeggen van het rookgedrag van zijn/haar kind
***LBRAK304A5:% kinderen dat niet weet wat hun ouders ervan zouden vinden
***LBRAK304A6:% ouders dat rookgedrag zouden goedkeuren of er niets van zou zeggen
***LBRAK304A7:% ouders dat rookgedrag zou afkeuren 

***LBGEK304A1: % ouders dat het vapegedrag van zijn/haar kind goed vindt 
***LBGEK304A2:% ouders dat vindt dat zijn/haar kind minder moet vapen
***LBGEK304A3:% ouders dat zijn/haar kind het vapen afraadt
***LBGEK304A4:% ouders dat zijn/haar kind vapen verbiedt
***LBGEK304A5:% ouders dat niets zegt van het vapegedrag van zijn/haar kind
***LBGEK304A6:% ouders dat niet weet dat zijn/haar kind vapet
***LBGEK304A7:% ouders dat vapegedrag goedkeurt of er niets van zegt
***LBGEK304A8:% ouders dat vapegedrag afkeurt of er niets van weet   

***LBGEK305A1: % ouders dat het vapegedrag van zijn/haar kind goed zou vinden 
***LBGEK305A2:% ouders dat zijn/haar kind het vapen zou afraden 
***LBGEK305A3:% ouders dat zijn/haar kind vapen zou verbieden
***LBGEK305A4:% ouders dat niets zou zeggen van het vapegedrag van zijn/haar kind
***LBGEK305A5:% kinderen dat niet weet wat hun ouders ervan zouden vinden
***LBGEK305A6:% ouders dat vapegedrag zouden goedkeuren of er niets van zou zeggen
***LBGEK305A7:% ouders dat vapegedrag zou afkeuren


*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***
    
VARIABLE LABELS 
  LBRAK303 'Wat vinden je ouders/verzorgers ervan dat je rookt?'.
EXECUTE .

VALUE LABELS
  LBRAK303 1 'Ze vinden het goed' 2 'Ze vinden dat ik minder moet roken' 3 'Ze raden het af' 4 'Ze verbieden het' 
  5 'Ze zeggen er niets van' 6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303(F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBRAK303) LBRAK303 = 9 .
EXECUTE .


* Op basis van de opgeschoonde voorlopervariabele LBRAA312 (hoe vaak rook je nu?) de vraag LBRAK303 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: LBRAA303.

COMPUTE LBRAA303 = LBRAK303 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBRAK303) LBRAA303 = 9 .
EXECUTE .

* Als bij de voorlopervariabele LBRAA312 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (LBRAA312) LBRAA303 = 9 .
EXECUTE .

* Als de vvoorlopervariabele LBRAA312  met 'ik rook niet' of 'ik rook minder dan 1 keer per week' is beantwoord, dan wordt de vervolgvraag op 'nvt' (waarde 8) gezet .
**aangepast in 2025: alleen als de voorlopervariabele LBRAA312  met 'ik rook niet' is beantwoord, dan wordt de vervolgvraag op 'nvt' (waarde 8) gezet .
*IF (LBRAA312 = 3) LBRAA303 = 8 .
IF (LBRAA312 = 4) LBRAA303 = 8 .
EXECUTE .

VARIABLE LABELS 
  LBRAA303 'Wat vinden je ouders/verzorgers ervan dat je rookt?'.
EXECUTE .

VALUE LABELS
  LBRAA303 1 'Ze vinden het goed' 2 'Ze vinden dat ik minder moet roken' 3 'Ze raden het af' 4 'Ze verbieden het' 
  5 'Ze zeggen er niets van' 6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAA303(F1.0) .
EXECUTE .

MISSING VALUES
  LBRAA303 (8,9) .
EXECUTE .

VARIABLE LABELS 
  LBRAK304 'Wat zouden je ouders/verzorgers ervan vinden als je zou roken?'.
EXECUTE .

VALUE LABELS
  LBRAK304 1 'Ze zouden het goed vinden' 2  'Ze zouden het afraden' 3 'Ze zouden het verbieden' 
  4 'Ze zouden er niets van zeggen' 5 'Dat weet ik niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304(F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBRAK304) LBRAK304 = 9 .
EXECUTE .


* Op basis van de opgeschoonde voorlopervariabele LBRAA312 (hoe vaak rook je nu?) de vraag LBRAK303 opschonen . MvB: dit moet zijn LBRAK304 ipv LBRAK303.
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: LBRAA303. ->  MvB: dit moet zijn LBRAA304

COMPUTE LBRAA304 = LBRAK304 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBRAK304) LBRAA304 = 9 .
EXECUTE .

* Als bij de voorlopervariabele LBRAA312 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (LBRAA312) LBRAA304 = 9 .
EXECUTE .

* Als de vvoorlopervariabele LBRAA312 met 'elke dag, minstens 1 keer per week' of 'minder dan 1 keer per week' is beantwoord, dan wordt de vervolgvraag op 'nvt' (waarde 8) gezet .
IF (LBRAA312 = 1) LBRAA304 = 8 .
IF (LBRAA312 = 2) LBRAA304 = 8 .
IF (LBRAA312 = 3) LBRAA304 = 8 .
EXECUTE .

VARIABLE LABELS 
  LBRAA304 'Wat zouden je ouders/verzorgers ervan vinden als je zou roken?'.
EXECUTE .

VALUE LABELS
  LBRAA304 1 'Ze zouden het goed vinden' 2  'Ze zouden het afraden' 3 'Ze zouden het verbieden' 
  4 'Ze zouden er niets van zeggen' 5 'Dat weet ik niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAA304(F1.0) .
EXECUTE .

MISSING VALUES
  LBRAA304 (8,9) .
EXECUTE .

VARIABLE LABELS 
  LBGEK304 'Wat vinden je ouders/verzorgers ervan dat je vapet?'.
EXECUTE .

VALUE LABELS
  LBGEK304 1 'Ze vinden het goed' 2 'Ze vinden dat ik minder moet vapen' 3 'Ze raden het af' 4 'Ze verbieden het' 
  5 'Ze zeggen er niets van' 6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304(F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBGEK304) LBGEK304 = 9 .
EXECUTE .


* Op basis van de opgeschoonde voorlopervariabele LBGEA302 (hoe vaak vape je nu?) de vraag LBGEK304 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: LBGEA304.

COMPUTE LBGEA304 = LBGEK304 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBGEK304) LBGEA304 = 9 .
EXECUTE .

* Als bij de voorlopervariabele LBGEA302 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (LBGEA302) LBGEA304 = 9 .
EXECUTE .

* Als de voorlopervariabele LBGEA302  met 'ik vape niet' is beantwoord, dan wordt de vervolgvraag op 'nvt' (waarde 8) gezet .
IF (LBGEA302 = 4) LBGEA304 = 8 .
EXECUTE .

VARIABLE LABELS 
  LBGEA304 'Wat vinden je ouders/verzorgers ervan dat je vapet?'.
EXECUTE .

VALUE LABELS
  LBGEA304 1 'Ze vinden het goed' 2 'Ze vinden dat ik minder moet vapen' 3 'Ze raden het af' 4 'Ze verbieden het' 
  5 'Ze zeggen er niets van' 6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEA304(F1.0) .
EXECUTE .

MISSING VALUES
  LBGEA304 (8,9) .
EXECUTE .

VARIABLE LABELS 
  LBGEK305 'Wat zouden je ouders/verzorgers ervan vinden als je zou vapen?'.
EXECUTE .

VALUE LABELS
  LBGEK305 1 'Ze zouden het goed vinden' 2  'Ze zouden het afraden' 3 'Ze zouden het verbieden' 
  4 'Ze zouden er niets van zeggen' 5 'Dat weet ik niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305(F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBGEK305) LBGEK305 = 9 .
EXECUTE .


* Op basis van de opgeschoonde voorlopervariabele LBGEA302 (hoe vaak vape je nu?) de vraag LBGEK305 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: LBGEA305.

COMPUTE LBGEA305 = LBGEK305 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LBGEK305) LBGEA305 = 9 .
EXECUTE .

* Als bij de voorlopervariabele LBGEA302 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (LBGEA302) LBGEA305 = 9 .
EXECUTE .

* Als de voorlopervariabele LBGEA302 met 'elke dag, minstens 1 keer per week' of 'minder dan 1 keer per week' is beantwoord, dan wordt de vervolgvraag op 'nvt' (waarde 8) gezet .
IF (LBGEA302 = 1) LBGEA305 = 8 .
IF (LBGEA302 = 2) LBGEA305 = 8 .
IF (LBGEA302 = 3) LBGEA305 = 8 .
EXECUTE .

VARIABLE LABELS 
  LBGEA305 'Wat zouden je ouders/verzorgers ervan vinden als je zou vapen?'.
EXECUTE .

VALUE LABELS
  LBGEA305 1 'Ze zouden het goed vinden' 2  'Ze zouden het afraden' 3 'Ze zouden het verbieden' 
  4 'Ze zouden er niets van zeggen' 5 'Dat weet ik niet' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEA305(F1.0) .
EXECUTE .

MISSING VALUES
  LBGEA305 (8,9) .
EXECUTE .

**Recoden opgeschoonde variabelen in variabelen met logische volgorde antwoordcategorieën:.

RECODE LBRAA303 (1=1)(2=3)(3=4)(4=5)(5=2)(6=6)(else=copy) into LBRAA305.
RECODE LBRAA304 (1=1)(2=3)(3=4)(4=2)(5=5)(else=copy) into LBRAA306.
VARIABLE LABELS 
  LBRAA305 'Wat vinden je ouders/verzorgers ervan dat je rookt?'.
VARIABLE LABELS 
  LBRAA306 'Wat zouden je ouders/verzorgers ervan vinden als je zou roken?'.
VALUE LABELS 
  LBRAA305 1 'Ze vinden het goed' 2 'Ze zeggen er niets van' 3 'Ze vinden dat ik minder moet roken' 4 'Ze raden het af' 5 'Ze verbieden het'  6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend'.
VALUE LABELS
  LBRAA306 1 'Ze zouden het goed vinden' 2 'Ze zouden er niets van zeggen' 3 'Ze zouden het afraden' 4 'Ze zouden het verbieden' 5 'Dat weet ik niet' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LBRAA305 LBRAA306 (F1.0) .
EXECUTE .
MISSING VALUES
  LBRAA305 LBRAA306 (8,9) .
EXECUTE .

RECODE LBGEA304 (1=1)(2=3)(3=4)(4=5)(5=2)(6=6)(else=copy) into LBGEA306.
RECODE LBGEA305 (1=1)(2=3)(3=4)(4=2)(5=5)(else=copy) into LBGEA307.
VARIABLE LABELS 
  LBGEA306 'Wat vinden je ouders/verzorgers ervan dat je vapet?'.
VARIABLE LABELS 
  LBGEA307 'Wat zouden je ouders/verzorgers ervan vinden als je zou vapen?'.
VALUE LABELS 
  LBGEA306 1 'Ze vinden het goed' 2 'Ze zeggen er niets van' 3 'Ze vinden dat ik minder moet roken' 4 'Ze raden het af' 5 'Ze verbieden het'  6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend'.
VALUE LABELS
  LBGEA307 1 'Ze zouden het goed vinden' 2  'Ze zouden er niets van zeggen' 3 'Ze zouden het afraden' 4 'Ze zouden het verbieden' 5 'Dat weet ik niet' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LBGEA306 LBGEA307 (F1.0) .
EXECUTE .
MISSING VALUES
 LBGEA306 LBGEA307 (8,9) .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

***LBRAK303A1: % ouders dat het rookgedrag van zijn/haar kind goed vindt .
RECODE LBRAA303 (1=1)(2=0)(3=0) (4=0) (5=0) (6=0) (else=copy) into LBRAK303A1 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A1 'Ouders vinden het rookgedrag van zijn/haar kind goed (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A1 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A1 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A1 (8,9) .
EXECUTE .

***LBRAK303A2:% ouders dat vindt dat zijn/haar kind minder moet roken.
RECODE LBRAA303 (1=0)(2=1)(3=0) (4=0) (5=0) (6=0) (else=copy) into LBRAK303A2 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A2 'Ouders vinden dat zijn/haar kind minder moet roken (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A2 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A2 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A2 (8,9) .
EXECUTE.

***LBRAK303A3:% ouders dat zijn/haar kind het roken afraadt.
RECODE LBRAA303 (1=0)(2=0)(3=1) (4=0) (5=0) (6=0) (else=copy) into LBRAK303A3 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A3 'Ouders raden zijn/haar kind het roken af (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A3 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A3 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A3 (8,9) .
EXECUTE .

***LBRAK303A4:% ouders dat zijn/haar kind roken verbiedt.
RECODE LBRAA303 (1=0)(2=0)(3=0) (4=1) (5=0) (6=0) (else=copy) into LBRAK303A4 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A4 'Ouders verbieden zijn/haar kind het roken (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A4 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A4 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A4 (8,9) .
EXECUTE .

***LBRAK303A5:% ouders dat niets zegt van het rookgedrag van zijn/haar kind.
RECODE LBRAA303 (1=0)(2=0)(3=0) (4=0) (5=1) (6=0) (else=copy) into LBRAK303A5 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A5 'Ouders zeggen niets van het rookgedrag van zijn/haar kind (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A5 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A5 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A5 (8,9) .
EXECUTE .

***LBRAK303A6:% ouders dat niet weet dat zijn/haar kind rookt.
RECODE LBRAA303 (1=0)(2=0)(3=0) (4=0) (5=0) (6=1) (else=copy) into LBRAK303A6 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A6 'Ouders weten niet dat zijn/haar kind rookt (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A6 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A6 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A6 (8,9) .
EXECUTE .

***LBRAK303A7:% ouders dat rookgedrag goedkeurt of er niets van zegt.    
RECODE LBRAA303 (1=1)(2=0)(3=0) (4=0) (5=1) (6=0) (else=copy) into LBRAK303A7 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A7 'Ouders keuren rookgedrag goed of zeggen er niets van (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A7 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A7 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A7 (8,9) .
EXECUTE .

**LBRAK303A8:% ouders dat rookgedrag afkeurt of er niets van weet.    
RECODE LBRAA303 (1=0)(2=1)(3=1) (4=1) (5=0) (6=1) (else=copy) into LBRAK303A8 .
EXECUTE .

VARIABLE LABELS 
  LBRAK303A8 'ouders dat rookgedrag afkeurt of er niets van weet (kind rookt)' .
EXECUTE .

VALUE LABELS 
  LBRAK303A8 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK303A8 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK303A8 (8,9) .
EXECUTE .

***LBRAK304A1: % ouders dat het rookgedrag van zijn/haar kind goed zou vinden .
RECODE LBRAA304 (1=1)(2=0)(3=0) (4=0) (5=0) (else=copy) into LBRAK304A1 .
EXECUTE .

VARIABLE LABELS 
  LBRAK304A1 'Ouders zouden het rookgedrag van zijn/haar kind goed vinden (kind rookt niet)' .
EXECUTE .

VALUE LABELS 
  LBRAK304A1 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304A1 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304A1 (8,9) .
EXECUTE .

***LBRAK304A2:% ouders dat zijn/haar kind het roken zou afraden.
RECODE LBRAA304 (1=0)(2=1)(3=0) (4=0) (5=0) (else=copy) into LBRAK304A2.
EXECUTE .

VARIABLE LABELS 
  LBRAK304A2 'Ouders zouden zijn/haar kind het roken afraden (kind rookt niet)' .
EXECUTE .

VALUE LABELS 
  LBRAK304A2 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304A2 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304A2 (8,9) .
EXECUTE .
 
***LBRAK304A3:% ouders dat zijn/haar kind roken zou verbieden.
RECODE LBRAA304 (1=0)(2=0)(3=1) (4=0) (5=0) (else=copy) into LBRAK304A3.
EXECUTE .

VARIABLE LABELS 
  LBRAK304A3 'Ouders zouden zijn/haar kind het roken verbieden (kind rookt niet)' .
EXECUTE .

VALUE LABELS 
  LBRAK304A3 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304A3 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304A3 (8,9) .
EXECUTE .

***LBRAK304A4:% ouders dat niets zou zeggen van het rookgedrag van zijn/haar kind.
RECODE LBRAA304 (1=0)(2=0)(3=0) (4=1) (5=0) (else=copy) into LBRAK304A4.
EXECUTE .

VARIABLE LABELS 
  LBRAK304A4 'Ouders zouden niets zeggen van het rookgedrag van zijn/haar kind (kind rookt niet)' .
EXECUTE .

VALUE LABELS 
  LBRAK304A4 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304A4 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304A4 (8,9) .
EXECUTE .

***LBRAK304A5:% kinderen dat niet weet wat hun ouders ervan zouden vinden.
RECODE LBRAA304 (1=0)(2=0)(3=0) (4=0) (5=1) (else=copy) into LBRAK304A5.
EXECUTE .

VARIABLE LABELS 
  LBRAK304A5 'Kind weet niet wat de ouders van zijn rookgedrag zou vinden (kind rookt niet)' .
EXECUTE .

VALUE LABELS 
  LBRAK304A5 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304A5 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304A5 (8,9) .
EXECUTE. 

***LBRAK303A6:% ouders dat rookgedrag zou goedkeuren of er niets van zou zeggen.
RECODE LBRAA304 (1=1)(2=0)(3=0) (4=1) (5=0) (else=copy) into LBRAK304A6.
EXECUTE .

VARIABLE LABELS 
  LBRAK304A6 'Ouders zouden rookgedrag goedkeuren of er niets van zeggen (kind rookt niet)' .
EXECUTE .

VALUE LABELS 
  LBRAK304A6 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304A6 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304A6 (8,9) .
EXECUTE. 

**LBRAK303A7:% ouders dat rookgedrag zou afkeuren .    
RECODE LBRAA304 (1=0)(2=1)(3=1) (4=0) (5=0) (else=copy) into LBRAK304A7.
EXECUTE .

VARIABLE LABELS 
  LBRAK304A7 'Ouders zouden rookgedrag afkeuren (kind rookt niet)' .
EXECUTE .

VALUE LABELS 
  LBRAK304A7 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBRAK304A7 (F1.0) .
EXECUTE .

MISSING VALUES
  LBRAK304A7 (8,9) .
EXECUTE. 


***LBGEK304A1: % ouders dat het vapegedrag van zijn/haar kind goed vindt .
RECODE LBGEA304 (1=1)(2=0)(3=0) (4=0) (5=0) (6=0) (else=copy) into LBGEK304A1 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A1 'Ouders vinden het vapegedrag van zijn/haar kind goed (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A1 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A1 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A1 (8,9) .
EXECUTE .

***LBGEK304A2:% ouders dat vindt dat zijn/haar kind minder moet vapen.
RECODE LBGEA304 (1=0)(2=1)(3=0) (4=0) (5=0) (6=0) (else=copy) into LBGEK304A2 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A2 'Ouders vinden dat zijn/haar kind minder moet vapen (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A2 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A2 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A2 (8,9) .
EXECUTE.

***LBGEK304A3:% ouders dat zijn/haar kind het vapen afraadt.
RECODE LBGEA304 (1=0)(2=0)(3=1) (4=0) (5=0) (6=0) (else=copy) into LBGEK304A3 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A3 'Ouders raden zijn/haar kind het vapen af (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A3 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A3 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A3 (8,9) .
EXECUTE .

***LBGEK304A4:% ouders dat zijn/haar kind vapen verbiedt.
RECODE LBGEA304 (1=0)(2=0)(3=0) (4=1) (5=0) (6=0) (else=copy) into LBGEK304A4 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A4 'Ouders verbieden zijn/haar kind het vapen (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A4 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A4 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A4 (8,9) .
EXECUTE .

***LBGEK304A5:% ouders dat niets zegt van het vapegedrag van zijn/haar kind.
RECODE LBGEA304 (1=0)(2=0)(3=0) (4=0) (5=1) (6=0) (else=copy) into LBGEK304A5 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A5 'Ouders zeggen niets van het vapegedrag van zijn/haar kind (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A5 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A5 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A5 (8,9) .
EXECUTE .

***LBGEK304A6:% ouders dat niet weet dat zijn/haar kind vapet.
RECODE LBGEA304 (1=0)(2=0)(3=0) (4=0) (5=0) (6=1) (else=copy) into LBGEK304A6 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A6 'Ouders weten niet dat zijn/haar kind vapet (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A6 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A6 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A6 (8,9) .
EXECUTE .

***LBGEK304A7:% ouders dat vapegedrag goedkeurt of niets van zegt.    
RECODE LBGEA304 (1=1)(2=0)(3=0) (4=0) (5=1) (6=0) (else=copy) into LBGEK304A7 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A7 'Ouders vinden vapegedrag goed of zeggen er niets van (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A7 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A7 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A7 (8,9) .
EXECUTE .

**LBGEK304A8:% ouders dat vapegedrag afkeurt of er niets van weet.    
RECODE LBGEA304 (1=0)(2=1)(3=1) (4=1) (5=0) (6=1) (else=copy) into LBGEK304A8 .
EXECUTE .

VARIABLE LABELS 
  LBGEK304A8 'Ouders keuren vapegedrag af of weten er niets van (kind vapet)' .
EXECUTE .

VALUE LABELS 
  LBGEK304A8 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK304A8 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK304A8 (8,9) .
EXECUTE .

***LBGEK305A1: % ouders dat het vapegedrag van zijn/haar kind goed zou vinden .
RECODE LBGEA305 (1=1)(2=0)(3=0) (4=0) (5=0) (else=copy) into LBGEK305A1 .
EXECUTE .

VARIABLE LABELS 
  LBGEK305A1 'Ouders zouden het vapegedrag van zijn/haar kind goed vinden (kind vapet niet)' .
EXECUTE .

VALUE LABELS 
  LBGEK305A1 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305A1 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305A1 (8,9) .
EXECUTE .

***LBGEK305A2:% ouders dat zijn/haar kind het vapen zou afraden.
RECODE LBGEA305 (1=0)(2=1)(3=0) (4=0) (5=0) (else=copy) into LBGEK305A2.
EXECUTE .

VARIABLE LABELS 
  LBGEK305A2 'Ouders zouden zijn/haar kind het vapen afraden (kind vapet niet)' .
EXECUTE .

VALUE LABELS 
  LBGEK305A2 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305A2 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305A2 (8,9) .
EXECUTE .
 
***LBGEK305A3:% ouders dat zijn/haar kind vapen zou verbieden.
RECODE LBGEA305 (1=0)(2=0)(3=1) (4=0) (5=0) (else=copy) into LBGEK305A3.
EXECUTE .

VARIABLE LABELS 
  LBGEK305A3 'Ouders zouden zijn/haar kind het vapen verbieden (kind vapet niet)' .
EXECUTE .

VALUE LABELS 
  LBGEK305A3 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305A3 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305A3 (8,9) .
EXECUTE .

***LBGEK305A4:% ouders dat niets zou zeggen van het vapegedrag van zijn/haar kind.
RECODE LBGEA305 (1=0)(2=0)(3=0) (4=1) (5=0) (else=copy) into LBGEK305A4.
EXECUTE .

VARIABLE LABELS 
  LBGEK305A4 'Ouders zouden niets zeggen van het vapegedrag van zijn/haar kind (kind vapet niet)' .
EXECUTE .

VALUE LABELS 
  LBGEK305A4 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305A4 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305A4 (8,9) .
EXECUTE .

***LBGEK305A5:% kinderen dat niet weet wat hun ouders ervan zouden vinden.
RECODE LBGEA305 (1=0)(2=0)(3=0) (4=0) (5=1) (else=copy) into LBGEK305A5.
EXECUTE .

VARIABLE LABELS 
  LBGEK305A5 'Kind weet niet wat hun ouders van hun vapegedrag zou vinden (kind vapet niet)' .
EXECUTE .

VALUE LABELS 
  LBGEK305A5 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305A5 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305A5 (8,9) .
EXECUTE. 

***LBGEK304A6:% ouders dat vapegedrag zouden goedkeuren of niets van zeggen.
RECODE LBGEA305 (1=1)(2=0)(3=0) (4=1) (5=0) (else=copy) into LBGEK305A6.
EXECUTE .

VARIABLE LABELS 
  LBGEK305A6 'Ouders zouden vapegedrag goed vinden of niets van zeggen (kind vapet niet)' .
EXECUTE .

VALUE LABELS 
  LBGEK305A6 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305A6 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305A6 (8,9) .
EXECUTE. 

**LBGEK304A7:% ouders dat vapegedrag zou afkeuren .    
RECODE LBGEA305 (1=0)(2=1)(3=1) (4=0) (5=0) (else=copy) into LBGEK305A7.
EXECUTE .

VARIABLE LABELS 
  LBGEK305A7 'Ouders zouden vapegedrag afkeuren (kind vapet niet)' .
EXECUTE .

VALUE LABELS 
  LBGEK305A7 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  LBGEK305A7 (F1.0) .
EXECUTE .

MISSING VALUES
  LBGEK305A7 (8,9) .
EXECUTE.

FREQUENCIES LBRAK303A1 LBRAK303A2 LBRAK303A3 LBRAK303A4 LBRAK303A5 LBRAK303A6 LBRAK303A7 LBRAK303A8 LBRAK304A1 
LBRAK304A2 LBRAK304A3 LBRAK304A4 LBRAK304A5 LBRAK304A6 LBRAK304A7 LBGEK304A1 LBGEK304A2 LBGEK304A3 LBGEK304A4 LBGEK304A5 
LBGEK304A6 LBGEK304A7 LBGEK304A8 LBGEK305A1 LBGEK305A2 LBGEK305A3 LBGEK305A4 LBGEK305A5 LBGEK305A6 LBGEK305A7
LBRAA305 LBRAA306 LBGEA306 LBGEA307.

*** EINDE VAN DE SYNTAX ***.

