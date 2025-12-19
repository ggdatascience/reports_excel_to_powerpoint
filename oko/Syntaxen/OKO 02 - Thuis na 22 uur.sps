* Encoding: UTF-8.

********************************************************************************************************
*** Syntax OKO 2025 - Thuis na 22.00 uur
*** versie 1.4 / 26 nov 2025.
*** kleine wijziging in vraag, 
     2023 Hoeveel dagen was je in de laatste week 's avonds na 10 uur niet thuis?
     2025 Hoeveel dagen kwam je in de laastste week na 22.00 uur thuis? Als je de laatste week vakantie had, vul deze vraag dan in over de week ervoor.
*** Michelle Wennekers mwennekers@ggdzw.nl
********************************************************************************************************
*** Syntax  Gezondheidsmonitor Jeugd 2023 - Niet thuis na 22.00 uur
*** Versie 1 / 1 november 2023 .
*** Contactpersoon: Lobke Kuijs / l.kuijs@ggdnog.nl
********************************************************************************************************

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:
*** SOROK3A4: Aantal dagen na 22.00 uur thuis (verplicht; voorheen MOVBK3S1 en 2023 SOROK3S1)
*** SOROK3A5: 1 dag of meer na 22.00 uur thuis (verplicht; voorheen MOVBK3S2 en 2023 SOROK3S2)
*** SOROK3A6: 2 dagen of meer na 22.00 uur thuis (verplicht; voorheen MOVBK3S3 en 2023 SOROK3S3)
*** SOROK3A7: 3 dagen of meer na 22.00 uur thuis (verplicht; voorheen MOVBK3S4 en 2023 SOROK3S4)
*** SOROK3A8: altijd voor 22 uur thuis, 1x na 22 uur thuis, 2x na 22 uur thuis, 3x of meer na 22 uur thuis (verplicht; voorheen MOVBK3S5 en 2023 SOROK3S5)
*** SOROK3S6: 3 of meer dagen in de afgelopen week na 22 uur thuis en ouders/verzorgers weten nooit/soms waar je bent (verplicht, voorheen MOOPK3S5).

*** LET OP: DE SYNTAX 'RELATIE OUDERS' RUNNEN VÓÓR HET RUNNEN VAN DEZE SYNTAX.


*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

FREQUENCIES SOROK301.
VARIABLE LABELS 
  SOROK301 ' Hoeveel dagen kwam je in de laatste week na 22.00 uur thuis?'.
EXECUTE.

VALUE LABELS SOROK301
  1 '0 dagen'
  2 '1 dag'
  3 '2 dagen'
  4 '3 dagen'
  5 '4 dagen'
  6 '5 dagen'
  7 '6 dagen'
  8 '7 dagen'
  9 'Onbekend'.
EXECUTE.

FORMATS SOROK301 (F1.0).
EXECUTE.

MISSING VALUES SOROK301 (9).
EXECUTE.

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SOROK301) SOROK301 = 9.
EXECUTE .

FREQUENCIES SOROK301.

*** STAP 2: INDICATOREN AANMAKEN ***

***SOROK3A4: aantal dagen na 22.00 uur thuis (verplicht; voorheen MOVBK3S1  en 2023 SOROK3S1).

RECODE SOROK301 (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) (8=7)(else=copy) into SOROK3A4.
EXECUTE.

VARIABLE LABELS SOROK3A4 'Aantal dagen dat kind in afgelopen week na 22.00 uur thuis kwam'.
EXECUTE.

VALUE LABELS SOROK3A4
0 '0 dagen'
 1 '1 dag'
  2 '2 dagen'
  3 '3 dagen'
  4 '4 dagen'
  5 '5 dagen'
  6 '6 dagen'
  7 '7 dagen'
  9 'Onbekend'.
EXECUTE.

FORMATS SOROK3A4 (F1.0).
EXECUTE.

MISSING VALUES SOROK3A4 (9).
EXECUTE.

FREQUENCIES SOROK3A4.
CROSSTABS SOROK3A4 by SOROK301.

***SOROK3A5: % kinderen dat 1 dag of meer na 22.00 uur thuis kwam  (verplicht; voorheen MOVBK3S2  en 2023 SOROK3S2).
RECODE SOROK301 (1=0)(2, 3, 4, 5, 6, 7, 8=1)(else=copy) into SOROK3A5.
EXECUTE.

VARIABLE LABELS SOROK3A5 'Kind komt 1 dag of meer na 22.00 uur thuis'.
EXECUTE.

VALUE LABELS SOROK3A5
  0 'Nee'
  1 'Ja'
  9 'Onbekend'.
EXECUTE.

FORMATS SOROK3A5 (F1.0).
EXECUTE.

MISSING VALUES SOROK3A5 (9).
EXECUTE.


FREQUENCIES SOROK3A5.
CROSSTABS SOROK3A5 by SOROK301.



***SOROK3A6: % kinderen dat 2 dagen of meer na 22.00 uur thuis komt (verplicht; voorheen MOVBK3S3  en 2023 SOROK3S3).
RECODE SOROK301 (1, 2=0)(3, 4, 5, 6, 7, 8=1)(else=copy) into SOROK3A6.
EXECUTE.

VARIABLE LABELS SOROK3A6 'Kind komt 2 dagen of meer na 22.00 uur thuis'.
EXECUTE.

VALUE LABELS SOROK3A6
  0 'Nee'
  1 'Ja'
  9 'Onbekend'.
EXECUTE.

FORMATS SOROK3A6 (F1.0).
EXECUTE.

MISSING VALUES SOROK3A6 (9).
EXECUTE.


FREQUENCIES SOROK3A6.
CROSSTABS SOROK3A6 by SOROK301.



***SOROK3A7: % kinderen dat 3 dagen of meer na 22.00 uur thuis komt (verplicht; voorheen MOVBK3S4  en 2023 SOROK3S4).
RECODE SOROK301 (1, 2, 3=0)(4, 5, 6, 7, 8=1)(else=copy) into SOROK3A7.
EXECUTE.

VARIABLE LABELS SOROK3A7 'Kind komt 3 dagen of meer na 22.00 uur thuis'.
EXECUTE.

VALUE LABELS SOROK3A7
  0 'Nee'
  1 'Ja'
  9 'Onbekend'.
EXECUTE.

FORMATS SOROK3A7 (F1.0).
EXECUTE.

MISSING VALUES SOROK3A7 (9).
EXECUTE.


FREQUENCIES SOROK3A7.
CROSSTABS SOROK3A7 by SOROK301.


*** SOROK3A8: kinderen na 22 uur thuis (4 cat) (verplicht; voorheen MOVBK3S5  en 2023 SOROK3S5).
RECODE SOROK301 (1=1)(2=2)(3=3)(4, 5, 6, 7, 8=4)(else=copy) into SOROK3A8.
EXECUTE.

VARIABLE LABELS SOROK3A8 'Kind na 22.00 uur thuis (4 cat)'.
EXECUTE.

VALUE LABELS SOROK3A8
  1 'Altijd voor 22.00 uur thuis'
  2 '1 dag per week na 22.00 uur thuis'
  3 '2 dagen per week na 22.00 uur thuis'
  4 '3 of meer dagen per week na 22.00 uur thuis'
  9 'Onbekend'.
EXECUTE.

FORMATS SOROK3A8 (F1.0).
EXECUTE.

MISSING VALUES SOROK3A8 (9).
EXECUTE.


FREQUENCIES SOROK3A8.
CROSSTABS SOROK3A8 by SOROK301.


***SOROK3S6: % kinderen dat 3 of meer dagen in de afgelopen week na 22 uur thuis komt en ouders/verzorgers weten nooit/soms waar je bent (verplicht; voorheen MOVBK3S6).
***SOROK3A3 was voorheen SOROK3S8.
FREQUENCIES SOROK3A3 SOROK3A7.

COMPUTE SOROK3S6=9.
IF ((SOROK3A7=1) & (SOROK3A3=0)) SOROK3S6=1.
IF ((SOROK3A7=1) & (SOROK3A3=1)) SOROK3S6=0.
IF ((SOROK3A7=0) & (SOROK3A3=0)) SOROK3S6=0.
IF ((SOROK3A7=0) & (SOROK3A3=1)) SOROK3S6=0.
EXECUTE.

VARIABLE LABELS SOROK3S6 '3 of meer dagen in de afgelopen week ’s avonds na 22 uur thuis en ouders/verzorgers weten nooit/soms waar je bent'.
EXECUTE.

VALUE LABELS SOROK3S6
  0 'Nee'
  1 'Ja'
  9 'Onbekend'.
EXECUTE.

FORMATS SOROK3S6 (F1.0).
EXECUTE.

MISSING VALUES SOROK3S6 (9).
EXECUTE.

FREQUENCIES SOROK3S6.
CROSSTABS SOROK3A7 by SOROK3A3.

*** EINDE VAN DE SYNTAX ***
