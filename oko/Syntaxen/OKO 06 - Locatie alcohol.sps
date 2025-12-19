* Encoding: UTF-8.

********************************************************************************************************
*** Syntax OKO Waar drink je alcohol 2023
*** Versie 1 / 22 november 2022 Stephanie Brinkhues, 20/12/2022 Gea schouten 8 nvt op missing gezet bij eindmaten.
*** Versie 2 / 27 november 2023 Gea Schouten, naamgeving aangepast
*** Versie 3/ 10 juli 2025 is aangepast voor OKO 2025, NdJ GGD.
*** Schoning toegevoegd voor als geen enkele optie voor waar men meestal drinkt is aangekruist.

*** Variabelenamen van indicatorvariabelen zijn veranderd, omdat ze zijn afgeleid en niet zijn samengesteld.
***De S is verandert in een A.
 **LOAGK3S1 'Drinkt thuis alcohol (heel glas of meer)' wordt LOAGK3A1 
**LOAGK3S2 'Drinkt alcohol bij vrienden/vriendinnen (heel glas of meer)' wordt LOAGK3A2 
**LOAGK3S3 'Drinkt alcohol in een café, disco/club, snackbar, restaurant, op een terras (heel glas of meer)'wordt LOAGK3A3 
**LOAGK3S4 'Drinkt alcohol bij een concert of festival (heel glas of meer)'wordt LOAGK3A4 
**LOAGK3S5 'Drinkt alcohol op de kermis, zomerfeest of tentfeest (heel glas of meer)'wordt LOAGK3A5 
**LOAGK3S6 'Drinkt alcohol op een schoolfeest/schoolreis/excursie met school (heel glas of meer)'wordt LOAGK3A6 
**LOAGK3S7 'Drinkt alcohol in de sportkantine of bij een vereniging (heel glas of meer)' wordt LOAGK3A7 
**LOAGK3S8 'Drinkt alcohol op straat, in een park of een andere plek buiten (niet op een terras) (heel glas of meer)'wordt LOAGK3A8 
**LOAGK3S9 'Drinkt alcohol in een keet, jeugdhonk of schuur (heel glas of meer)' wordt LOAGK3A9 
**LOAGK3S10 'Drinkt ergens anders alcohol (heel glas of meer)' wordt LOAGK3A10 .

*** Oude naamgeving vragen:
LBAGK308'Drinkt thuis alcohol'
LBAGK309'Drinkt alcohol bij vrienden'
LBAGK310'Drinkt alcohol in cafe/restaurant/disco'
LBAGK311'Drinkt alcohol bij concert of festival'
LBAGK312'Drinkt alcohol op de kermis'
LBAGK313'Drinkt alcohol op school/schoolreis/excursie met school'
LBAGK314'Drinkt alcohol in de sportkantine of bij een vereniging'
LBAGK315'Drinkt alcohol op straat, in een park of andere plek buiten'
LBAGK316'Drinkt alcohol in keet, hok of schuur'
LBAGK317'Drinkt ergens anders alcohol'.
*** Oude naamgeving aangemaakte indicatoren:
**LLALK301: % dat thuis alcohol drinkt . 
**LLALK302: % dat alcohol drinkt bij vrienden. 
**LLALK303: % dat alcohol drinkt in cafe/restaurant/disco.
**LLALK304: % dat alcohol drinkt bij concert of festival. 
**LLALK305: % dat alcohol drinkt op de kermis.
**LLALK306: % dat alcohol drinkt op school/schoolreis/excursie met school.
**LLALK307: % dat alcohol drinkt in de sportkantine of bij een vereniging.
**LLALK308: % dat alcohol drinkt op straat, in een park of andere plek buiten.
**LLALK309: % dat alcohol drinkt in keet, hok of schuur. 
**LLALK310: % dat ergens anders alcohol drinkt.

*** Syntax Alcohol verkrijgbaarheid en locatie GM Jeugd 2019 op basis van Emovo 2016/2017 GGD HN
*** Contactpersoon: Frouwke Veenstra
********************************************************************************************************
 ***Gezondheidsmonitor Jeugd 2023
********************************************************************************************************
***deze syntax runnen na Alcoholgebruik-1219-vragenlijst-kind-basis
*** LET OP: in deze syntax worden alleen de indicatoren gemaakt voor de jongeren die ooit
*** een heel glas hebben gedronken. GGD' en die ook de slokjesdrinkers de alcoholvervolgvragen
*** hebben laten invullen, zullen voor slokjesdrinkers zelf de indicatoren moeten maken.

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:

**LOAGK3A1 'Drinkt thuis alcohol (heel glas of meer)' 
**LOAGK3A2 'Drinkt alcohol bij vrienden/vriendinnen (heel glas of meer)' 
**LOAGK3A3 'Drinkt alcohol in een café, disco/club, snackbar, restaurant, op een terras (heel glas of meer)'
**LOAGK3A4 'Drinkt alcohol bij een concert of festival (heel glas of meer)'
**LOAGK3A5 'Drinkt alcohol op de kermis, zomerfeest of tentfeest (heel glas of meer)'
**LOAGK3A6 'Drinkt alcohol op een schoolfeest/schoolreis/excursie met school (heel glas of meer)'
**LOAGK3A7 'Drinkt alcohol in de sportkantine of bij een vereniging (heel glas of meer)' 
**LOAGK3A8 'Drinkt alcohol op straat, in een park of een andere plek buiten (niet op een terras) (heel glas of meer)'
**LOAGK3A9 'Drinkt alcohol in een keet, jeugdhonk of schuur (heel glas of meer)' 
**LOAGK3A10 'Drinkt ergens anders alcohol (heel glas of meer)'. 
    
*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***
     
VARIABLE LABELS 
LOAGK301 'Drinkt thuis alcohol' 
LOAGK302 'Drinkt alcohol bij vrienden/vriendinnen' 
LOAGK303 'Drinkt alcohol in een café, disco/club, snackbar, restaurant, op een terras'
LOAGK304 'Drinkt alcohol bij een concert of festival'
LOAGK305 'Drinkt alcohol op de kermis, zomerfeest of tentfeest'
LOAGK306 'Drinkt alcohol op een schoolfeest/schoolreis/excursie met school'
LOAGK307 'Drinkt alcohol in de sportkantine of bij een vereniging' 
LOAGK308 'Drinkt alcohol op straat, in een park of een andere plek buiten (niet op een terras)'
LOAGK309 'Drinkt alcohol in een keet, jeugdhonk of schuur' 
LOAGK310 'Drinkt ergens anders alcohol'. 
VALUE LABELS
LOAGK301 LOAGK302 LOAGK303 LOAGK304 LOAGK305 LOAGK306 LOAGK307 LOAGK308 LOAGK309 LOAGK310 1 'aangekruist' 2 ' niet aangekruist' 8 'Nvt' 9 'Onbekend'.
FORMATS
LOAGK301 LOAGK302 LOAGK303 LOAGK304 LOAGK305 LOAGK306 LOAGK307 LOAGK308 LOAGK309 LOAGK310 (F1.0) .
MISSING VALUES
LOAGK301 LOAGK302 LOAGK303 LOAGK304 LOAGK305 LOAGK306 LOAGK307 LOAGK308 LOAGK309 LOAGK310 (9) .
EXECUTE .

* * Als bij de vraag 'Als je alcohol drinkt, waar is dit dan meestal?' bij geen enkele optie (LOAGK 301 t/m LOAGK310) iets is ingevuld, dan krijgen de variabelen de waarde 9 .
* Hiertoe eerst het aantal keren 'niet aangekruist' (waarde 2) optellen bij álle opties. 

IF missing (LOAGK301) LOAGK301 = 2.
IF missing (LOAGK302) LOAGK302 = 2.
IF missing (LOAGK303) LOAGK303 = 2.
IF missing (LOAGK304) LOAGK304 = 2.
IF missing (LOAGK305) LOAGK305 = 2.
IF missing (LOAGK306) LOAGK306 = 2.
IF missing (LOAGK307) LOAGK307 = 2.
IF missing (LOAGK308) LOAGK308 = 2.
IF missing (LOAGK309) LOAGK309 = 2.
IF missing (LOAGK310) LOAGK310 = 2.
EXECUTE .

COUNT anee = LOAGK301 LOAGK302 LOAGK303 LOAGK304 LOAGK305 LOAGK306 LOAGK307 LOAGK308 LOAGK309 LOAGK310 (2).
EXECUTE.
 
IF (anee=10) LOAGK301 = 9.
IF (anee=10) LOAGK302 = 9.
IF (anee=10) LOAGK303 = 9.
IF (anee=10) LOAGK304 = 9.
IF (anee=10) LOAGK305 = 9.
IF (anee=10) LOAGK306 = 9.
IF (anee=10) LOAGK307 = 9.
IF (anee=10) LOAGK308 = 9.
IF (anee=10) LOAGK309 = 9.
IF (anee=10) LOAGK310 = 9.
EXECUTE .

* Op basis van de voorlopervraag LBAGK391 de vervolgvragen opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvragen aanmaken:.
COMPUTE LOAGKA301 = LOAGK301.
COMPUTE LOAGKA302 = LOAGK302.
COMPUTE LOAGKA303 = LOAGK303.
COMPUTE LOAGKA304 = LOAGK304.
COMPUTE LOAGKA305 = LOAGK305.
COMPUTE LOAGKA306 = LOAGK306.
COMPUTE LOAGKA307 = LOAGK307.
COMPUTE LOAGKA308 = LOAGK308.
COMPUTE LOAGKA309 = LOAGK309.
COMPUTE LOAGKA310 = LOAGK310.
EXECUTE .

* Als bij de voorlopervraag LBAGK391 niets is ingevuld, dan worden de vervolgvragen op missend (waarde 9) gezet .
IF missing (LBAGK391) LOAGKA301 = 9 .
IF missing (LBAGK391) LOAGKA302 = 9 .
IF missing (LBAGK391) LOAGKA303 = 9 .
IF missing (LBAGK391) LOAGKA304 = 9 .
IF missing (LBAGK391) LOAGKA305 = 9 .
IF missing (LBAGK391) LOAGKA306 = 9 .
IF missing (LBAGK391) LOAGKA307 = 9 .
IF missing (LBAGK391) LOAGKA308 = 9 .
IF missing (LBAGK391) LOAGKA309 = 9 .
IF missing (LBAGK391) LOAGKA310 = 9 .
EXECUTE .

* Alleen kinderen meenemen die ooit heel glas hebben gedronken, indien niet of alleen paar slokjes dan op 'nvt' (waarde 8) gezet .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA301 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA302 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA303 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA304 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA305 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA306 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA307 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA308 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA309 = 8 .
IF (LBAGK391 = 2 OR LBAGK391 = 3 ) LOAGKA310 = 8 .
EXECUTE .

VARIABLE LABELS 
LOAGKA301 'Drinkt thuis alcohol (opgeschoond; heel glas of meer)' 
LOAGKA302 'Drinkt alcohol bij vrienden/vriendinnen (opgeschoond; heel glas of meer)' 
LOAGKA303 'Drinkt alcohol in een café, disco/club, snackbar, restaurant, op een terras (opgeschoond; heel glas of meer)'
LOAGKA304 'Drinkt alcohol bij een concert of festival (opgeschoond; heel glas of meer)'
LOAGKA305 'Drinkt alcohol op de kermis, zomerfeest of tentfeest (opgeschoond; heel glas of meer)'
LOAGKA306 'Drinkt alcohol op een schoolfeest/schoolreis/excursie met school (opgeschoond; heel glas of meer)'
LOAGKA307 'Drinkt alcohol in de sportkantine of bij een vereniging (opgeschoond; heel glas of meer)' 
LOAGKA308 'Drinkt alcohol op straat, in een park of een andere plek buiten (niet op een terras) (opgeschoond; heel glas of meer)'
LOAGKA309 'Drinkt alcohol in een keet, jeugdhonk of schuur (opgeschoond; heel glas of meer)' 
LOAGKA310 'Drinkt ergens anders alcohol (opgeschoond; heel glas of meer)'. 
VALUE LABELS
LOAGKA301 LOAGKA302 LOAGKA303 LOAGKA304 LOAGKA305 LOAGKA306 LOAGKA307 LOAGKA308 LOAGKA309 LOAGKA310 1 'aangekruist' 2 ' niet aangekruist' 8 'Nvt' 9 'Onbekend'.
FORMATS
LOAGKA301 LOAGKA302 LOAGKA303 LOAGKA304 LOAGKA305 LOAGKA306 LOAGKA307 LOAGKA308 LOAGKA309 LOAGKA310 (F1.0) .
MISSING VALUES
LOAGKA301 LOAGKA302 LOAGKA303 LOAGKA304 LOAGKA305 LOAGKA306 LOAGKA307 LOAGKA308 LOAGKA309 LOAGKA310 (9) .
EXECUTE . 


* Tijdelijke tussenvariabele verwijderen.
DELETE VARIABLES anee.
EXECUTE.

*** STAP 2: INDICATOREN AANMAKEN (prevalentie onder de groep jongeren die ooit minstens heel glas of meer alcohol heeft gedronken) (1-0)***
 
RECODE LOAGKA301  (1=1) (2=0)  (else=copy) INTO LOAGK3A1.
RECODE LOAGKA302  (1=1) (2=0)  (else=copy) INTO LOAGK3A2.
RECODE LOAGKA303  (1=1) (2=0)  (else=copy) INTO LOAGK3A3.
RECODE LOAGKA304  (1=1) (2=0)  (else=copy) INTO LOAGK3A4.
RECODE LOAGKA305  (1=1) (2=0)  (else=copy) INTO LOAGK3A5.
RECODE LOAGKA306  (1=1) (2=0)  (else=copy) INTO LOAGK3A6.
RECODE LOAGKA307  (1=1) (2=0)  (else=copy) INTO LOAGK3A7.
RECODE LOAGKA308  (1=1) (2=0)  (else=copy) INTO LOAGK3A8.
RECODE LOAGKA309  (1=1) (2=0)  (else=copy) INTO LOAGK3A9.
RECODE LOAGKA310  (1=1) (2=0)  (else=copy) INTO LOAGK3A10.

VARIABLE LABELS 
LOAGK3A1 'Drinkt thuis alcohol (heel glas of meer)' 
LOAGK3A2 'Drinkt alcohol bij vrienden/vriendinnen (heel glas of meer)' 
LOAGK3A3 'Drinkt alcohol in een café, disco/club, snackbar, restaurant, op een terras (heel glas of meer)'
LOAGK3A4 'Drinkt alcohol bij een concert of festival (heel glas of meer)'
LOAGK3A5 'Drinkt alcohol op de kermis, zomerfeest of tentfeest (heel glas of meer)'
LOAGK3A6 'Drinkt alcohol op een schoolfeest/schoolreis/excursie met school (heel glas of meer)'
LOAGK3A7 'Drinkt alcohol in de sportkantine of bij een vereniging (heel glas of meer)' 
LOAGK3A8 'Drinkt alcohol op straat, in een park of een andere plek buiten (niet op een terras) (heel glas of meer)'
LOAGK3A9 'Drinkt alcohol in een keet, jeugdhonk of schuur (heel glas of meer)' 
LOAGK3A10 'Drinkt ergens anders alcohol (heel glas of meer)'. 
VALUE LABELS
LOAGK3A1 LOAGK3A2 LOAGK3A3 LOAGK3A4 LOAGK3A5 LOAGK3A6 LOAGK3A7 LOAGK3A8 LOAGK3A9 LOAGK3A10 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
LOAGK3A1 LOAGK3A2 LOAGK3A3 LOAGK3A4 LOAGK3A5 LOAGK3A6 LOAGK3A7 LOAGK3A8 LOAGK3A9 LOAGK3A10 (F1.0) .
MISSING VALUES
LOAGK3A1 LOAGK3A2 LOAGK3A3 LOAGK3A4 LOAGK3A5 LOAGK3A6 LOAGK3A7 LOAGK3A8 LOAGK3A9 LOAGK3A10 (8, 9) .
EXECUTE .

*FREQUENCIES LOAGK3A1 LOAGK3A2 LOAGK3A3 LOAGK3A4 LOAGK3A5 LOAGK3A6 LOAGK3A7 LOAGK3A8 LOAGK3A9 LOAGK3A10.

*EINDE SYNTAX.