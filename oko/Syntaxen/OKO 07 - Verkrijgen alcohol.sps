* Encoding: UTF-8.
********************************************************************************************************
*** Standaard sociale beschikbaarheid alcohol 1219-vragenlijst-kind (OKO)
*** Versie 1 / 1 november 2023 .
*** Contactpersoon: Frouwke Veenstra / fveenstra@ggdghor.nl
*** Voor OKO 2025 is deze syntax integraal overgenomen,  NdJ GGD GM 10 juli 2025.
*** Ook is de naamgeving van de indicatorvariabelen aangepast (A ipv S), omdat ze zijn afgeleid en niet zijn samengesteld.

**Naamgeving variabelen in 2025 aangepast tov 2023:
*** LOAGK3S11 wordt  LOAGK3A11 
*** LOAGK3S12 wordt  LOAGK3A12 
*** LOAGK3S13 wordt  LOAGK3A13 
*** LOAGK3S14 wordt  LOAGK3A14 
*** LOAGK3S15 wordt  LOAGK3A15 
********************************************************************************************************



**LET OP: In de bereking van de indicator worden alleen jongeren meegenomen, die ooit een heel glas hebben gedronken
**Naamgeving variabelen in 2023 aangepast tov 2022:
*** LBAGK3S18 wordt LOAGK3S11
*** LBAGK3S19 wordt LOAGK3S12
*** LBAGK3S20 wordt LOAGK3S13
*** LBAGK3S21 wordt LOAGK3S14
*** LBAGK3S22 wordt LOAGK3S15

*** LET OP: deze syntax runnen na  20- Alcoholgebruik-1219-vragenlijst-kind-basis [3]

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:
*** LOAGK3A11: % dat alcohol zelf koopt (heel glas of meer)
*** LOAGK3A12: % dat alcohol door anderen laat kopen (een vriend(in), kennis of vreemde) (heel glas of meer)
*** LOAGK3A13: %  dat alcohol krijgt van een vriend(in) of kennis (heel glas of meer)    
***LOAGK3A14: %  dat alcohol krijgt van ouders/verzorgers (heel glas of meer)
***LOAGK3A15: % dat alcohol krijgt van andere volwassenen (heel glas of meer)

    
*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

    
VARIABLE LABELS 
LOAGK311 'Ik koop alcohol ZELF'
LOAGK312  'Ik laat alcohol door anderen kopen (een vriend(in), kennis of vreemde)' 
LOAGK313  'Ik krijg alcohol van een vriend(in) of kennis' 
LOAGK314  'Ik krijg alcohol van mijn ouders/verzorgers' 
LOAGK315  'Ik krijg alcohol van een andere volwassenen' .
VALUE LABELS
 LOAGK311  LOAGK312  LOAGK313  LOAGK314  LOAGK315 1 'aangekruist' 2 ' niet aangekruist' 8 'Nvt' 9 'Onbekend'.
FORMATS
LOAGK311  LOAGK312  LOAGK313  LOAGK314  LOAGK315 (F1.0) .
MISSING VALUES
LOAGK311  LOAGK312  LOAGK313  LOAGK314  LOAGK315 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 2 .
IF missing (LOAGK311) LOAGK311 = 2 .
IF missing (LOAGK312) LOAGK312 = 2 .
IF missing (LOAGK313) LOAGK313 = 2 .
IF missing (LOAGK314) LOAGK314 = 2 .
IF missing (LOAGK315) LOAGK315 = 2 .
EXECUTE .


*** Als er niets is ingevuld bij de meerkeuzevraag, dan wordt de totale vraag op missend gezet***.
COUNT anee = LOAGK311 TO LOAGK315 (2).

IF (anee = 5) LOAGK311 = 9 .
IF (anee = 5) LOAGK312 = 9 .
IF (anee = 5) LOAGK313 = 9 .
IF (anee = 5) LOAGK314 = 9 .
IF (anee = 5) LOAGK315 = 9 .
EXECUTE .

* Op basis van de voorlopervraag  LBAGK391  (ooit alcohol gedronken) de vervolgvragen opschonen, in deze stap worden alleen heel glas drinkers meegenomen .
* Hiertoe een nieuwe variabele voor de vervolgvragen aanmaken: 

COMPUTE LOAGA311 = LOAGK311.
COMPUTE LOAGA312 = LOAGK312.
COMPUTE LOAGA313 = LOAGK313.
COMPUTE LOAGA314 = LOAGK314.
COMPUTE LOAGA315 = LOAGK315.
EXECUTE .

* Als bij de voorlopervraag LBAGK391 (ooit alcohol gedronken) niets is ingevuld, dan worden de vervolgvragen op missend (waarde 9) gezet .
IF missing (LBAGK391) LOAGA311 = 9 .
IF missing (LBAGK391) LOAGA312 = 9 .
IF missing (LBAGK391) LOAGA313 = 9 .
IF missing (LBAGK391) LOAGA314 = 9 .
IF missing (LBAGK391) LOAGA315 = 9 .
EXECUTE .

* Alleen kinderen meenemen die ooit een heel glas hebben gedronken, indien niet dan op 'nvt' (waarde 8) gezet .
IF (LBAGK391 = 2 OR LBAGK391= 3) LOAGA311 = 8 .
IF (LBAGK391 = 2 OR LBAGK391= 3) LOAGA312 = 8 .
IF (LBAGK391 = 2 OR LBAGK391= 3) LOAGA313 = 8 .
IF (LBAGK391 = 2 OR LBAGK391= 3) LOAGA314 = 8 .
IF (LBAGK391 = 2 OR LBAGK391= 3) LOAGA315 = 8 .
EXECUTE .

VARIABLE LABELS 
LOAGA311 'Ik koop alcohol ZELF (opgeschoond, heel glas of meer)'
LOAGA312 'Ik laat alcohol door anderen kopen (een vriend(in), kennis of vreemde)(opgeschoond, heel glas of meer)' 
LOAGA313 'Ik krijg alcohol van een vriend(in) of kennis (opgeschoond, heel glas of meer)' 
LOAGA314 'Ik krijg alcohol van mijn ouders/verzorgers (opgeschoond, heel glas of meer)' 
LOAGA315 'Ik krijg alcohol van een andere volwassenen (opgeschoond, heel glas of meer)' .
VALUE LABELS
 LOAGA311 LOAGA312 LOAGA313 LOAGA314 LOAGA315 1 'aangekruist' 2 ' niet aangekruist' 8 'Nvt' 9 'Onbekend'.
FORMATS
 LOAGA311 LOAGA312 LOAGA313 LOAGA314 LOAGA315 (F1.0) .
MISSING VALUES
 LOAGA311 LOAGA312 LOAGA313 LOAGA314 LOAGA315 (9) .
EXECUTE . 

* Tijdelijke tussenvariabele verwijderen.
DELETE VARIABLES anee.
EXECUTE.


*** STAP 2: INDICATOREN AANMAKEN ***

*** LOAGK3A11: % dat alcohol zelf koopt (heel glas of meer)
*** LOAGK3A12: % dat alcohol door anderen laat kopen (een vriend(in), kennis of vreemde) (heel glas of meer)
*** LOAGK3A13: %  dat alcohol krijgt van een vriend(in) of kennis (heel glas of meer)    
***LOAGK3A14: %  dat alcohol krijgt van ouders/verzorgers (heel glas of meer)
***LOAGK3A15: % dat alcohol krijgt van andere volwassenen (heel glas of meer)

RECODE LOAGA311  (1=1) (2=0) (else=copy) INTO LOAGK3A11.
RECODE LOAGA312  (1=1) (2=0) (else=copy) INTO LOAGK3A12.
RECODE LOAGA313  (1=1) (2=0) (else=copy) INTO LOAGK3A13.
RECODE LOAGA314  (1=1) (2=0) (else=copy) INTO LOAGK3A14.
RECODE LOAGA315  (1=1) (2=0) (else=copy) INTO LOAGK3A15.

VARIABLE LABELS 
LOAGK3A11 'Ik koop alcohol ZELF (heel glas of meer)'
LOAGK3A12  'Ik laat alcohol door anderen kopen (een vriend(in), kennis of vreemde) (heel glas of meer)' 
LOAGK3A13 'Ik krijg alcohol van een vriend(in) of kennis (heel glas of meer)' 
LOAGK3A14  'Ik krijg alcohol van mijn ouders/verzorgers (heel glas of meer)' 
LOAGK3A15  'Ik krijg alcohol van een andere volwassenen (heel glas of meer)' .
VALUE LABELS
LOAGK3A11 LOAGK3A12 LOAGK3A13 LOAGK3A14 LOAGK3A15 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
LOAGK3A11 LOAGK3A12 LOAGK3A13 LOAGK3A14 LOAGK3A15 (F1.0) .
MISSING VALUES
LOAGK3A11 LOAGK3A12 LOAGK3A13 LOAGK3A14 LOAGK3A15  (8, 9) .
EXECUTE .


*** EINDE VAN DE SYNTAX ***

