* Encoding: UTF-8.

********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor 2025 - Situatie op school
*** Versie 4.1 / 8 december 2025, aangepast voor OKO 2025 naamgeving aangepast van samengestelde variabele naar afgeleide (verder behouden zoals in 2023).
*** Contactpersoon: Gea Schouten
 
**Aangepast voor OKO 2025 . Met name de variabele namen zijn veranderd.
** SOOSK3S1 wordt SOOSK3A1.
** SOOSK3S3 wordt SOOSK3A2.
**SOOSK3S4 wordt SOOSK3A3.
**SOOSK3S6 wordt SOOSK3A4.
 *******************************************************************************************************

********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor 2025 - Situatie op school
*** Versie 3.1 / 1 juli 2025, aangepast voor OKO 2025, minder vragen opgenomen (verder behouden zoals in 2023).
*** Contactpersoon: Gea Schouten
 *******************************************************************************************************

********************************************************************************************************
*** Syntax OKO Gezondheidsmonitor eugd 2023 - Situatie op school
*** Versie 3 / 24 november 2023.
*** Contactpersoon: Nicole.de.Jong@vggm.nl 
********************************************************************************************************
**Aangepast voor OKO 2023 . Met name de variabele namen zijn veranderd.
**SFOSK3S6 is in 2023 SOOSK3S1.
**SFOSK3S7 is in 2023 SOOSK3S2.
**SFOSK3S8 is in 2023 SOOSK3S3.
**SFOSK3S9 is in 2023 SOOSK3S4.
**SFOSK3S10 is in 2023 SOOSK3S5.
**SFOSK3S11 is in 2023 SOOSK3S6.
 
*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** SOOSK3A1 % dat het (helemaal) eens is met de stelling: Ik voel me veilig op school. (Facultatieve OKO vraag)
*** SOOSK3A2 % dat het (helemaal) eens is met de stelling:  Leerlingen op mijn school gaan goed met elkaar om. (Facultatieve OKO vraag)
*** SOOSK3A3 % dat het (helemaal) eens is met de stelling:  Docenten op mijn school gaan goed met de leerlingen om. (Facultatieve OKO vraag)
*** SOOSK3A4 % dat het (helemaal) eens is met de stelling:  Ik vind naar school gaan zinloos. (Basis OKO vraag)

*** STAP 1: OPSCHONEN VARIABELEN ***

*FREQUENCIES   SOOSK301 SOOSK303 SOOSK304 SOOSK306.

VARIABLE LABELS 
SOOSK301 'Ik voel me veilig op school'
SOOSK303 'De leerlingen op mijn school gaan goed met elkaar om'
SOOSK304 'De docenten op mijn school gaan goed met de leerlingen om'
SOOSK306 'Ik vind naar school gaan zinloos'.

VALUE LABELS  SOOSK301 SOOSK303 SOOSK304 SOOSK306 
 1 'Helemaal oneens' 2 'Oneens' 3 'Niet eens/niet oneens' 4 'Eens' 5 'Helemaal eens' 9 'Onbekend'. 

FORMATS
 SOOSK301 SOOSK303 SOOSK304 SOOSK306 (F1.0) .
EXECUTE.

MISSING VALUES
 SOOSK301 SOOSK303 SOOSK304 SOOSK306 (9) .
EXECUTE.

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SOOSK301) SOOSK301 = 9 .
IF missing (SOOSK303) SOOSK303 = 9 .
IF missing (SOOSK304) SOOSK304 = 9 .
IF missing (SOOSK306) SOOSK306 = 9 .
EXECUTE .

*FREQUENCIES SOOSK301 SOOSK303 SOOSK304 SOOSK306.

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: *** SOOSK3A1 % dat het (helemaal) eens is met de stelling: Ik voel me veilig op school. (Facultatieve OKO vraag)

RECODE SOOSK301 (1,2,3=0)(4,5=1)(else=copy) into SOOSK3A1.
EXECUTE .

VARIABLE LABELS 
  SOOSK3A1 'Voelt zich veilig op school'.
EXECUTE .
  
VALUE LABELS
  SOOSK3A1 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SOOSK3A1 (F1.0) .
EXECUTE .

MISSING VALUES
  SOOSK3A1 (9) .
EXECUTE .

* Aanmaken indicator: *** SOOSK3A2 % dat het (helemaal) eens is met de stelling:  Leerlingen op mijn school gaan goed met elkaar om. (Facultatieve OKO vraag)

RECODE SOOSK303 (1,2,3=0)(4,5=1)(else=copy) into SOOSK3A2.
EXECUTE .

VARIABLE LABELS 
  SOOSK3A2 'Vindt dat leerlingen op school goed met elkaar omgaan'.
EXECUTE .
  
VALUE LABELS
  SOOSK3A2 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SOOSK3A2 (F1.0) .
EXECUTE .

MISSING VALUES
  SOOSK3A2 (9) .
EXECUTE .

* Aanmaken indicator: *** SOOSK3A3 % dat het (helemaal) eens is met de stelling:  Docenten op mijn school gaan goed met de leerlingen om. (Facultatieve OKO vraag)

RECODE SOOSK304 (1,2,3=0)(4,5=1)(else=copy) into SOOSK3A3.
EXECUTE .

VARIABLE LABELS 
  SOOSK3A3 'Vindt dat docenten op school goed met de leerlingen omgaan'.
EXECUTE .
  
VALUE LABELS
  SOOSK3A3 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SOOSK3A3 (F1.0) .
EXECUTE .

MISSING VALUES
  SOOSK3A3 (9) .
EXECUTE .

* Aanmaken indicator: *** SOOSK3A4 % dat het (helemaal) eens is met de stelling:  Ik vind naar school gaan zinloos. (Basis OKO vraag)

RECODE SOOSK306 (1,2,3=0)(4,5=1)(else=copy) into SOOSK3A4.
EXECUTE .

VARIABLE LABELS 
  SOOSK3A4 'Vindt naar school gaan zinloos'.
EXECUTE .
  
VALUE LABELS
  SOOSK3A4 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SOOSK3A4 (F1.0) .
EXECUTE .

MISSING VALUES
  SOOSK3A4 (9) .
EXECUTE .

*FREQUENCIES SOOSK3A1 SOOSK3A2 SOOSK3A3 SOOSK3A4.

*** EINDE VAN DE SYNTAX ***