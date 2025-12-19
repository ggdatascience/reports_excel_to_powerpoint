* Encoding: UTF-8.
********************************************************************************************************
*** Syntax standaard Functioneren op school
*** Versie 2 / 30 augustus 2023.
*** Standaard vastgesteld op 23 maart 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************

*OKO 2025 verzuim / spijbelen niet nagevraagd daarom weggelaten uit deze syntax.
*Er worden hier afgeleide variabelen aangemaakt met een S van samengesteld, maar dit is eigenlijk niet juist, had een A van afgeleide moeten zijn.
*Omdat dit geen nieuwe vraag is, behouden we de variabelennamen van voorgaande keren.

***Wijzigingen in 2023 t.o.v. vorige versie uit 2015 (versie 1):
*Variabelenamen zijn aangepast i.v.m. nieuwe antwoordcategorieen

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .

*** SBOSK3S6: Schoolbeleving in 3 categoriën
*** SBOSK3S7: % dat school (hartstikke) leuk vindt 
*** SBOSK3S8: % dat school niet leuk of vreselijk vindt 

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***.

VARIABLE LABELS
  SBOSK304 'Hoe vind je het op school?'.
EXECUTE. 

VALUE LABELS
  SBOSK304 1 'Hartstikke leuk' 2 'Leuk' 3 'Gaat wel' 4 'Niet leuk' 5 'Vreselijk' 9 'Onbekend'.
 EXECUTE. 

FORMATS 
  SBOSK304 (F1.0).
EXECUTE.

MISSING VALUES
  SBOSK304 (9).
EXECUTE. 

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SBOSK304) SBOSK304  = 9 .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

*** SBOSK3S6:% dat school (hartstikke) leuk vindt/ gaat wel/ niet leuk, vreselijk.

RECODE  SBOSK304 (1,2=1)(3=2)(4,5=3)(else=copy) into SBOSK3S6 .
EXECUTE .

VARIABLE LABELS
  SBOSK3S6 'Schoolbeleving in 3 categoriën' .
EXECUTE .

VALUE LABELS
  SBOSK3S6 1 '(Hartstikke) leuk' 2 'Gaat wel' 3 'Niet leuk/ vreselijk' 9 'Onbekend'.
EXECUTE .

FORMATS
  SBOSK3S6 (F1.0) .
EXECUTE .

MISSING VALUES
  SBOSK3S6 (9) .
EXECUTE.

*** SBOSK3S7:% dat school (hartstikke) leuk vindt.

RECODE  SBOSK304 (1,2=1)(3,4,5=0)(else=copy) into SBOSK3S7 .
EXECUTE .

VARIABLE LABELS
  SBOSK3S7 'Vindt school (hartstikke) leuk' .
EXECUTE .

VALUE LABELS
  SBOSK3S7 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBOSK3S7 (F1.0) .
EXECUTE .

MISSING VALUES
  SBOSK3S7 (9) .
EXECUTE.

*** SBOSK3S8:% dat school niet leuk of vreselijk vindt.

RECODE  SBOSK304 (1,2,3=0)(4,5=1)(else=copy) into SBOSK3S8 .
EXECUTE .

VARIABLE LABELS
  SBOSK3S8 'Vindt school niet leuk of vreselijk' .
EXECUTE .

VALUE LABELS
  SBOSK3S8 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBOSK3S8 (F1.0) .
EXECUTE .

MISSING VALUES
  SBOSK3S8 (9) .
EXECUTE.

*fre SBOSK3S6 SBOSK3S7 SBOSK3S8.

*** EINDE VAN DE SYNTAX ***

