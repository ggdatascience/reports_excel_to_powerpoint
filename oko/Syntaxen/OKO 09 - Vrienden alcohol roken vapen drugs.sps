* Encoding: UTF-8.

********************************************************************************************************
*** Syntax OKO Vrienden alcohol roken drugs 2025
*** Versie 1 / 10 november 2022 Stephanie Brinkhues
*** Versie 2 / 27 november 2023 Gea Schouten (naamgeving andere en 3 vragen ipv 5 vragen)
***Voor OKO 2025 is vapen erbij gekomen 
*** LOMVK304 'Hoeveel van jou vriend(innen) vapen?'.
*** LOMVK3A7: % Sommige tot (bijna) alle vriend(innen) vapen
***LOMVK3A8: % Meeste tot (bijna) alle vriend(innen) vapen

***Ook is voor OKO 2025 is de naamgeving van de indicatorvariabelen uit 2023 aangepast (A ipv S), omdat de indicatoren zijn afgeleid en niet zijn samengesteld.NdJ GGD GM.

   ***LOMVK3S1: % Sommige tot (bijna) alle vriend(innen) drinken alcohol wordt LOMVK3A1
   ***LOMVK3S2: % Sommige tot (bijna) alle vriend(innen) roken wordt LOMVK3A2
   ***LOMVK3S3: % Sommige tot (bijna) alle vriend(innen) roken hasj of wiet  wordt LOMVK3A3
   ***LOMVK3S4: % Meeste tot (bijna) alle vriend(innen) drinken alcohol wordt LOMVK3A4
   ***LOMVK3S5: % Meeste tot (bijna) alle vriend(innen) roken wordt LOMVK3A5
   ***LOMVK3S6: % Meeste tot (bijna) alle vriend(innen) roken hasj of wiet  wordt LOMVK3A6
********************************************************************************************************


*** Oude naamgeving vragen:
    LBMVK301 'Hoeveel van jou vriend(innen) roken sigaretten?'
    LBMVK302 'Hoeveel van jou vriend(innen) drinken alcohol?'
    LBMVK303 'Hoeveel van jou vriend(innen) roken hasj of wiet?'
*** Oude naamgeving aangemaakte indicatoren:    
*   LBMVK3S1: % Sommige tot (bijna) alle vriend(innen) roken
    LBMVK3S2: % Sommige tot (bijna) alle vriend(innen) drinken alcohol
    LBMVK3S4: % Sommige tot (bijna) alle vriend(innen) roken hasj of wiet  
*  LBMVK3S7: % Meeste tot (bijna) alle vriend(innen) roken
    LBMVK3S8: % Meeste tot (bijna) alle vriend(innen) drinken alcohol
    LBMVK3S10: % Meeste tot (bijna) alle vriend(innen) roken hasj of wiet  

*** Contactpersoon: Frouwke Veenstra
********************************************************************************************************
 ***Gezondheidsmonitor Jeugd 2023 en OKO Gezondheidsmonitor 2025
********************************************************************************************************

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:

   ***LOMVK3A1: % Sommige tot (bijna) alle vriend(innen) drinken alcohol
   ***LOMVK3AS2: % Sommige tot (bijna) alle vriend(innen) roken
   ***LOMVK3A3: % Sommige tot (bijna) alle vriend(innen) roken hasj of wiet 
   ***LOMVK3A4: % Meeste tot (bijna) alle vriend(innen) drinken alcohol
   ***LOMVK3A5: % Meeste tot (bijna) alle vriend(innen) roken
   ***LOMVK3A6: % Meeste tot (bijna) alle vriend(innen) roken hasj of wiet  
Nieuw in 2025: 
   ***LOMVK3A7: % Sommige tot (bijna) alle vriend(innen) vapen
   ***LOMVK3A8: % Meeste tot (bijna) alle vriend(innen) vapen

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

*ALCOHOL.

VARIABLE LABELS
    LOMVK301 'Hoeveel van jou vriend(innen) drinken alcohol?'.
VALUE LABELS  LOMVK301  1 'Geen' 2 'Sommige' 3 'Meeste' 4 '(Bijna) alle' 9 'Onbekend'.
FORMATS   LOMVK301  (F1.0).
MISSING VALUES   LOMVK301 (9).
EXECUTE.

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing( LOMVK301)  LOMVK301=9.
EXECUTE.

*ROKEN.

VARIABLE LABELS
    LOMVK302 'Hoeveel van jou vriend(innen) roken sigaretten?'.
VALUE LABELS   LOMVK302  1 'Geen' 2 'Sommige' 3 'Meeste' 4 '(Bijna) alle' 9 'Onbekend'.
FORMATS   LOMVK302 (F1.0).
MISSING VALUES  LOMVK302  (9).
EXECUTE.

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing( LOMVK302)  LOMVK302=9.
EXECUTE.

*WIET.

VARIABLE LABELS
    LOMVK303 'Hoeveel van jou vriend(innen) roken hasj of wiet?'.
VALUE LABELS  LOMVK303  1 'Geen' 2 'Sommige' 3 'Meeste' 4 '(Bijna) alle' 9 'Onbekend'.
FORMATS   LOMVK303 (F1.0).
MISSING VALUES    LOMVK303 (9).
EXECUTE.

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing( LOMVK303)  LOMVK303=9.
EXECUTE.

*VAPEN.

VARIABLE LABELS
    LOMVK304 'Hoeveel van jou vriend(innen) vapen?'.
VALUE LABELS   LOMVK304  1 'Geen' 2 'Sommige' 3 'Meeste' 4 '(Bijna) alle' 9 'Onbekend'.
FORMATS   LOMVK304 (F1.0).
MISSING VALUES  LOMVK304  (9).
EXECUTE.

*** STAP 2: INDICATOREN AANMAKEN ***
   ***LOMVK3A1: % Sommige tot (bijna) alle vriend(innen) drinken alcohol  
   
RECODE LOMVK301 (1=0) (2,3,4=1) (9=9) (else=copy)  INTO LOMVK3A1.
VARIABLE LABELS
   LOMVK3A1 'Sommige tot (bijna) alle vriend(innen) drinken alcohol'.
VALUE LABELS  LOMVK3A1  0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS  LOMVK3A1  (F1.0).
MISSING VALUES  LOMVK3A1 (9).
EXECUTE.

   ***LOMVK3A2: % Sommige tot (bijna) alle vriend(innen) roken
  
RECODE LOMVK302 (1=0) (2,3,4=1) (9=9) (else=copy)  INTO LOMVK3A2.
EXECUTE.

VARIABLE LABELS
   LOMVK3A2 'Sommige tot (bijna) alle vriend(innen) roken'.
VALUE LABELS  LOMVK3A2 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS  LOMVK3A2 (F1.0).
MISSING VALUES   LOMVK3A2 (9).
EXECUTE.

   ***LOMVK3A7: % Sommige tot (bijna) alle vriend(innen) vapen
  
RECODE LOMVK304 (1=0) (2,3,4=1) (9=9) (else=copy)  INTO LOMVK3A7.
EXECUTE.

VARIABLE LABELS
   LOMVK3A7 'Sommige tot (bijna) alle vriend(innen) vapen'.
VALUE LABELS  LOMVK3A7 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS  LOMVK3A7 (F1.0).
MISSING VALUES   LOMVK3A7 (9).
EXECUTE.

   ***LOMVK3A3: % Sommige tot (bijna) alle vriend(innen) roken hasj of wiet  

RECODE LOMVK303 (1=0) (2,3,4=1) (9=9) (else=copy)  INTO LOMVK3A3.
EXECUTE.

VARIABLE LABELS
   LOMVK3A3 'Sommige tot (bijna) alle vriend(innen) roken hasj of wiet'.
VALUE LABELS  LOMVK3A3 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS   LOMVK3A3 (F1.0).
MISSING VALUES   LOMVK3A3 (9).
EXECUTE.

   ***LOMVK3A4: % Meeste tot (bijna) alle vriend(innen) drinken alcohol

RECODE LOMVK301 (1,2=0) (3,4=1) (9=9) (else=copy)  INTO LOMVK3A4.
EXECUTE.

VARIABLE LABELS
   LOMVK3A4 'Meeste tot (bijna) alle vriend(innen) drinken alcohol'.
VALUE LABELS LOMVK3A4  0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS  LOMVK3A4  (F1.0).
MISSING VALUES  LOMVK3A4  (9).
EXECUTE.

   ***LOMVK3A5: % Meeste tot (bijna) alle vriend(innen) roken

RECODE LOMVK302 (1,2=0) (3,4=1) (9=9) (else=copy)  INTO LOMVK3A5.
EXECUTE.

VARIABLE LABELS
   LOMVK3A5 'Meeste tot (bijna) alle vriend(innen) roken'.
VALUE LABELS LOMVK3A5 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS LOMVK3A5 (F1.0).
MISSING VALUES  LOMVK3A5  (9).
EXECUTE.

   ***LOMVK3A8: % Meeste tot (bijna) alle vriend(innen) vapen

RECODE LOMVK304 (1,2=0) (3,4=1) (9=9) (else=copy)  INTO LOMVK3A8.
EXECUTE.

VARIABLE LABELS
   LOMVK3A8 'Meeste tot (bijna) alle vriend(innen) vapen'.
VALUE LABELS LOMVK3A8 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS LOMVK3A8 (F1.0).
MISSING VALUES  LOMVK3A8  (9).
EXECUTE.

   ***LOMVK3A6: % Meeste tot (bijna) alle vriend(innen) roken hasj of wiet  

RECODE LOMVK303 (1,2=0) (3,4=1) (9=9) (else=copy)  INTO LOMVK3A6.
EXECUTE.

VARIABLE LABELS
   LOMVK3A6 'Meeste tot (bijna) alle vriend(innen) roken hasj of wiet'.
VALUE LABELS  LOMVK3A6 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS   LOMVK3A6 (F1.0).
MISSING VALUES  LOMVK3A6  (9).
EXECUTE.



 * FREQUENCIES LOMVK301 LOMVK3A1 LOMVK3A4 LOMVK302 LOMVK3A2 LOMVK3A5 LOMVK303 LOMVK3A3 LOMVK3A6 LOMVK304 LOMVK3A7  LOMVK3A8.

*Einde syntax.


