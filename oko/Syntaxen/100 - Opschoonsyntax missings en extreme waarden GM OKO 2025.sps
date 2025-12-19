* Encoding: UTF-8.
********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor Jeugd 2025 - Missings en extreme waarden .
*** Versie 1 / 15-12-2025
***Lilas, aangepast door Gea Schouten.

*Deze syntax is een leidraad voor opschoning, je kan de syntax aanpassen en als je strenger wil opschonen, bv op basis van invulduur, provincie, datum/tijdstip etc.
*De vragenlijsten die helemaal leeg zijn, zijn als door HelderOnderzoek verwijderd.

******************************************************************************************************************************************************************************************.
*Selectie van respondenten met bruikbare vragenlijst.
******************************************************************************************************************************************************************************************

*******************************************************************************************************************************************************************************************.
*** STAP 0 Mastersyntax
*******************************************************************************************************************************************************************************************.

***Open het ruwe databestand en sla op onder een nieuwe naam (bv opgeschoond).
***Pas de syntax geografie en opleidingsniveau aan jouw lokale situatie aan.
***Run daarna de mastersyntax.

*******************************************************************************************************************************************************************************************.
***STAP 1 Verwijderen respondenten met missing op alle basisvragen.
*******************************************************************************************************************************************************************************************.

*Respondenten die op álle onderwerpen in van de basisvragen van een reguliere GM jeugd missings hebben, zullen worden verwijderd. OKO heeft 25 standaarden, waarvan 14 basisvragen zijn.
*Tellen hoeveel van de eerste vraag van de 14 standaarden niet zijn ingevuld.
*Eerst uitdraai van de eerste vraag van de 14 basis standaarden  (ervaren gezondheid, geluk, ervaren mentale gezondheid, eenzaamheid, vrije tijd, stress, pesten, alcohol, roken, vapen, wiet, weerbaarheid, sociale media, gamen)

FREQUENCIES 
 EBEGK311 EBGLK301 PBMGK301 SBEZK301  LBLBK335 SBSSK301 SBRLK302  LBAGK391 LBRAK311 LBGEK303 LBSDK301 PBWBK302 SBSGK309 SBGMK301 .

*Variabele aanmaken: aantal_missings.
COUNT missings_9 = EBEGK311 EBGLK301 PBMGK301 SBEZK301  LBLBK335 SBSSK301 SBRLK302  LBAGK391 LBRAK311 LBGEK303 LBSDK301  PBWBK302 SBSGK309 SBGMK301 (9).

COUNT missings_sys =  EBEGK311 EBGLK301 PBMGK301 SBEZK301  LBLBK335 SBSSK301 SBRLK302  LBAGK391 LBRAK311 LBGEK303 LBSDK301 PBWBK302 SBSGK309 SBGMK301 (SYSMIS).

FREQUENCIES missings_9 missings_sys.

COMPUTE aantal_missings = missings_9 +  missings_sys.

FREQUENCIES aantal_missings.

VARIABLE LABELS aantal_missings 'Aantal missings op de eerste vraag van de 14 standaarden'.

*******************************************************************************************************************************************************************************************.
*Respondenten verwijderen die op alle eerste vragen van de 14 standaarden een missing hebben.
*NB als je zelf strenger wil zijn dan kan dat ook pas dan het aantal missings aan.

FREQUENCIES aantal_missings.

FILTER OFF.
USE ALL.
SELECT IF (aantal_missings ~= 14).
EXECUTE.

FREQUENCIES aantal_missings.

*Hulpvariabelen verwijderen.

DELETE VARIABLES 
    missings_9 missings_sys.
EXECUTE.

*******************************************************************************************************************************************************************************************.
***STAP 2 Respondenten verwijderen die op alle 5 achtergrondsvariabelen missings hebben. (geslacht, leeftijd, plaats, opleiding, klas)
*******************************************************************************************************************************************************************************************.

**Opleiding**.
COUNT missing_onderwijs = MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 MBOKK337 MBOKK338 MBOKK339  (9, SYSMIS).
EXECUTE.

FREQUENCIES missing_onderwijs.

*count kan maximaal 8 zijn.
IF missing_onderwijs=8 missing_onderwijs_9=9.
EXECUTE.
FREQUENCIES missing_onderwijs_9.

*****Woonplaats***.
COUNT missing_plaatswp = MBGIK402 ("0").
EXECUTE.
FREQUENCIES missing_plaatswp.

RECODE missing_plaatswp (1=9).
EXECUTE.

FREQUENCIES missing_plaatswp.

***Aantal missing achtergrondkenmerken.

FREQUENCIES MBOKK331 missing_onderwijs_9 missing_plaatswp BBLFK321 BBGSK402 .

COUNT aantal_mis_5_achtergrond =  MBOKK331 missing_onderwijs_9 missing_plaatswp BBLFK321 BBGSK402  (9, 99).  
EXECUTE.

FREQUENCIES aantal_mis_5_achtergrond.

SELECT IF (aantal_mis_5_achtergrond ~= 5) .
EXECUTE.

FREQUENCIES aantal_mis_5_achtergrond .

*Hulp variabelen verwijderen.
DELETE VARIABLES 
missing_onderwijs
missing_onderwijs_9
missing_plaatswp
aantal_mis_5_achtergrond.
EXECUTE.

*******************************************************************************************************************************************************************************************.
*STAP 3: Respondenten verwijderen die op 4 of meer onderwerpen extreme waarden hebben.
*******************************************************************************************************************************************************************************************.
*** Respondenten worden alleen verwijderd uit het databestand als er bij 4 onderwerpen sprake is van extreme antwoorden.
*** Het afkappunt van 4 onderwerpen is gesteld, omdat het natuurlijk zo kan zijn dat een leerling bij enkele onderwerpen naar waarheid een extreem antwoord invult. 
***Voor de volgende onderwerpen worden extreme waarden gedefinieerd: psychische gezondheid (WHO-5), stress, middelengebruik, weerbaarheid, social media en gamen. 

************************************************************.
*** Psychische klachten-WHO-5-12-19-jarigen ***
* Alle antwoorden de hele tijd aangeklikt, code 1of  Alle antwoorden nooit aangeklikt, code 6.
* de hele tijd.

FREQUENCIES PBMGK302 PBMGK303 PBMGK304 PBMGK305 PBMGK306.

COUNT extrWHO5he= PBMGK302 PBMGK303 PBMGK304 PBMGK305 PBMGK306 (1).
EXECUTE.

FREQUENCIES extrWHO5he.

RECODE extrWHO5he (5=1) (ELSE=0).
EXECUTE.

FREQUENCIES extrWHO5he.

* Alles nooit.
COUNT extrWHO5no= PBMGK302 PBMGK303 PBMGK304 PBMGK305 PBMGK306 (6).
EXECUTE.

FREQUENCIES extrWHO5no.

RECODE extrWHO5no (5=1) (ELSE=0).
EXECUTE.

FREQUENCIES extrWHO5no.


**************
*** Stress ***
* Alles met Zeer vaak beanwoord, code 5*.

FREQUENCIES SBSSK301 SBSSK302 SBSSK303 SBSSK304 SBSSK305.
COUNT extrstresszv = SBSSK301 SBSSK302 SBSSK303 SBSSK304 SBSSK305 (5).
EXECUTE.

FREQUENCIES extrstresszv.
RECODE extrstresszv (5=1) (ELSE=0). 

FREQUENCIES extrstresszv.

************************************************************
*** Middelengebruik ***
* Op alle vragen van alcohol, roken, hasj/wiet het meest extremen antwoord*.

COMPUTE extrmiddelen=0.
IF (LBAGK399=5 and LBAGK307=7 and LBAGK394=6 and LBAGK395=6 and LBRAK312=1 and LBSDK309=5) extrmiddelen=1.

FREQUENCIES extrmiddelen.

************************************************************
*** Weerbaarheid ***
* Alles met ‘Helemaal eens’ beantwoord, code 1*.
COUNT extrwbhe= PBWBK301 PBWBK302  PBWBK304  PBWBK306 PBWBK307 (1).
RECODE extrwbhe (5=1) (else=0).

*Alles met ’Helemaal oneens’ beantwoord, code 5*.
COUNT extrwbho= PBWBK301 PBWBK302  PBWBK304  PBWBK306 PBWBK307 (5).
RECODE extrwbho (5=1) (else=0).

FREQUENCIES extrwbhe extrwbho .

************************************************************
*** Social media***
* Op alle vragen (Bijna)nooit, code 1*.
FREQUENCIES SBSGK310 SBSGK311 SBSGK312 SBSGK313 SBSGK314.

count extrsmn1= SBSGK310 SBSGK311 SBSGK312 SBSGK313 SBSGK314 (1).
RECODE extrsmn1 (5=1)(ELSE=0).

* Op alle vragen vaak, code 3*.
count extrsmn3= SBSGK310 SBSGK311 SBSGK312 SBSGK313 SBSGK314 (3).
RECODE extrsmn3 (5=1)(ELSE=0).

FREQUENCIES extrsmn3 extrsmn1.

************************************************************
*** Gamen***
* Op alle vragen Zeer vaak, code 5*.
COUNT extrgame=SBGMK302 SBGMK303 SBGMK304 SBGMK305 SBGMK306 SBGMK307 SBGMK308 (5).
EXECUTE.

RECODE extrgame (7=1) (ELSE=0).
EXECUTE.

FREQUENCIES extrgame.

************************************************************
*** Totaal extremen ***

COUNT aantalextr = extrWHO5he extrWHO5no extrstresszv extrmiddelen extrwbhe extrwbho extrsmn3 extrsmn1 extrgame (1).
EXECUTE. 

FREQUENCIES aantalextr.

*Respondenten verwijderen die op 4 onderwerpen extreme waarden hebben (komt bij ons niet voor).
USE ALL.
SELECT IF (aantalextr < 4).
EXECUTE.

*Hulp variabelen verwijderen.
DELETE VARIABLES extrWHO5he extrWHO5no extrstresszv extrmiddelen extrwbhe extrwbho extrsmn3 extrsmn1 extrgame aantalextr.
execute.

*** EINDE VAN DE SYNTAX ***