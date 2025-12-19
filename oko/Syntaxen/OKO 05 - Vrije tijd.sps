* Encoding: UTF-8.

********************************************************************************************************
*** Syntax OKO 2025 - Vrije tijd
*** Aangepaste versie van februari 2024 van Nelleke de Vos, ndevos@ggdru.nl
*** Versie november 2025 .
*** Contactpersoon: Michelle Wennekers, mwennekers@ggdzw.nl
********************************************************************************************************

*** Eerst landelijke basis syntax bewegen runnen*.

*** Verandering tov GMJ2023 vragen.
   * 2 vragen van 2023 worden vervangen door 1 nieuwe vraag in 2025, zie hieronder:
   *  2023: 
   * SOVBK301 'Op hoeveel dagen van de week maak je muziek, zing je, speel je toneel, teken/schilder je of fotografeer je buiten schooltijd bij een club of vereniging? ' 
   * SOVBK302 'Op hoeveel dagen van de week doe je buiten schooltijd activiteiten bij een ander soort club, vereniging of organisatie?'.
    *2025:
    * SOVBK303 'Op hoeveel dagen van de week ben je in je vrije tijd actief bij een club, vereniging of organisatie anders dan een sportclub of sportschool?'
    *daarom samengestelde variabel aangepast. Wat in 2023 SOVBK3S20 t/m SOVBK3S23 waren, is nu in 2025 SOVBK3S24 t/m SOVBK3S27.
* LOLBK3S1,  LOLBK3S2, LOLBK3S3 zijn geen samengestelde variabelen maar een afgeleide, daarom LOLBK3A1, LOLBK3A2, LOLBK3A3 van gemaakt . Let op vergelijkbaarheid.
    
*** Aanpassing tov versie december 2023.
    * Als minimaal één van de voorliggende variabelen voor de indicatoren SOVBK3S21 t/m SOVBK3S23 missing was, werden SOVBK3S21 t/m SOVBK3S23 ook op missing gezet.
    * Indien echter op één van de voorliggende variabelen een antwoord is gegeven waardoor aan indicator SOVBK3S21, SOVBK3S22 en/of SOVBK3S23 wordt voldaan, krijgen deze variabelen een waarde toegekend.

*** Aanpassing tov vorige versie.
    * Voor de indicatoren met betrekking tot bewegen werden de indicatornamen LBLBK3S16, LBLBK3S17 en LBLBK3S18 gebruikt. 
    * Na aanpassing van de basissyntax bewegen werd ook daar LBLBK3S16 aangemaakt. Deze werd dus met deze syntax overschreven.
    * Om de variable names niet te laten overlappen en om duidelijker te maken dat het om OKO-indicatoren gaat, zijn deze variable names aangepast naar LOLBK3S1, LOLBK3S2 en LOLBK3S3. 
    * Tot slot is in de variable labels het woord 'vereniging'  verwijderd, omdat dit niet in de vraagstelling zit. 

*** Aanpassingen ten opzichte van 2022:
    *Sporten bij een club/vereniging/sportschool is basisvraag GMJ 2023
     *Antwoordcategorieen zijn aangepast ten opzichte van 2021, meerdere dagen per week opgesplitst in 2 of 3 dagen per week en 4 t/m 6 dagen per week
     *Resultaat wel vergelijkbaar met 2021. Wel nieuwe variabelenaam
     *LBLBK325  'Hoe vaak doe je aan sport bij een club of sportschool?'
     *1 '(Bijna) nooit' 2 'Minder dag 1 dag per week' 3 '1 dag per week' 4 '2 of 3 dagen per week' 5 '4 t/m 6 dagen per week' 6 'Elke dag' 9 'Onbekend'/
     * 'buiten schooltijd' staat niet meer in de vraag over sporten.
    *omdat de antwoordcategorieen zijn aangepast kunnen de indicatoren 1-2 dagen en 3 of meer dagen per week niet meer gemaakt worden. 
    *activiteiten kerk of moskee en activiteiten op school zijn komen te vervallen. Daardoor is de vraag bij andere soort club of vereniging niet vergelijkbaar met OKO 2022.
   
*** Aangepaste variabele namen voor OKO 2023 . 
*  LBLBK322 (2021) / OOVBK301 (2022) is in 2023 LBLBK325  'Hoe vaak doe je aan sport bij een club of sportschool?'. Landelijke basisvraag.
*  OOVBK301D1 (2022) is in 2023 LBLBK3S16 'Sport minder dan 1 dag per week buiten schooltijd bij een club, sportvereniging of sportschool'
*  OOVBK301D2 1-2 dagen en OOVBK301D3 3 of meer dagen komen te vervallen.

* OOVBK302 (2022) is in 2023 SOVBK301 'Op hoeveel dagen van de week maak je muziek, zing je, speel je toneel, teken/schilder je of fotografeer je buiten schooltijd bij een club of vereniging? ' 
* OOVBK302D1 (2022) is in 2023 SOVBK3S1 % dat minder dan 1 dag per week buiten schooltijd muziek maakt, zingt, toneel speelt, tekent/schildert of fotografeert bij een vereniging.
* OOVBK302D2 1-2 dagen en OOVBK302D3 3 of meer dagen komen te vervallen.

* OOVBK305 (2022) is in 2023 SOVBK302 'Op hoeveel dagen van de week doe je buiten schooltijd activiteiten bij een ander soort club, vereniging of organisatie?'.
* OOVBK305D1 (2022) is in 2023 SOVBK3S5 % dat minder dan 1 dag per week buiten schooltijd activiteiten doet bij een ander soort vereniging of organisatie.
* OOVBK305D2 1-2 dagen en OOVBK305D3 3 of meer dagen komen te vervallen.

* samengestelde indicatoren: heeft minimaal 3 dagen per week een buitenschoolse activiteit (OOVBKS303 uit 2022) vervalt, kan met nieuwe antwoordcategorieen niet meer aangemaakt worden.

*** IN DE LANDELIJKE BASIS SYNTAX BEWEGEN WORDT DE VOLGENDE INDICATOR AANGEMAAKT:
*** LBLBK3S11 % dat wekelijks sport bij een club, vereniging of sportschool : zie syntax basisvraag bewegen.


*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .

*** LOLBK3A1 % dat minder dan 1 dag per week sport bij een club of sportschool (voorheen LOLBK3S1).
*** LOLBK3A2 % dat 2 of meer dagen per week sport bij een club of sportschool (voorheen LOLBK3S2).
*** LOLBK3A3 % dat 4 of meer dagen per week sport bij een club of sportschool (voorheen LOLBK3S3).

*** SOVBK3A1 % dat minder dan 1 dag per week in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.
*** SOVBK3A2 % dat wekelijks in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.
*** SOVBK3A3 % dat 2 of meer dagen per week in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.
*** SOVBK3A4 % dat 4 of meer dagen per week in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.

*** SOVBK3S25 % dat minimaal 1 dag per week is aangesloten bij een club, vereniging of organisatie (voorheen SOVBK3S21).
*** SOVBK3S26 % dat minimaal 2 of 3 dagen per week  is aangesloten bij een club, vereniging of organisatie (voorheen SOVBK3S22).
*** SOVBK3S27 % dat minimaal 4 dagen per week  is aangesloten bij een club, vereniging of organisatie (voorheen SOVBK3S23).


*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***.

FREQUENCIES SOVBK303.
VARIABLE LABELS
    SOVBK303 'Op hoeveel dagen van de week ben je in je vrije tijd actief bij een club, vereniging of organisatie anders dan een sportclub of sportschool?'. 
    EXECUTE. 

VALUE LABELS
      SOVBK303 1 '(Bijna) nooit' 2 'Minder dan 1 dag per week' 3 '1 dag per week' 4 '2 of 3 dagen per week' 5 '4 tot en met 6 dagen per week' 6 'Elke dag' 9 'Onbekend'.
EXECUTE.
    
MISSING VALUES
    SOVBK303 (9).
EXECUTE. 


* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SOVBK303) SOVBK303 = 9 .
EXECUTE .

FREQUENCIES SOVBK303.

*** STAP 2: INDICATOREN AANMAKEN ***.

* Sporten.
* NB eerst basisstandaard syntax bewegen runnen.
* Aanmaken indicator: LOLBK3A1 % dat minder dan 1 dag per week sport bij een club, sportvereniging of sportschool.
FREQUENCIES LBLBK325.
RECODE LBLBK325 (1 thru 2=1)(3 thru 6=0)(else=copy) into LOLBK3A1.
EXECUTE .

VARIABLE LABELS 
  LOLBK3A1 'Sport minder dan 1 dag per week bij een club of sportschool' .
EXECUTE .

VALUE LABELS
  LOLBK3A1 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  LOLBK3A1 (F1.0) .
EXECUTE .

MISSING VALUES
  LOLBK3A1 (9) .
EXECUTE .

FREQUENCIES LOLBK3A1.
CROSSTABS LBLBK325 by LOLBK3A1.

* Aanmaken indicator: LOLBK3A2 % dat 2 of meer dagen per week sport bij een club, sportvereniging of sportschool.
 RECODE LBLBK325 (1 thru 3=0) (4 thru 6=1)(else=copy) into LOLBK3A2.
EXECUTE .

VARIABLE LABELS 
    LOLBK3A2 'Sport 2 of meer dagen per week bij een club of sportschool' .
EXECUTE .

VALUE LABELS
    LOLBK3A2 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    LOLBK3A2 (F1.0) .
EXECUTE .

MISSING VALUES
    LOLBK3A2 (9) .
EXECUTE .

FREQUENCIES LOLBK3A2.
CROSSTABS LBLBK325 by LOLBK3A2. 


* Aanmaken indicator: LOLBK3A3 % dat 4 of meer dagen per week sport bij een club, sportvereniging of sportschool.
RECODE LBLBK325 (1 thru 4=0)(5 thru 6=1)(else=copy) into  LOLBK3A3 .
EXECUTE .

VARIABLE LABELS 
   LOLBK3A3  'Sport 4 of meer dagen per week bij een club, sportvereniging of sportschool'.
EXECUTE .

VALUE LABELS
   LOLBK3A3 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
   LOLBK3A3 (F1.0) .
EXECUTE .

MISSING VALUES
   LOLBK3A3 (9) .
EXECUTE .

FREQUENCIES LOLBK3A3.
CROSSTABS LBLBK325 by LOLBK3A3. 

* anders dan sportclub of sportschool
* Aanmaken indicator: SOVBK3A1 % dat minder dan 1 dag per week in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.
FREQUENCIES SOVBK303.
RECODE SOVBK303 (1 thru 2=1)(3 thru 6=0)(else=copy) into SOVBK3A1.
EXECUTE .

VARIABLE LABELS 
    SOVBK3A1 'Is minder dan 1 dag per week in de vrije tijd actief bij een club, vereniging of organisatie anders dan een sportclub of sportschool.' .
EXECUTE .

VALUE LABELS
    SOVBK3A1 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    SOVBK3A1 (F1.0) .
EXECUTE .

MISSING VALUES
     SOVBK3A1 (9) .
EXECUTE .

FREQUENCIES SOVBK3A1.
CROSSTABS SOVBK303 by SOVBK3A1.



* Aanmaken indicator: SOVBK3A2 % dat wekelijks  in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.
FREQUENCIES SOVBK303.
RECODE SOVBK303 (1 thru 2=0)(3 thru 6=1)(else=copy) into SOVBK3A2 .
EXECUTE .

VARIABLE LABELS 
    SOVBK3A2  'Is wekelijks in de vrije tijd actief bij een club, vereniging of organisatie anders dan een sportclub of sportschool'.
EXECUTE .

VALUE LABELS
     SOVBK3A2 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    SOVBK3A2 (F1.0) .
EXECUTE .

MISSING VALUES
    SOVBK3A2 (9) .
EXECUTE .

FREQUENCIES SOVBK3A2.
CROSSTABS SOVBK303 by SOVBK3A2.


* Aanmaken indicator: SOVBK3A3 % dat 2 of meer dagen per week in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.
FREQUENCIES SOVBK303.
 RECODE SOVBK303 (1 thru 3=0) (4 thru 6=1)(else=copy) into SOVBK3A3.
EXECUTE .

VARIABLE LABELS 
    SOVBK3A3 'Is 2 of meer dagen per week in de vrije tijd actief bij een club, vereniging of organisatie anders dan een sportclub of sportschool'.
EXECUTE .

VALUE LABELS
    SOVBK3A3 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    SOVBK3A3 (F1.0) .
EXECUTE .

MISSING VALUES
    SOVBK3A3 (9) .
EXECUTE .

FREQUENCIES SOVBK3A3.
    crosstabs SOVBK303 by SOVBK3A3.


* Aanmaken indicator: SOVBK3A4 % dat 4 of meer dagen per week in de vrije tijd actief is bij een club, vereniging of organisatie anders dan een sportclub of sportschool.
FREQUENCIES SOVBK303.
RECODE SOVBK303 (1 thru 4=0)(5 thru 6=1)(else=copy) into SOVBK3A4 .
EXECUTE .

VARIABLE LABELS 
    SOVBK3A4  'Is 4 of meer dagen per week  in de vrije tijd actief bij een club, vereniging of organisatie anders dan een sportclub of sportschool'.
EXECUTE .

VALUE LABELS
     SOVBK3A4 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    SOVBK3A4 (F1.0) .
EXECUTE .

MISSING VALUES
    SOVBK3A4 (9) .
EXECUTE .

FREQUENCIES SOVBK3A4.
CROSSTABS SOVBK303 by SOVBK3A4.


***AANMAKEN SAMENGESTELDE INDICATOREN.

* Als er op 1 of meer items niets is ingevuld, dan krijgt de totaalscore de waarde 99 (missing) .

* Hiertoe eerst het aantal keren missing op de items bij elkaar optellen .
COUNT amis = LBLBK325 SOVBK303 (9) .
EXECUTE .

FREQUENCIES amis.

*Aanmaken tijdelijke tussenvariabelen.

RECODE LBLBK325 (1=0) (2=0) (3=1) (4=2) (5=4) (6=7) (else=0) into LBLBKA325 .
RECODE SOVBK303 (1=0) (2=0) (3=1) (4=2) (5=4) (6=7) (else=0) into SOVBKA303 .

EXECUTE .
FREQUENCIES LBLBKA325 SOVBKA303.

VARIABLE LABELS 
  LBLBKA325  'Op hoeveel dagen van de week sport je bij een club, sportvereniging of sportschool?'
  SOVBKA303 Op hoeveel dagen van de week ben je in je vrije tijd actief bij een club, vereniging of organisatie anders dan een sportclub of sportschool?.

EXECUTE.

VALUE LABELS  LBLBKA325 SOVBKA303 0 'Missing, nooit, minder dan 1 dag' 1 '1 dag' 2 '2 of 3 dagen'  4 '4 tot en met 6 dagen' 7 '7 dagen'.
EXECUTE .

FORMATS
LBLBKA325 SOVBKA303 (F1.0) .
EXECUTE .

FREQUENCIES LBLBKA325 SOVBKA303.
CROSSTABS LBLBKA325 by SOVBKA303.

* Als er op 1 of meer items niets is ingevuld, dan krijgt de totaalscore (0 tm 14) de waarde 99 (missing) .
* Aanmaken van de totaalscore .

IF (amis  < 1) SOVBK3S24 = LBLBKA325 + SOVBKA303 .
IF (amis ge 1) SOVBK3S24 = 99 .
EXECUTE.


VARIABLE LABELS 
SOVBK3S24  'Totaalscore 0 tm 14 vrijetijd'.
Execute.

FREQUENCIES SOVBK3S24.

* Aanmaken indicator: SOVBK3S25 % dat minimaal 1 dag per week een activiteit doet bij een club, vereniging of organisatie.
RECODE SOVBK3S24 (0=0)(1 thru 14=1) (99=9) into SOVBK3S25 .
IF (SOVBK303>2 OR LBLBK325>2) SOVBK3S25=1.
EXECUTE .

VARIABLE LABELS 
    SOVBK3S25 'Doet minimaal 1 dag per week een activiteit bij een club, vereniging of organisatie'.
EXECUTE .

VALUE LABELS
    SOVBK3S25 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    SOVBK3S25 (F1.0) .
EXECUTE .

MISSING VALUES
    SOVBK3S25 (9) .
EXECUTE .

FREQUENCIES SOVBK3S25.

* Aanmaken indicator: SOVBK3S26 % dat minimaal 2 of 3 dagen per week een activiteit doet bij een club, vereniging of organisatie.
RECODE SOVBK3S24 (0=0)(1=0) (2 thru 14=1) (99=9) into SOVBK3S26 .
IF ((SOVBK303>3 AND SOVBK303<7) OR (LBLBK325>3 AND LBLBK325<7)) SOVBK3S26 =1.
EXECUTE .

VARIABLE LABELS 
    SOVBK3S26 'Doet minimaal 2 of 3 dagen per week een activiteit bij een club, vereniging of organisatie'.
EXECUTE .

VALUE LABELS
    SOVBK3S26 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    SOVBK3S26 (F1.0) .
EXECUTE .

MISSING VALUES
    SOVBK3S26 (9) .
EXECUTE .

FREQUENCIES SOVBK3S26.

* Aanmaken indicator: SOVBK3S27 % dat minimaal 4 dagen per week een activiteit doet bij een club, vereniging of organisatie.
RECODE SOVBK3S24 (0=0)(1=0) (2=0) (3=0) (4 thru 14=1) (99=9) into SOVBK3S27 .
IF ((SOVBK303>4 AND SOVBK303<7) OR (LBLBK325>4 AND LBLBK325<7)) SOVBK3S26 =1.
EXECUTE .

VARIABLE LABELS 
    SOVBK3S27 'Doet minimaal 4 dagen per week een activiteit bij een club, vereniging of organisatie'.
EXECUTE .

VALUE LABELS
    SOVBK3S27 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
    SOVBK3S27 (F1.0) .
EXECUTE .

MISSING VALUES
    SOVBK3S27 (9) .
EXECUTE .

FREQUENCIES  SOVBK3S27.


DELETE VARIABLES AMIS LBLBKA325 SOVBKA303.

FREQUENCIES LOLBK3A1 LOLBK3A2 LOLBK3A3 SOVBK3A1 SOVBK3A2 SOVBK3A3 SOVBK3A4 SOVBK3S25 SOVBK3S26 SOVBK3S27.
*** EINDE VAN DE SYNTAX ***.
