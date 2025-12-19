* Encoding: UTF-8.

********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor Jeugd 2025 - Overig druggebruik
*** Versie 18-11-2025
*** Wijzigingen in 2025:
*** - de aangemaakte indicatoren in 2023 hebben ten onrechte een S ipv een A gekregen. Vanaf nu is de  S veranderd in een A.
*** - de vraag naar gebruik van 'andere drugs' is anders gesteld dan in 2023. LOHDK3A1 en LOHDK3A2 worden wel gewoon aangemaakt maar de sytax is anders dan in 2023.
*** - LOHDK3A4 en LOHDK3A5 zijn niet meer aangemaakt omdat lachgas overal bij de overige drugs staat in de vragenijst.

*** Aangemaakt door Marijke von Bergh GGD West-Brabant

********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor Jeugd 2023 - Overig druggebruik
*** Aangepaste versie van 
*** Versie 8-11 2023 .
*** Contactpersoon: Nelleke de Vos, ndevos@ggdru.nl
********************************************************************************************************
*** *** Aangepaste variabele namen voor OKO 2023 . 
* LBSDK305 (2022) is in 2023 LOHDK301 'Heb je ooit andere drugs (zoals XTC, cocaïne, paddo’s, lachgas etc.) gebruikt?'.
* LBHDK3S1 (2022) is in 2023 :LOHDK3S1 % dat ooit XTC, cocaïne, paddo’s, lachgas etc. heeft gebruikt .
* LBHDK3S2: (2022) is in 2023 LOHDK3S2  % dat de laatste 4 weken XTC, cocaïne, paddo’s, lachgas etc. heeft gebruikt .
* LBHDK3S4 (2022) is in 2023 LOHDK3S4: % dat ooit XTC, cocaïne, paddo’s etc heeft gebruikt  (zonder lachgas).
* LBHDK3S5 (2022) is in 2023 LOHDK3S5 : % dat de laatste 4 weken XTC, cocaïne, paddo’s etc heeft gebruikt (zonder lachgas).

*** In 2022 was de vraag naar andere drugs zonder lachgas. In 2023 konden GGD'en kiezen of ze de vraag mét lachgas stelden of zonder (en dan lachgas apart uitvragen).
*** Voor beide opties is in het codeboek dezelfde variabelenaam LOHDK301 gebruikt.
*** Om onderscheid te kunnen maken wordt de variabele zonder lachgas in deze syntax hernoemd in  LOHDK302 'Heb je ooit andere drugs (zoals XTC, cocaïne, paddo’s, etc.) gebruikt?'..
*** In 2023 waren er opgesplitste stappen:
*** Stappen 1A en 2A zijn voor GGD'en mét lachgas in de vraagstelling.
*** Stappen 1B en 2B zijn voor GGD'en zonder lachgas in de vraagstelling (en lachgas in een aparte vraagstelling)..
***********************************************************************************************************

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: 

*** LOHDK3A1: % dat ooit XTC, cocaïne, paddo’s, lachgas etc. heeft gebruikt .
*** LOHDK3A2: % dat de laatste 4 weken XTC, cocaïne, paddo’s, lachgas etc. heeft gebruikt .


*** STAP 1 DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***.

VARIABLE LABELS
    LOHDK302 'Heb je ooit andere drugs (zoals lachgas, XTC, cocaïne, paddo’s etc.) gebruikt?'. 
EXECUTE. 

VALUE LABELS
    LOHDK302 1 'Ja' 2 'Nee' 9 'Onbekend'.
EXECUTE. 
    
MISSING VALUES
    LOHDK302 (9). 
EXECUTE. 

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LOHDK302) LOHDK302 = 9 .
EXECUTE .

VARIABLE LABELS
    LOHDK303 'Heb je in de laatste 4 weken andere drugs (zoals lachgas, XTC, cocaïne, paddo’s etc.) gebruikt?'. 
EXECUTE. 

* Als de voorlopervraag met 'nee' is beantwoord, dan wordt de vervolgvraag ook op 'nee' gezet .
IF (LOHDK302=2) LOHDK303=2. 
EXECUTE .
* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LOHDK303) LOHDK303 = 9 .
EXECUTE .

VALUE LABELS
    LOHDK303 1 'Ja' 2 'Nee' 9 'Onbekend'.
EXECUTE. 
    
MISSING VALUES
    LOHDK303 (9). 
EXECUTE. 

FREQUENCIES LOHDK302 LOHDK303.


*** STAP 2 INDICATOREN AANMAKEN ***

* Aanmaken indicator: LOHDK3A1: % dat ooit lachgas, XTC, cocaïne, paddo’s etc. heeft gebruikt .

RECODE LOHDK302 (1=1)(2=0) (9=9) (else=copy) into LOHDK3A1 .
EXECUTE .

VARIABLE LABELS 
  LOHDK3A1 'Ooit lachgas, XTC, cocaïne, paddos etc. gebruikt' .

VALUE LABELS 
  LOHDK3A1 0 'Nee' 1 'Ja' 9 'onbekend' .

FORMATS
  LOHDK3A1 (F1.0) .

MISSING VALUES
  LOHDK3A1 (9) .
EXECUTE .


* Aanmaken indicator: LOHDK3A2: % dat de laatste 4 weken lachgas, XTC, cocaïne, paddo’s etc. heeft gebruikt ..

RECODE LOHDK303 (1=1)(2=0) (9=9) (else=copy) into LOHDK3A2 .
EXECUTE .

VARIABLE LABELS 
  LOHDK3A2 'Laatste 4 wkn lachgas, XTC, cocaïne, paddos, etc. gebruikt' .

VALUE LABELS 
  LOHDK3A2 0 'Nee' 1 'Ja' 9 'onbekend' .

FORMATS
  LOHDK3A2 (F1.0) .

MISSING VALUES
  LOHDK3A2 (9) .
EXECUTE .


FREQUENCIES  LOHDK3A1 LOHDK3A2.

*** EINDE VAN DE SYNTAX 
