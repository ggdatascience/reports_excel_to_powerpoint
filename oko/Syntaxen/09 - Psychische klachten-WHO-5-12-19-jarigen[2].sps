* Encoding: UTF-8.

********************************************************************************************************
*** Basisstandaard MHI-5 (GM Jeugd)-1219-vragenlijst-kind .
*** Versie 3 / december 2025.
*** Standaard vastgesteld op XXX .
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl	.
********************************************************************************************************
***Wijzigingen december 2025
*Toevoegen definiëren ervaren mentale gezondheid
*Aanpassen label MHI5 naar WHO5 in regel 99
*Aanpassen indicatoren ervaren mentale gezondheid naar A (afgeleide) variabelen ipv S (samengestelde) variabelen

*** Wijzigingen in 2025 tov 2023
* In 2025 vervangen we MHI-5 met WHO-5
* We meten niet meer van psychische klachten, maar mentale gezondheid en emotioneel welbevinden.
* Ervaren mentale gezondheid uitgevraagd zoals in JV2024, in value labels 'Heel' ipv 'Zeer'.
* WHO5-score van 13 is het afkappunt: laag emotioneel welbevinden (0 - 12) & matig tot hoog emotioneel welbevinden (13 - 25). Er kan geen onderscheid gemaakt worden tussen matig en hoog.
* WHO-5 score wordt berekend wanneer er maximaal 2 vragen missen. Wanneer er antwoorden op 3 of meer WHO-5 vragen missen, is de WHO-5 score missing. 
* Bij iedere WHO5 vraag staat: De volgende vraag gaat over hoe je je in de laatste 2 weken hebt gevoeld.  

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
***WHO5_score 'Totale WHO5 score'.
***PBMGK3A1 'Ervaren mentale gezondheid in 3 categorieën'.
***PBMGK3A2 'Beoordeelt de eigen mentale gezondheid als (heel) goed'.
***PBMGK3S3 'Emotioneel welbevinden (WHO-5) in 2 categorieën'.
***PBMGK3S4 % 'Heeft een laag emotioneel welbevinden (WHO-5 score < 13)' .
***PBMGK3S5 % 'Heeft een matig tot hoog emotioneel welbevinden (WHO-5 score => 13)' .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

***Definiëren ervaren mentale gezondheid

VARIABLE LABELS 
  PBMGK301 'Hoe is meestal je mentale psychische gezondheid?'.
EXECUTE .
  
VALUE LABELS
  PBMGK301 1 'Heel goed' 2 'Goed' 3 'Gaat wel' 4 'Slecht' 5 'Heel slecht' 9 'Onbekend'.
EXECUTE .

FORMATS
  PBMGK301 (F1.0) .
EXECUTE .

MISSING VALUES
  PBMGK301 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (PBMGK301) PBMGK301 = 9 .
EXECUTE .

*** Omcoderen van WHO-5 vragen

RECODE
PBMGK302  PBMGK303  PBMGK304  PBMGK305  PBMGK306 (1=5) (2=4) (3=3) (4=2) (5=1) (6=0) (ELSE=COPY) INTO PBMGA302  PBMGA303  PBMGA304  PBMGA305  PBMGA306.
EXECUTE.

VARIABLE LABELS 
 PBMGA302 'Voelde je je vrolijk en opgewekt? (gehercodeerd)'
 PBMGA303 'Voelde je je rustig en ontspannen? (gehercodeerd)'
 PBMGA304 'Voelde je je actief en vol energie? (gehercodeerd)'
 PBMGA305 'Werd je uitgerust en fris wakker? (gehercodeerd)'
 PBMGA306 'Was je elke dag bezig met dingen die je interesseren? (gehercodeerd)'.
EXECUTE.

FORMATS
 PBMGA302  PBMGA303  PBMGA304  PBMGA305  PBMGA306 (F1.0).

VALUE LABELS 
 PBMGA302  PBMGA303  PBMGA304  PBMGA305  PBMGA306 5 'De hele tijd' 4 'Meestal' 3 'Meer dan de helft van de tijd' 2 'Minder dan de helft van de tijd' 1 'Soms' 0 'Nooit' 9 'Onbekend'.
EXECUTE . 

MISSING VALUES
 PBMGA302  PBMGA303  PBMGA304  PBMGA305  PBMGA306 (9).
EXECUTE.

*** STAP 2: INDICATOREN AANMAKEN ***

*Aanmaken WHO-5 score.
COUNT WHO5_missing =  PBMGA302  PBMGA303  PBMGA304  PBMGA305  PBMGA306 (9).
EXECUTE. 

COMPUTE WHO5_raw = sum(PBMGA302, PBMGA303,  PBMGA304,  PBMGA305,  PBMGA306).
EXECUTE.

DO IF (WHO5_missing LE 2).
COMPUTE WHO5_score = (WHO5_raw/(5-WHO5_missing)*5).
END IF.
EXECUTE.

DO IF (WHO5_missing GE 3).
COMPUTE WHO5_score = 999.
END IF.
EXECUTE.

VARIABLE LABELS
 WHO5_score 'Totale WHO5 score'.
EXECUTE.

VALUE LABELS 
 WHO5_score 999 'Onbekend'.
EXECUTE.

FORMATS 
 WHO5_score (F3.0).
EXECUTE.

MISSING VALUES 
 WHO5_score (999) .
EXECUTE.

***Aanmaken indicator: % dat de eigen mentale gezondheid als (heel) goed beoordeelt; % dat de eigen mentale gezondheid als matig beoordeelt; % dat de eigen mentale gezondheid als (heel) slecht beoordeelt.
RECODE PBMGK301 (1 thru 2=1) (3=2) (4 thru 5=3) (else=copy) INTO PBMGK3A1.
EXECUTE. 

VARIABLE LABELS 
 PBMGK3A1 'Ervaren mentale gezondheid in 3 categorieën'.
EXECUTE.

VALUE LABELS 
 PBMGK3A1 1 '(Heel) goed' 2 'Matig' 3 '(Heel) slecht' 9 'Onbekend'.
EXECUTE.

FORMATS  
 PBMGK3A1 (F1.0).
EXECUTE.

MISSING VALUES 
 PBMGK3A1 (9).
EXECUTE.

***Aanmaken indicator: % dat de eigen mentale gezondheid als (heel) goed beoordeelt.
RECODE  PBMGK301 (1 thru 2=1) (3 thru 5=0) (else=copy) INTO PBMGK3A2.
EXECUTE. 

VARIABLE LABELS 
 PBMGK3A2 'Beoordeelt de eigen mentale gezondheid als (heel) goed'.
EXECUTE.

VALUE LABELS 
 PBMGK3A2 0 'Nee' 1 'Ja' 9 'Onbekend'.
EXECUTE.

FORMATS  
 PBMGK3A2 (F1.0).
EXECUTE.

MISSING VALUES 
 PBMGK3A2 (9).
EXECUTE.

*Aanmaken indicator: emotioneel welbevinden in 2 categorieën. 

COMPUTE PBMGK3S3 = 9.
DO IF (WHO5_score GE 13 AND WHO5_score LE 100).
COMPUTE PBMGK3S3 = 1.
END IF.

DO IF (WHO5_score LE 12 AND WHO5_score GE 0).
COMPUTE PBMGK3S3 = 2.
END IF.
EXECUTE.

VARIABLE LABELS
 PBMGK3S3 'Emotioneel welbevinden (WHO-5) in 2 categorieën'.
EXECUTE.

VALUE LABELS 
 PBMGK3S3 1 'Matig tot hoog emotioneel welbevinden' 2 'Laag emotioneel welbevinden' 9 'Onbekend'.
EXECUTE . 

FORMATS PBMGK3S3 (F1.0) .
EXECUTE.

MISSING VALUES PBMGK3S3 (9) .
EXECUTE.

*Aanmaken indicator: % dat een laag emotioneel welbevinden heeft.

* als afkappunt voor emotioneel welbevinden kan een indeling in 2 categorieen worden gehanteerd .
* een WHO5-score van 13 is als afkappunt genomen: laag emotioneel welbevinden (0 - 12) & matig tot hoog emotioneel welbevinden (13 - 25). Er kan geen onderscheid gemaakt worden tussen matig en hoog.

RECODE PBMGK3S3 (1=0)(2=1)(else=copy) INTO PBMGK3S4.
EXECUTE. 

VARIABLE LABELS 
 PBMGK3S4 'Heeft een laag emotioneel welbevinden (WHO-5 score < 13)' .
EXECUTE.

VALUE LABELS 
 PBMGK3S4 0 'Nee' 1 'Ja' 9 'Onbekend'.
EXECUTE.

FORMATS PBMGK3S4 (F1.0) .
EXECUTE.

MISSING VALUES PBMGK3S4 (9) .
EXECUTE.


*Aanmaken indicator: % dat een matig tot hoog emotioneel welbevinden heeft.

* als afkappunt voor emotioneel welbevinden kan een indeling in 2 categorieen worden gehanteerd .
* een WHO5-score van 13 is als afkappunt genomen: laag emotioneel welbevinden (0 - 12) & matig tot hoog emotioneel welbevinden (13 - 25). Er kan geen onderscheid gemaakt worden tussen matig en hoog.

RECODE PBMGK3S3 (1=1)(2=0)(else=copy) INTO PBMGK3S5.
EXECUTE. 

VARIABLE LABELS 
 PBMGK3S5 'Heeft een matig tot hoog emotioneel welbevinden (WHO-5 score => 13)' .
EXECUTE.

VALUE LABELS 
 PBMGK3S5 0 'Nee' 1 'Ja' 9 'Onbekend'.
EXECUTE.

FORMATS PBMGK3S5 (F1.0) .
EXECUTE.

MISSING VALUES PBMGK3S5 (9) .
EXECUTE.

* Tijdelijke tussenvariabelen verwijderen .
DELETE VARIABLES WHO5_missing WHO5_raw.
EXECUTE .

*** EINDE VAN DE SYNTAX ***
