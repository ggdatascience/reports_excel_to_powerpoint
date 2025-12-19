* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Geluk-1219-vragenlijst-kind .
*** Versie 1 / 18 augustus 2025 .
*** Standaard vastgesteld op xxx .
*** Contactpersoon: ? / xxx@ggdghor.nl	
********************************************************************************************************

*** Geen wijzigingen in 2026 tov 2023 - iig ga ik daar even van uit. Heb alleen 'zeer' omgeschreven naar ' heel' -- nog checken of dat dan ook klopt!

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** EBGLK3S1: % dat zich meestal (heel) gelukkig voelt (score 4 of 5) .
*** EBGLK3S2: % dat zich meestal (heel) ongelukkig voelt (score 1 of 2) .
*** EBGLK3S3: % dat zich meestal (heel) ongelukkig voelt (score 1 of 2); % dat zich meestal neutraal voelt (score 3); % dat zich meestal (heel) gelukkig voelt (score 4 of 5) .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS 
 EBGLK301 'Hoe gelukkig voel je je meestal?' .
EXECUTE .

VALUE LABELS
 EBGLK301 1 'Score 1' 2 'Score 2' 3 'Score 3' 4 'Score 4' 5 'Score 5' 9 'Onbekend' .
EXECUTE .

FORMATS
 EBGLK301 (F1.0) .
EXECUTE .

MISSING VALUES
 EBGLK301 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (EBGLK301) EBGLK301 = 9 .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat zich meestal (heel) gelukkig voelt (score 4 of 5) .

RECODE EBGLK301 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into EBGLK3S1 .
EXECUTE .

VARIABLE LABELS 
 EBGLK3S1 'Voelt zich meestal (heel) gelukkig' .
EXECUTE .
 
VALUE LABELS
 EBGLK3S1 0 'Nee, voelt zich (heel) ongelukkig of neutraal (score 1, 2 of 3)' 1 'Ja (score 4 of 5)' 9 'Onbekend' .
EXECUTE .

FORMATS
 EBGLK3S1 (F1.0) .
EXECUTE .

MISSING VALUES
 EBGLK3S1 (9) .
EXECUTE .

* Aanmaken indicator: % dat zich meestal (heel) ongelukkig voelt (score 1 of 2) .

RECODE EBGLK301 (1=1)(2=1)(3=0)(4=0)(5=0)(else=copy) into EBGLK3S2 .
EXECUTE .

VARIABLE LABELS 
 EBGLK3S2 'Voelt zich meestal (heel) ongelukkig' .
EXECUTE .
 
VALUE LABELS
 EBGLK3S2 0 'Nee, voelt zich neutraal of (heel) gelukkig (score 3, 4 of 5)' 1 'Ja (score 1 of 2)' 9 'Onbekend' .
EXECUTE .

FORMATS
 EBGLK3S2 (F1.0) .
EXECUTE .

MISSING VALUES
 EBGLK3S2 (9) .
EXECUTE .

* Aanmaken indicator: % dat zich meestal (heel) ongelukkig voelt (score 1 of 2); % dat zich meestal neutraal voelt (score 3); % dat zich meestal (heel) gelukkig voelt (score 4 of 5) .

RECODE EBGLK301 (1=1)(2=1)(3=2)(4=3)(5=3)(else=copy) into EBGLK3S3 .
EXECUTE .

VARIABLE LABELS 
 EBGLK3S3 'Geluk in 3 categorieën' .
EXECUTE .
 
VALUE LABELS
 EBGLK3S3 1 'Voelt zich meestal (heel) ongelukkig (score 1 of 2)' 2 'Voelt zich meestal neutraal (score 3)' 3 'Voelt zich meestal (heel) gelukkig (score 4 of 5)' 9 'Onbekend' .
EXECUTE .

FORMATS
 EBGLK3S3 (F1.0) .
EXECUTE .

MISSING VALUES
 EBGLK3S3 (9) .
EXECUTE .

*** EINDE VAN DE SYNTAX ***

