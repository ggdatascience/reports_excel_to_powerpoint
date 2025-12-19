* Encoding: UTF-8.


*******************************************************************************************************
***OKO 2025 vraag 11 t/m 15 - chillen met vrienden en contact/ afspraken ouders
*** 11 - Hoe vaak chill je 's avonds met vrienden/vreindinnen bij iemand thuis zonder dat er een volwassene thuis is?
*** 12 - Hoe vaak chill je 's avonds met vrienden/vreindinnen op andere plekken dan bij iemand thuis zonder dat er een volwassene bij is?
*** 13 - Hebben jouw ouder(s)/verzorger(s) contact met de ouder(s)/verzorger(s) van je vrienden?
*** 14 - Maken je ouder(s)/verzorger(s) afspraken met ouder(s)/verzorger(s) van je vrienden over hoe laat je thuis moet zijn?
*** 15 - Maken je ouder(s)/verzorger(s) afspraken met ouder(s)/verzorger(s) van je vrienden over of er wel of geen alcohol gedronken mag worden?
*******************************************************************************************************
******************************************************************************************************
*** Versie 1.3 24 nov 2025 
*** Wijzigingen tov 2024
*** feestje zonder volw eruit gehaald.
 *** SOCHK3A1 SOCHK3A2 SOCHK3A4 zijn afgeleide indicatoren, waren voorheen SOCHK3S1 SOCHK3S2 SOCHK3S4
 *** SOCHK3S5 SOCHK3S6 deze zijn hetzelfde gebleven omdat je hierbij 2 variabelen gebruikt om tot deze variabel te komen = samengesteld.
  ***Michelle Wennekers - mwennekers@ggdzw.nl.
********************************************************************************************************
*******************************************************************************************************
***OKO 2024 pilot vragen chillen.
*** Versie 1 / 1 november 2024 .
*** Contactpersoon:Gea Schouten, aangepast Ralf Hermsen 6 november 2024
********************************************************************************************************


* Aanmaken indicator: SOCHK3A1 % dat 1 keer per maand of vaker bij vrienden thuis chillt zonder aanwezigheid van volwassenen (voorheen SOCHK3S1).
* Aanmaken indicator: SOCHK3A2 % dat 1 keer per maand of vaker ergens anders dan bij vrienden thuis chillt zonder aanwezigheid van volwassenen  (voorheen SOCHK3S2) .
* Aanmaken indicator: SOCHK3A4 % ouders dat contact heeft met sommige of meeste ouders van je vrienden  (voorheen SOCHK3S4)
 * Aanmaken indicator: SOCHK3S5 % ouders dat afspraken maakt met ouders van vrienden over tijd thuis zijn (in totale populatie) .
* Aanmaken indicator: SOCHK3S6 % ouders dat afspraken maakt met ouders van vrienden over het drinken van alcohol (in totale populatie)..
* Aanmaken indicator: SOCHK3S7 % dat 1 keer per maand of vaker ergens chillt zonder aanwezigheid van volwassenen.

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

FREQUENCIES SOCHK301 SOCHK302.
VARIABLE LABELS 
SOCHK301 'Met vrienden ‘s avonds bij een vriend(in) thuis chillen zonder dat er een volwassene aanwezig is'
SOCHK302 'Met vrienden ’s avonds ergens anders (niet bij vrienden thuis) chillen zonder dat er een volwassene aanwezig is'.
VALUE LABELS
SOCHK301 SOCHK302 1 '(bijna) nooit'  2 'minder dan 1 keer per maand' 3 '1-3 keer per maand' 4 '1-3 keer per week' 5 '4 keer per week of vaker' 9 'Onbekend'.
FORMATS SOCHK301  SOCHK302  (F1.0) .
MISSING VALUES SOCHK301 SOCHK302  (9) .
EXECUTE .

FREQUENCIES SOCHK304.
VARIABLE LABELS 
SOCHK304 'Hebben jouw ouder(s)/verzorger(s) contact met de ouder(s)/verzorger(s) van je vrienden?'.
VALUE LABELS
SOCHK304 1 'Nee, geen contact, die kennen ze niet'  2 'Nee, geen contact, maar ze kennen sommige wel' 3 'Ja, met sommige hebben ze contact ' 4 'Ja, met de meeste hebben ze contact' 9 'Onbekend'.
FORMATS SOCHK304  (F1.0) .
MISSING VALUES SOCHK304  (9) .
EXECUTE .

FREQUENCIES SOCHK305.
VARIABLE LABELS 
SOCHK305 'Maken je ouder(s)/verzorger(s) afspraken met ouder(s)/verzorger(s) van je vrienden over hoe laat je thuis moet zijn?'.
VALUE LABELS
SOCHK305 1 'Ja'  2 'Nee' 3 'Weet niet ' 9 'Onbekend'.
FORMATS SOCHK305  (F1.0) .
MISSING VALUES SOCHK305  (9) .
EXECUTE .


FREQUENCIES SOCHK306.
VARIABLE LABELS 
SOCHK306 'Maken je ouder(s)/verzorger(s) afspraken met ouder(s)/verzorger(s) van je vrienden over of er wel of geen alcohol gedronken mag worden?'.
VALUE LABELS
SOCHK306 1 'Ja'  2 'Nee' 3 'Weet niet ' 9 'Onbekend'.
FORMATS SOCHK306  (F1.0) .
MISSING VALUES SOCHK306  (9) .
EXECUTE .


*** Als er niets is ingevuld, dan krijgt de variabele de waarde 9 (onbekend) ***.
IF missing (SOCHK301) PBMHK301 = 9 .
IF missing (SOCHK302) PBMHK301 = 9 .
IF missing (SOCHK304) PBMHK301 = 9 .
IF missing (SOCHK305) PBMHK301 = 9 .
IF missing (SOCHK306) PBMHK301 = 9 .
EXECUTE.

FREQUENCIES SOCHK301 SOCHK302 SOCHK304 SOCHK305 SOCHK306.

*** STAP 2: INDICATOREN AANMAKEN ***


* Aanmaken indicator: SOCHK3A1 % dat 1 keer per maand of vaker bij vrienden thuis chillt zonder aanwezigheid van volwassenen .

FREQUENCIES SOCHK301.
RECODE SOCHK301 (1,2=0)(3,4,5=1)(else=copy) into SOCHK3A1 .
EXECUTE .

VARIABLE LABELS 
  SOCHK3A1 'Chillt 1 keer per maand of vaker bij vrienden thuis zonder aanwezigheid van volwassenen' .
VALUE LABELS
SOCHK3A1 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS
SOCHK3A1 (F1.0) .
MISSING VALUES
SOCHK3A1 (9) .
EXECUTE .

FREQUENCIES SOCHK3A1.
CROSSTABS SOCHK301 by SOCHK3A1.


* Aanmaken indicator: SOCHK3A2 % dat 1 keer per maand of vaker ergens anders dan bij vrienden thuis chillt zonder aanwezigheid van volwassenen .

FREQUENCIES SOCHK302.
RECODE SOCHK302 (1,2=0)(3,4,5=1)(else=copy) into SOCHK3A2 .
EXECUTE .

VARIABLE LABELS 
  SOCHK3A2 'Chillt 1 keer per maand of vaker ergens anders zonder aanwezigheid van volwassenen' .
VALUE LABELS
SOCHK3A2 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS
SOCHK3A2 (F1.0) .
MISSING VALUES
SOCHK3A2 (9) .
EXECUTE .

FREQUENCIES SOCHK3A2.
CROSSTABS SOCHK302 by SOCHK3A2.



* Aanmaken indicator: SOCHK3A4 % ouders dat contact heeft met sommige of meeste ouders van je vrienden

FREQUENCIES SOCHK304.
RECODE SOCHK304 (1,2=0)(3,4=1)(else=copy) into SOCHK3A4 .
EXECUTE .

VARIABLE LABELS 
  SOCHK3A4 'Ouders hebben met sommige of meeste ouders van vrienden contact' .
VALUE LABELS
SOCHK3A4 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS
SOCHK3A4 (F1.0) .
MISSING VALUES
SOCHK3A4 (9) .
EXECUTE .

FREQUENCIES SOCHK3A4.
CROSSTABS SOCHK304 by SOCHK3A4.



* Aanmaken indicator: SOCHK3S5 % Ouders maken afspraken met ouders van vrienden over tijd thuis zijn (in totale populatie).
FREQUENCIES SOCHK305.
RECODE SOCHK305 (1=1)(2=0) (3=9) (9=9) (else=copy) into SOCHK3S5 .
IF (SOCHK3A4=0) SOCHK3S5 =0.
EXECUTE .

VARIABLE LABELS 
  SOCHK3S5 'Ouders maken met ouders van vrienden afspraken over tijd thuis' .
VALUE LABELS
SOCHK3S5 0 'Nee of geen contact' 1 'Ja'  9 'Onbekend/weet niet' .
FORMATS
SOCHK3S5 (F1.0) .
MISSING VALUES
SOCHK3S5 (9) .
EXECUTE .

FREQUENCIES SOCHK3S5.


* Aanmaken indicator: SOCHK3S6 % Ouders maken afspraken met ouders van vrienden over het drinken van alcohol (in totale populatie). oftewel Ouders hebben contact met andere ouders én hebben afspraken met andere ouders over alcohol .
FREQUENCIES SOCHK306.
RECODE SOCHK306 (1=1)(2=0) (3=9) (9=9) (else=copy) into SOCHK3S6 .
IF (SOCHK3A4=0) SOCHK3S6 =0.
EXECUTE .

VARIABLE LABELS 
  SOCHK3S6 'Ouders maken met ouders van vrienden afspraken over alcohol' .
VALUE LABELS
SOCHK3S6 0 'Nee of geen contact' 1 'Ja'  9 'Onbekend/weet niet' .
FORMATS
SOCHK3S6 (F1.0) .
MISSING VALUES
SOCHK3S6 (9) .
EXECUTE .

FREQUENCIES SOCHK3S6.


*  Aanmaken indicator: SOCHK3S7 % dat 1 keer per maand of vaker ergens chillt zonder aanwezigheid van volwassenen.

Compute SOCHK3S7=-1.
execute.
If (SOCHK3A1 = 1 OR SOCHK3A2=1) SOCHK3S7=1.
EXECUTE.
If (SOCHK3A1 = 0 AND SOCHK3A2=0)  SOCHK3S7=0.
execute.
if  (missing (SOCHK3A1)) AND (missing(SOCHK3A2))  SOCHK3S7=9.
execute.
if  (missing (SOCHK3A1)) AND (SOCHK3A2=0) SOCHK3S7=9.
execute.
if  (SOCHK3A1=0) AND (missing(SOCHK3A2))  SOCHK3S7=9.
execute.

VARIABLE LABELS 
  SOCHK3S7 'Chillt 1 keer per maand of vaker ergens zonder aanwezigheid van volwassenen' .
VALUE LABELS
SOCHK3S7 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS
SOCHK3S7 (F1.0) .
MISSING VALUES
SOCHK3S7 (9) .
EXECUTE .

FREQUENCIES SOCHK3S7.
CROSSTABS SOCHK3A1 by SOCHK3A2.

***EINDE SYNTAX.
