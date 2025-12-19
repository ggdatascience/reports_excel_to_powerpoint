* Encoding: UTF-8.
***************************************************************************************************************************************************************************.
*** Standaard Stress-1219-vragenlijst-kind .
*** Versie 1.1 / 15 november 2023 .
*** Standaard vastgesteld op 6 maart 2023 .
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
***********************************************************************************************************************************************************************************.

*** AANPASSINGEN TEN OPZICHTE VAN 2021
*** In 2023 beperkte (tekstuele) wijzigingen tov 2021, door het omzetten van een matrixvraag naar vijf losse vragen.
*** Tekstuele wijziging in variabele label van indicator SBSSK3S6

*** Toelichting bij vragenset: vragenset opgesteld door werkgroep vraagstellingen 2019, in overleg met landelijke brede klankbordgroep; lijst ook in gebruik door Trimbos.

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:
*** SBSSK3S1: % dat zich (zeer) vaak gestrest voelt door school of huiswerk .
*** SBSSK3S2: % dat zich (zeer) vaak gestrest voelt door situatie thuis .
*** SBSSK3S3: % dat zich (zeer) vaak gestrest voelt door eigen problemen .
*** SBSSK3S4: % dat zich (zeer) vaak gestrest voelt over wat anderen van diegene vinden .
*** SBSSK3S5: % dat zich (zeer) vaak gestrest voelt door alles wat diegene moet doen .
*** SBSSK3S6: % dat zich (zeer) vaak gestrest voelt door één of meer van de volgende factoren: school of huiswerk, situatie thuis, eigen problemen, wat anderen van diegene vinden, alles wat diegene moet doen.

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  SBSSK301 'Hoe vaak voel je je gestrest door school of huiswerk?'
  SBSSK302 'Hoe vaak voel je je gestrest door je situatie thuis?'
  SBSSK303 'Hoe vaak voel je je gestrest door je eigen problemen?'
  SBSSK304 'Hoe vaak voel je je gestrest over wat anderen van je vinden?'
  SBSSK305 'Hoe vaak voel je je gestrest door alles wat je moet doen?' .
EXECUTE.

VALUE LABELS
  SBSSK301 SBSSK302 SBSSK303 SBSSK304 SBSSK305 1 'Nooit' 2 'Bijna nooit' 3 'Soms' 4 'Vaak' 5 'Zeer vaak' 9 'Onbekend' .
EXECUTE.

FORMATS
  SBSSK301 SBSSK302 SBSSK303 SBSSK304 SBSSK305 (F1.0) .
EXECUTE.

MISSING VALUES
  SBSSK301 SBSSK302 SBSSK303 SBSSK304 SBSSK305 (9) .
EXECUTE.

 * Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SBSSK301) SBSSK301 = 9 .
IF missing (SBSSK302) SBSSK302 = 9 .
IF missing (SBSSK303) SBSSK303 = 9 .
IF missing (SBSSK304) SBSSK304 = 9 .
IF missing (SBSSK305) SBSSK305 = 9 .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat zich (zeer) vaak gestrest voelt door school of huiswerk .
RECODE SBSSK301 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SBSSK3S1 .
EXECUTE.
 
 * Aanmaken indicator: % dat zich (zeer) vaak gestrest voelt door situatie thuis .
RECODE SBSSK302 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SBSSK3S2 . 
EXECUTE.    

* Aanmaken indicator: % dat zich (zeer) vaak gestrest voelt door eigen problemen .
RECODE SBSSK303 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SBSSK3S3 .
EXECUTE.

* Aanmaken indicator: % dat zich (zeer) vaak gestrest voelt over wat anderen van hem/haar vinden .
RECODE SBSSK304 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SBSSK3S4 .
EXECUTE.

* Aanmaken indicator: % dat zich (zeer) vaak gestrest voelt door alles wat ze moeten doen .
RECODE SBSSK305 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SBSSK3S5 .
EXECUTE.

* Aanmaken indicator: % dat zich (zeer) vaak gestrest voelt door één of meer van de volgende factoren: school of huiswerk, situatie thuis, eigen problemen, wat anderen van je vinden, alles wat je moet doen.
COMPUTE SBSSK3S6 = 9 .
IF (SBSSK3S1=0 and SBSSK3S2=0 and SBSSK3S3=0 and SBSSK3S4=0 and SBSSK3S5=0) SBSSK3S6 = 0 .
IF (SBSSK3S1=1 or SBSSK3S2=1 or SBSSK3S3=1 or SBSSK3S4=1 or SBSSK3S5=1) SBSSK3S6 = 1 .
EXECUTE.

* Labels, format en missing values.
VARIABLE LABELS 
    SBSSK3S1 'Voelt zich (zeer) vaak gestrest door school of huiswerk' 
    SBSSK3S2 'Voelt zich (zeer) vaak gestrest door situatie thuis' 
    SBSSK3S3 'Voelt zich (zeer) vaak gestrest door eigen problemen' 
    SBSSK3S4 'Voelt zich (zeer) vaak gestrest over wat anderen van diegene vinden'
    SBSSK3S5 'Voelt zich (zeer) vaak gestrest door alles wat diegene moet doen'
    SBSSK3S6 'Voelt zich (zeer) vaak gestrest door één of meer van de volgende factoren: school of huiswerk, situatie thuis, eigen problemen, wat anderen van diegene vinden, alles wat diegene moet doen'.
EXECUTE.

VALUE LABELS 
    SBSSK3S1 SBSSK3S2 SBSSK3S3 SBSSK3S4 SBSSK3S5 0 'Nee (nooit tot soms)' 1 'Ja (vaak of zeer vaak)' 9 'Onbekend'/
    SBSSK3S6 0 'Nee' 1 'Ja' 9 'Onbekend'. 
EXECUTE. 

FORMATS SBSSK3S1 SBSSK3S2 SBSSK3S3 SBSSK3S4 SBSSK3S5 SBSSK3S6 (F1.0) .
EXECUTE.

MISSING VALUES SBSSK3S1 SBSSK3S2 SBSSK3S3 SBSSK3S4 SBSSK3S5 SBSSK3S6 (9) .
EXECUTE .

*** EINDE VAN DE SYNTAX ***.

