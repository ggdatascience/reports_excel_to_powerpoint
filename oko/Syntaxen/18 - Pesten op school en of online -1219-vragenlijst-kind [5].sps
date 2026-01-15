* Encoding: UTF-8.
******************************************************************************************************************************************
*** Standaard voor pesten op school en cyberpesten
*** Versie 4 / 18 december 2025.
*** Standaard vastgesteld op 21 juli 2025
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl	.
******************************************************************************************************************************************
***Aanpassing januari 2026: Als voorloper pestvraag 1 = nooit is, dan wordt dit 0 in de vervolgvragen i.p.v. 8 niet van toepassing.

***Aanpassing 2026 ten opzichte van 2023: de vraagstelling maakt geen direct onderscheid meer tussen online en fysiek pesten omdat dit in de praktijk in elkaar overloopt

***Toelichting: In 2023 is in de werkgroep vraagstellingen besloten om de indicatoren voor pesten op school en cyberpesten, en ook de samengestelde indicatoren samen te voegen in 1 syntax.
*** in 2023 zijn er (beperkte) tekstuele wijziging in de vraagstelling cyberpesten gedaan, mobiele telefoon is verwijderd 

*** Toelichting: in 2021 is in de werkgroep vraagstellingen, na goedkeuring door de vakgroep, besloten om samengestelde indicatoren aan te maken voor het thema pesten.
*** In deze samengestelde indicatoren worden de onderwerpen pesten op school en cyberpesten samengenomen. 
*** Voorwaarde van de vakgroep was om hierin duidelijk te maken dat er alleen gevraagd is naar pesten op school en cyberpesten. 

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** SBRLK3S34 % dat de laatste 3 maanden gepest is 
*** SBRLK3S35 % dat de laatste 3 maanden soms gepest is 
*** SBRLK3S36 % dat de laatste 3 maanden vaak gepest is  
*** SBRLK3S14 % dat de laatste 3 maanden gepest is op of rond school 
*** SBRLK3S15 % dat de laatste 3 maanden gepest is online of op sociale media 
*** SBRLK3S16 % dat de laatste 3 maanden gepest is bij de sportclub of andere vereniging 
*** SBRLK3S17 % dat de laatste 3 maanden gepest is in de buurt waar hij/zij woont  
*** SBRLK3S18 % dat de laatste 3 maanden gepest is ergens anders 
*** SBRLK3S19 % dat de laatste 3 maanden op meer plekken is gepest


*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  SBRLK302 'Hoe vaak ben je de laatste 3 maanden gepest?'
  SBRLK303 'Waar ben je de laatste 3 maanden gepest? Online of via sociale media'
  SBRLK304 'Waar ben je de laatste 3 maanden gepest? Op of rondom school'
  SBRLK305 'Waar ben je de laatste 3 maanden gepest? Bij de sportclub of andere vereniging'
  SBRLK306 'Waar ben je de laatste 3 maanden gepest? In de buurt waar ik woon'
  SBRLK307 'Waar ben je de laatste 3 maanden gepest? Ergens anders'.
EXECUTE .
  
VALUE LABELS
  SBRLK302 1 'Nooit' 2 'Soms' 3 'Vaak' 9 'Onbekend' /
  SBRLK303  SBRLK304  SBRLK305  SBRLK306  SBRLK307  1 'Aangekruist' 2 'Niet aangekruist' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK302  SBRLK303  SBRLK304  SBRLK305  SBRLK306  SBRLK307 (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK302  SBRLK303  SBRLK304  SBRLK305  SBRLK306  SBRLK307 (9) .
EXECUTE .

FREQUENCIES   SBRLK302  SBRLK303  SBRLK304  SBRLK305  SBRLK306  SBRLK307.

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SBRLK302) SBRLK302 = 9 .
IF missing (SBRLK303) SBRLK303 = 9 .
IF missing (SBRLK304) SBRLK304 = 9 .
IF missing (SBRLK305) SBRLK305 = 9 .
IF missing (SBRLK306) SBRLK306 = 9 .
IF missing (SBRLK307) SBRLK307 = 9 .
EXECUTE .

* Op basis van de voorlopervraag SBRLK302 de vervolgvraag SBRLK303 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: SBRLA303 .
COMPUTE SBRLA303 = SBRLK303 .
EXECUTE .

* Als bij de voorlopervraag SBRLK302 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (SBRLK302) SBRLA303= 9 .
EXECUTE .

* Als de voorlopervraag SBRLK302 met 'nee' is beantwoord, dan wordt de vervolgvraag op 'nee' (waarde 0) gezet .
IF (SBRLK302 = 1) SBRLA303 = 0 .
EXECUTE .

* Op basis van de voorlopervraag SBRLK302 de vervolgvraag SBRLK304 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: SBRLA304 .
COMPUTE SBRLA304 = SBRLK304 .
EXECUTE .

* Als bij de voorlopervraag SBRLK302 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (SBRLK302) SBRLA304= 9 .
EXECUTE .

* Als de voorlopervraag SBRLK302 met 'nee' is beantwoord, dan wordt de vervolgvraag op 'nee' (waarde 0) gezet .
IF (SBRLK302 = 1) SBRLA304 = 0 .
EXECUTE .

* Op basis van de voorlopervraag SBRLK302 de vervolgvraag SBRLK305 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: SBRLA305 .
COMPUTE SBRLA305 = SBRLK305 .
EXECUTE .

* Als bij de voorlopervraag SBRLK302 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (SBRLK302) SBRLA305= 9 .
EXECUTE .

* Als de voorlopervraag SBRLK302 met 'nee' is beantwoord, dan wordt de vervolgvraag op 'nee' (waarde 0) gezet .
IF (SBRLK302 = 1) SBRLA305 = 0 .
EXECUTE .

* Op basis van de voorlopervraag SBRLK302 de vervolgvraag SBRLK306 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: SBRLA306 .
COMPUTE SBRLA306 = SBRLK306 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SBRLA306) SBRLA306 = 9 .
EXECUTE .

* Als de voorlopervraag SBRLK302 met 'nee' is beantwoord, dan wordt de vervolgvraag op 'nee' (waarde 0) gezet .
IF (SBRLK302 = 1) SBRLA306 = 0 .
EXECUTE .

* Op basis van de voorlopervraag SBRLK302 de vervolgvraag SBRLK307 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvraag aanmaken: SBRLA307 .
COMPUTE SBRLA307 = SBRLK307 .
EXECUTE .

* Als bij de voorlopervraag SBRLK302 niets is ingevuld, dan wordt de vervolgvraag op missend (waarde 9) gezet .
IF missing (SBRLK302) SBRLA307= 9 .
EXECUTE .

* Als de voorlopervraag SBRLK302 met 'nee' is beantwoord, dan wordt de vervolgvraag op 'nee' (waarde 0) gezet .
IF (SBRLK302 = 1) SBRLA307 = 0 .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat de laatste 3 maanden gepest is.

RECODE SBRLK302 (1=0)(2 thru 3=1)(else=copy) into SBRLK3S34 .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S34 'Is laatste 3 maanden gepest' .
EXECUTE .

VALUE LABELS
  SBRLK3S34 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S34 (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S34 (9) .
EXECUTE .

FREQUENCIES   SBRLK3S34.

* Aanmaken indicator: % dat de laatste 3 maanden soms is gepest .

RECODE SBRLK302 (1=0) (2=1) (3=0)(else=copy) into SBRLK3S35 .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S35 'Is laatste 3 maanden soms gepest' .
EXECUTE .

VALUE LABELS
  SBRLK3S35 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S35 (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S35 (9) .
EXECUTE .

FREQUENCIES SBRLK3S35.

* Aanmaken indicator: % dat de laatste 3 maanden vaak is gepest .

RECODE SBRLK302 (1 thru 2=0)(3=1)(else=copy) into SBRLK3S36 .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S36 'Is laatste 3 maanden vaak gepest' .
EXECUTE .

VALUE LABELS
  SBRLK3S36 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S36 (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S36 (9) .
EXECUTE .

FREQUENCIES SBRLK3S36 .

* Aanmaken indicator: % dat de laatste 3 maanden gepest is online of op sociale media .

RECODE SBRLA303 (1=1)(2=0)(else=copy) into SBRLK3S15 .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S15 'Laatste 3 maanden gepest via internet of social media' .
EXECUTE .

VALUE LABELS
  SBRLK3S15 1 'Ja' 0 'Nee' 8 'nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S15 (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S15 (9) .
EXECUTE .

FREQUENCIES SBRLK3S15.

* Aanmaken indicator: % dat de laatste 3 maanden gepest is op of rond school. 

RECODE SBRLA304 (1=1)(2=0)(else=copy) into SBRLK3S14  .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S14  'Laatste 3 maanden gepest op of rond school' .
EXECUTE .

VALUE LABELS
  SBRLK3S14  1 'Ja' 0 'Nee' 8 'nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S14  (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S14  (9) .
EXECUTE .

FREQUENCIES SBRLK3S14.

* Aanmaken indicator: % dat de laatste 3 maanden gepest is bij de sportclub of andere vereniging  .

RECODE SBRLA305 (1=1)(2=0)(else=copy) into SBRLK3S16  .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S16  'Laatste 3 maanden gepest bij de sportclub of andere vereniging' .
EXECUTE .

VALUE LABELS
  SBRLK3S16  1 'Ja' 0 'Nee' 8 'nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S16  (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S16  (9) .
EXECUTE .

FREQUENCIES SBRLK3S16.

* Aanmaken indicator: % dat de laatste 3 maanden gepest is in de buurt waar hij/zij woont .

RECODE SBRLA306 (1=1)(2=0)(else=copy) into SBRLK3S17  .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S17  'Laatste 3 maanden gepest in de buurt waar hij/zij woont' .
EXECUTE .

VALUE LABELS
  SBRLK3S17  1 'Ja' 0 'Nee' 8 'nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S17  (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S17  (9) .
EXECUTE .

FREQUENCIES SBRLK3S17.

* Aanmaken indicator: % dat de laatste 3 maanden gepest is ergens anders .

RECODE SBRLA307 (1=1)(2=0)(else=copy) into SBRLK3S18  .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S18  'Laatste 3 maanden ergens anders gepest' .
EXECUTE .

VALUE LABELS
  SBRLK3S18  1 'Ja' 0 'Nee' 8 'nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S18  (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S18  (9) .
EXECUTE .

FREQUENCIES SBRLK3S18 .

* Aanmaken indicator: % dat de laatste 3 maanden op meer plekken is gepest
*Tel het aantal keer dat 'ja' voorkomt.

COMPUTE SBRLK3S19 = ( (SBRLK3S14 =1 ) + (SBRLK3S15 = 1) + (SBRLK3S16 =1) + (SBRLK3S17 = 1) + (SBRLK3S18 = 1)) >= 2.
EXECUTE.

*Als jongeren niet gepest worden, wordt SBRLK3S19 nvt (8).
IF (SBRLK302 = 1) SBRLK3S19 = 8 .
EXECUTE .

VARIABLE LABELS 
  SBRLK3S19  'Laatste 3 maanden op meer plekken gepest' .
EXECUTE .

VALUE LABELS
  SBRLK3S19  0 'Nee' 1 'Ja' 8 'nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBRLK3S19  (F1.0) .
EXECUTE .

MISSING VALUES
  SBRLK3S19 (9) .
EXECUTE .

FREQUENCIES SBRLK3S19.

*** EINDE VAN DE SYNTAX ***



