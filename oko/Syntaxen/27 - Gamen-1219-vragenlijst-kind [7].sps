* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Gamen-1219-vragenlijst-kind .
*** Versie 7 / 20 november 2023 .
*** Standaard vastgesteld op 17 maart 2023 .
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl .
********************************************************************************************************

*** AANPASSINGEN 2023 TEN OPZICHTE VAN VORIGE VERSIE (versie 6.1):.
*** Twee extra indicatoren toegevoegd gebaseerd op losse items.
*** Tekstuele wijziging in variabele label van indicator SBGMK301.
*** In 2023 is de matrixvraag omgezet naar zeven losse vragen. Dit heeft geen wijzigingen in de syntax opgeleverd.
*** Score 2 wordt bij indicator SBGMK3S2 en SBGMK3S4 nu meegenomen als weinig/geen risico, dat ging in eerdere syntax mis.
*** Bij verzwaren wordt de indicator nu op missing gezet indien zowel het slaap- als huiswerk-item missing zijn er er op basis van de andere items wel een risico zou zijn.

*** AANPASSINGEN 2021 TEN OPZICHTE VAN VORIGE VERSIE (versie 5):.
*** Routing van voorlopervraag naar vervolgvraag is aangepast. 
*** Vervolgvraag wordt alleen voorgelegd aan jongeren die aangeven '4 of 5 dagen per week' of '(bijna) elke dag' te gamen.
*** In de vraagstelling is daarnaast de introductietekst enigszins aangepast. Dit heeft geen invloed op de syntax. 
*** Formulering van de indicatoren wordt aangepast naar oude formulering. De vraag geeft geen indicatie van een risico dat jongeren ervaren, maar het risico volgt uit de antwoorden die jongeren geven.

*** AANPASSINGEN 2019 TEN OPZICHTE VAN 2015 (versie 4 / 22 maart 2016): .
*** In versie 5 is de formulering van de indicatoren aangepast (zie achtergronddocument) .
*** In versie 5 is de antwoordcategorie 'Zelden' vervangen door 'Bijna nooit' .
*** In versie 5 is de formulering in items SBGMK303 en SBGMK306 aangepast .

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** SBGMK3S2: % dat risico loopt op problematisch gamen (obv 7 items; verkorte IVO-schaal plus slaap-item, verzwaard) .
*** SBGMK3S4: % dat risico loopt op problematisch gamen (obv 6 items; zoals verkorte IVO-schaal) .
*** SBGMK3S5: % dat huiswerk afraffelt om te gamen.
*** SBGMK3S6: % dat slaap te kort komt door het gamen.

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  SBGMK301 'Hoe vaak game je?'
  SBGMK302 'Hoe vaak moeilijk om met gamen te stoppen?'
  SBGMK303 'Hoe vaak zeggen anderen minder zou moeten gamen?'
  SBGMK304 'Hoe vaak liever gamen dan tijd met anderen?'
  SBGMK305 'Hoe vaak onrustig etc wanneer niet gamen?'
  SBGMK306 'Hoe vaak raffel je je huiswerk af omdat je wilt gamen?'
  SBGMK307 'Hoe vaak gamen omdat je je rot voelt?'
  SBGMK308 'Hoe vaak slaap te kort door gamen?' .
EXECUTE .

VALUE LABELS
  SBGMK301 1 '(Bijna) nooit' 2 'Minder dan 1 dag per week' 3 '1 dag per week' 4 '2 of 3 dagen per week' 5 '4 of 5 dagen per week' 6 '(Bijna) elke dag' 9 'Onbekend'/
  SBGMK302 SBGMK303 SBGMK304 SBGMK305 SBGMK306 SBGMK307 SBGMK308 1 'Nooit' 2 'Bijna nooit' 3 'Soms' 4 'Vaak' 5 'Zeer vaak' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBGMK301 SBGMK302 SBGMK303 SBGMK304 SBGMK305 SBGMK306 SBGMK307 SBGMK308 (F1.0) .
EXECUTE .

MISSING VALUES
  SBGMK301 SBGMK302 SBGMK303 SBGMK304 SBGMK305 SBGMK306 SBGMK307 SBGMK308 (9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SBGMK301) SBGMK301 = 9 .
IF missing (SBGMK302) SBGMK302 = 9 .
IF missing (SBGMK303) SBGMK303 = 9 .
IF missing (SBGMK304) SBGMK304 = 9 .
IF missing (SBGMK305) SBGMK305 = 9 .
IF missing (SBGMK306) SBGMK306 = 9 .
IF missing (SBGMK307) SBGMK307 = 9 .
IF missing (SBGMK308) SBGMK308 = 9 .
EXECUTE .

* Op basis van de voorlopervraag SBGMK301 de vervolgvragen SBGMK302 t/m SBGMK308 opschonen .
* En SBGMK302 t/m SBGMK308 omcoderen naar absolute nulcategorie .
* Hiertoe nieuwe variabelen voor de vervolgvragen aanmaken: SBGMA302 t/m SBGMA308 .
RECODE SBGMK302 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBGMA302 .
RECODE SBGMK303 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBGMA303 .
RECODE SBGMK304 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBGMA304 .
RECODE SBGMK305 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBGMA305 .
RECODE SBGMK306 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBGMA306 .
RECODE SBGMK307 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBGMA307 .
RECODE SBGMK308 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBGMA308 .
EXECUTE .

* Als bij de voorlopervraag SBGMK301 niets is ingevuld, dan worden de vervolgvragen op missend (waarde 9) gezet .
IF missing (SBGMK301) SBGMA302 = 9 .
IF missing (SBGMK301) SBGMA303 = 9 .
IF missing (SBGMK301) SBGMA304 = 9 .
IF missing (SBGMK301) SBGMA305 = 9 .
IF missing (SBGMK301) SBGMA306 = 9 .
IF missing (SBGMK301) SBGMA307 = 9 .
IF missing (SBGMK301) SBGMA308 = 9 .
EXECUTE .

* Als de voorlopervraag SBGMK301 met ‘(Bijna) nooit’ / ‘Minder dan 1 dag per week’ / ‘1 dag per week’ / ‘2 of 3 dagen per week’ is beantwoord, dan worden de vervolgvragen op 'nvt' (waarde 8) gezet .
IF  (SBGMK301 >= 1 AND SBGMK301 <= 4) SBGMA302 = 8 .
IF  (SBGMK301 >= 1 AND SBGMK301 <= 4) SBGMA303 = 8 .
IF  (SBGMK301 >= 1 AND SBGMK301 <= 4) SBGMA304 = 8 .
IF  (SBGMK301 >= 1 AND SBGMK301 <= 4) SBGMA305 = 8 .
IF  (SBGMK301 >= 1 AND SBGMK301 <= 4) SBGMA306 = 8 .
IF  (SBGMK301 >= 1 AND SBGMK301 <= 4) SBGMA307 = 8 .
IF  (SBGMK301 >= 1 AND SBGMK301 <= 4) SBGMA308 = 8 .
EXECUTE.

VARIABLE LABELS 
  SBGMA302 'Hoe vaak moeilijk om met gamen te stoppen? (opgeschoond)'
  SBGMA303 'Hoe vaak zeggen anderen minder zou moeten gamen? (opgeschoond)'
  SBGMA304 'Hoe vaak liever gamen dan tijd met anderen? (opgeschoond)'
  SBGMA305 'Hoe vaak onrustig etc wanneer niet gamen? (opgeschoond)'
  SBGMA306 'Hoe vaak raffel je je huiswerk af omdat je wilt gamen? (opgeschoond)'
  SBGMA307 'Hoe vaak gamen omdat je je rot voelt? (opgeschoond)'
  SBGMA308 'Hoe vaak slaap te kort door gamen? (opgeschoond)' .
EXECUTE .

VALUE LABELS
  SBGMA302 SBGMA303 SBGMA304 SBGMA305 SBGMA306 SBGMA307 SBGMA308 0 'Nooit' 1 'Bijna nooit' 2 'Soms' 3 'Vaak' 4 'Zeer vaak' 8 'Nvt' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBGMA302 SBGMA303 SBGMA304 SBGMA305 SBGMA306 SBGMA307 SBGMA308 (F1.0) .
EXECUTE .

MISSING VALUES
  SBGMA302 SBGMA303 SBGMA304 SBGMA305 SBGMA306 SBGMA307 SBGMA308 (9) .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat risico loopt op problematisch gamen (obv 7 items; verkorte IVO-schaal plus slaap-item, verzwaard). 

COMPUTE SBGMK3S1 = mean.5 (SBGMA302,SBGMA303,SBGMA304,SBGMA305,SBGMA306,SBGMA307,SBGMA308) .
EXECUTE .

VARIABLE LABELS 
  SBGMK3S1 'Risico op problematisch gamen (obv 7 items), totaalscore' .
VALUE LABELS
  SBGMK3S1 8 'Nvt' 9 'Onbekend'.
EXECUTE .

IF missing (SBGMK3S1) SBGMK3S1 = 9 .
EXECUTE .

FORMATS
  SBGMK3S1 (F3.2) .
EXECUTE .

MISSING VALUES
  SBGMK3S1 (9) .
EXECUTE .

* Afkappunten: 0 t/m 2 is geen of weinig risico / > 2 t/m 4 is wel risico (vaker dan 'soms') (afkomstig van het IVO) .
* Als de voorlopervraag met ‘(Bijna) nooit’ / ‘Minder dan 1 dag per week’ / ‘1 dag per week’ / ‘2 of 3 dagen per week’ is beantwoord, wordt de indicator op 'geen risico' (waarde 0) gezet .
RECODE SBGMK3S1 (0 thru 2=0)(2.01 thru 4=1)(else=copy) into SBGMK3S2 .
IF (SBGMK3S1 = 8) SBGMK3S2 = 0 .
EXECUTE .

* Deze indicator 'verzwaren' door te stellen dat er positief (vaker dan 'soms') gescoord moet worden op minimaal één van de volgende items: SBGMK306 (huiswerk-item) en SBGMK308 (slaap-item) . 
* Hiertoe tijdelijke variabelen aanmaken: SBGMA306_d en SBGMA308_d .
* Indien zowel SBGMA306 als SBGMA308 missing zijn, maar op basis van de andere items is er een risico, dan SBGMK3S2 op missing zetten. Je weet dan niet of er verzwaard ook een risico is.
RECODE SBGMA306 (0,1,2,8=0)(3,4=1)(else=copy) into SBGMA306_d .
RECODE SBGMA308 (0,1,2,8=0)(3,4=1)(else=copy) into SBGMA308_d .
EXECUTE.

IF (SBGMA306_d = 0 and SBGMA308_d = 0) SBGMK3S2 = 0 .
IF (SBGMA306_d = 9 and  SBGMA308_d = 9 and SBGMK3S2=1) SBGMK3S2 = 9 .
EXECUTE.

VARIABLE LABELS 
 SBGMK3S2 'Risico op problematisch gamen (obv 7 items, verzwaard) in 2 klassen' .
EXECUTE .

VALUE LABELS
 SBGMK3S2 0 'Geen of weinig risico' 1 'Wel risico (vaker dan soms)' 9 'Onbekend' .
EXECUTE .

FORMATS
 SBGMK3S2 (F1.0) .
EXECUTE .

MISSING VALUES
 SBGMK3S2 (9) .
EXECUTE .

* Aanmaken indicator: % dat risico loopt op problematisch gamen (obv 6 items; zoals verkorte IVO-schaal).

COMPUTE SBGMK3S3 = mean.4 (SBGMA302,SBGMA303,SBGMA304,SBGMA305,SBGMA306,SBGMA307) .
EXECUTE .

VARIABLE LABELS
 SBGMK3S3 'Risico op problematisch gamen (obv 6 items; zoals IVO), totaalscore' .
VALUE LABELS
  SBGMK3S3 8 'Nvt' 9 'Onbekend'.
EXECUTE .

IF missing (SBGMK3S3) SBGMK3S3 = 9 .
EXECUTE .

FORMATS
 SBGMK3S3 (F3.2) .
EXECUTE .

MISSING VALUES
 SBGMK3S3 (9) .
EXECUTE .

* Afkappunten: 0 t/m 2 is geen of weinig risico / > 2 t/m 4 is wel risico (vaker dan soms) (afkomstig van het IVO) .
* Als de voorlopervraag met ‘(Bijna) nooit’ / ‘Minder dan 1 dag per week’ / ‘1 dag per week’ / ‘2 of 3 dagen per week’ is beantwoord, wordt de indicator op 'geen risico' (waarde 0) gezet .
RECODE SBGMK3S3 (0 thru 2=0)(2.01 thru 4=1)(else=copy) into SBGMK3S4 .
IF (SBGMK3S3 = 8) SBGMK3S4 = 0 .
EXECUTE .

VARIABLE LABELS 
 SBGMK3S4 'Risico op problematisch gamen (obv 6 items; zoals IVO) in 2 klassen' .
EXECUTE .

VALUE LABELS
 SBGMK3S4 0 'Geen of weinig risico' 1 'Wel risico (vaker dan soms)' 9 'Onbekend' .
EXECUTE .

FORMATS
 SBGMK3S4 (F1.0) .
EXECUTE .

MISSING VALUES
 SBGMK3S4 (9) .
EXECUTE .

*Aanmaken indicator: % dat huiswerk afraffelt om te gamen.
RECODE SBGMA306 (0 thru 2=0) (3 thru 4=1) (8=0) (else=copy) INTO SBGMK3S5.
EXECUTE.

VARIABLE LABELS 
 SBGMK3S5 'Raffelt (zeer) vaak huiswerk af om te gamen'.
EXECUTE .

VALUE LABELS
 SBGMK3S5 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
 SBGMK3S5 (F1.0) .
EXECUTE .

MISSING VALUES
 SBGMK3S5 (9) .
EXECUTE .

                      
*Aanmaken indicator: % dat slaap te kort komt door het gamen.
RECODE SBGMA308 (0 thru 2 =0) (3 thru 4=1) (8=0) (else=copy) INTO SBGMK3S6.
EXECUTE.

VARIABLE LABELS 
 SBGMK3S6 'Komt (zeer) vaak slaap te kort door het gamen'.
EXECUTE .

VALUE LABELS
 SBGMK3S6 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
 SBGMK3S6 (F1.0) .
EXECUTE .

MISSING VALUES
 SBGMK3S6 (9) .
EXECUTE .

* Tijdelijke tussenvariabelen verwijderen .
DELETE VARIABLES SBGMA306_d SBGMA308_d .
EXECUTE .

*** EINDE VAN DE SYNTAX ***

