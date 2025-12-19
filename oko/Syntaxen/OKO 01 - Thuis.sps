* Encoding: UTF-8.

********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor 2025 - Relatie met ouders (in 2025 minder vragen opgenomen over dit onderwerp, naamgeving uitkomstmaten aangepast, naamgeving vragen behouden zoals in 2023)
*** Versie 2.1 / 26 november 2025 .
*** Variabelen namen aangepast volgens standaard naamgeving. Nummering afgeleide opeenvolgend.
*** Contactpersoon: Gea Schouten

*SOROK3S9 wordt SOROK3A1
* SOROK3S11 wordt SOROK3A2
* SOROK3S8 wordt SOROK3A3

********************************************************************************************************

********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor 2025 - Relatie met ouders (in 2025 minder vragen opgenomen over dit onderwerp, verder behouden zoals in 2023)
*** Versie 1.1 / 1 juli 2025 .
*** Contactpersoon: Gea Schouten
********************************************************************************************************

********************************************************************************************************
*** Syntax Gezondheidsmonitor Jeugd 2023 - Relatie met ouders
*** Versie 1 / 30 november 2023 .
*** Contactpersoon: Lobke Kuijs / l.kuijs@ggdghor.nl
********************************************************************************************************

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:

*** SOROK3A1 % dat het (helemaal) eens is met de stelling 'Mijn ouders/verzorgers hebben duidelijke regels over wat ik wel en niet mag doen' (basis OKO; voorheen MOOPK3S1 en daarna SOROK3S9).
*** SOROK3A2 % dat het (helemaal) eens is met de stelling 'Mijn ouders/verzorgers brengen veel tijd met mij door' (basis OKO; voorheen MOOPK3S4 en daarna SOROK3S11).
*** SOROK3A3 % dat aangeeft dat ouders/verzorgers meestal/altijd weten waar hij/zij is als hij/zij niet thuis is (basis OKO; voorheen MOWBK3S4 en daarna SOROK3S8).

*SOROK3
S=Sociale omgeving 
O=OKO
RO=Relatie ouders
K=Kind
3=Jeugd.


*** STAP 1: OPSCHONEN VARIABELEN ***
    
VARIABLE LABELS 
SOROK304 'Mijn ouders/verzorgers hebben duidelijke regels over wat ik wel en niet mag doen'
SOROK306 'Mijn ouders/verzorgers brengen veel tijd met mij door'.
EXECUTE .

VALUE LABELS SOROK304 SOROK306
    1 'Helemaal oneens' 2 'Oneens' 3 'Niet eens/niet oneens' 4 ' Eens' 5 ' Helemaal eens' 9 'Onbekend' .
EXECUTE .

FORMATS SOROK304 SOROK306 (F1.0) .
*FORMATS SOROK305  (F1.0) .
EXECUTE .

MISSING VALUES SOROK304 SOROK306 (9) .
*MISSING VALUES SOROK305 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SOROK304)    SOROK304 = 9 .
*IF missing (SOROK305)    SOROK305 = 9 .
IF missing (SOROK306)    SOROK306 = 9 .
EXECUTE .

*FREQUENCIES SOROK304 SOROK306.

VARIABLE LABELS 
SOROK303 'Als je niet thuis bent, weten je ouders/verzorgers dan waar je bent?'.
EXECUTE .

VALUE LABELS
  SOROK303 1 'Nee, nooit' 2 'Ja, soms' 3 'Ja, meestal' 4 'Ja, altijd' 9 'Onbekend' .
EXECUTE .

FORMATS SOROK303 (F1.0) .
MISSING VALUES SOROK303 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SOROK303) SOROK303 = 9 .
EXECUTE .

FREQUENCIES SOROK303.

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: SOROK3A1
* % dat het (helemaal) eens is met de stelling 'Mijn ouders/verzorgers hebben duidelijke regels over wat ik wel en niet mag doen' (basis; voorheen MOOPK3S1).
* % dat het (helemaal) eens is met de stelling 'Mijn ouders/verzorgers hebben duidelijke regels over wat ik wel en niet mag doen' (basis; voorheen SOROK3S9).

RECODE SOROK304 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SOROK3A1 .
EXECUTE .

VARIABLE LABELS 
  SOROK3A1 'Ouders/verzorgers hebben duidelijke regels over wat het kind wel en niet mag doen' .
EXECUTE .
  
VALUE LABELS
  SOROK3A1 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SOROK3A1 (F1.0) .
EXECUTE .

MISSING VALUES
 SOROK3A1 (9) .
EXECUTE .

FREQUENCIES SOROK304 SOROK3A1.

* Aanmaken indicator: SOROK3A2
*    % dat het (helemaal) eens is met de stelling 'Mijn ouders/verzorgers brengen veel tijd met mij door' (verplicht; voorheen MOOPK3S4).
*    % dat het (helemaal) eens is met de stelling 'Mijn ouders/verzorgers brengen veel tijd met mij door' (verplicht; voorheen SOROK3S11).

RECODE SOROK306 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SOROK3A2 .
EXECUTE .

VARIABLE LABELS 
  SOROK3A2 'Ouders/verzorgers brengen veel tijd met het kind door'.
EXECUTE .
  
VALUE LABELS
  SOROK3A2 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
   SOROK3A2 (F1.0) .
EXECUTE .

MISSING VALUES
  SOROK3A2 (9) .
EXECUTE .

FREQUENCIES SOROK306 SOROK3A2.

* Aanmaken indicator: SOROK3A3
* % dat aangeeft dat ouders/verzorgers meestal/altijd weten waar hij/zij is als hij/zij niet thuis is (basis; voorheen MOWBK3S4).
* % dat aangeeft dat ouders/verzorgers meestal/altijd weten waar hij/zij is als hij/zij niet thuis is (basis; voorheen SOROK3S8).


RECODE SOROK303 (1=0)(2=0)(3=1)(4=1)(else=copy) into SOROK3A3.
EXECUTE .

VARIABLE LABELS 
  SOROK3A3 'Ouders/verzorgers weten meestal/altijd waar kind is als hij/zij niet thuis is' .
EXECUTE .
  
VALUE LABELS
  SOROK3A3 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SOROK3A3 (F1.0) .
EXECUTE .

MISSING VALUES
  SOROK3A3 (9) .
EXECUTE .

FREQUENCIES SOROK303 SOROK3A3.

*** EINDE VAN DE SYNTAX ***
