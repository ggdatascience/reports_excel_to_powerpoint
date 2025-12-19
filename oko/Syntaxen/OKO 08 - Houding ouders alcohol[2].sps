* Encoding: UTF-8.


********************************************************************************************************
***Aangepast voor OKO 2025 . 
***Versie 4 / dec 2025 NdJ aangevuld met houding ouders voor diegenen die hebben aangegeven geen alcohol te drinken of alleen maar slokjes. 
***Variabele houding ouders (opgeschoonde versie) gerecodeerd in een 'logische' volgorde> Nieuwe variabele= LOAGKA318 (was LOAGKA316) en LOAGKA319 (was LOAGKA317). 
***En een samengevoegde variabele over de houding van ouders voor alle jongeren (geen drinkers, slokjes drinkers en heel glas of meer drinkers (a la vb van GGD GZ) OKO 13.
** Indicatorvariabele namen zijn veranderd : A ipv S en opnieuw genummerd.

***LOAGK3S16:% ouders dat het alcohol drinken van zijn/haar kind goed vindt (heel glas of meer) wordt in 2025 LOAGK3A16
***LOAGK3S17:% ouders dat vindt dat zijn/haar kind minder moet drinken (heel glas of meer) wordt in 2025 LOAGK3A17.
***LOAGK3S18:% ouders dat zijn/haar kind alcohol drinken afraadt (heel glas of meer) wordt in 2025 LOAGK3A18.
***LOAGK3S19:% ouders dat zijn/haar kind alcohol drinken verbiedt (heel glas of meer) wordt in 2025 LOAGK3A19.
***LOAGK3S20:% ouders dat niets zegt van het alcohol drinken van zijn/haar kind (heel glas of meer) wordt in 2025 LOAGK3A20.
***LOAGK3S21:% ouders dat niet weet dat zijn/haar kind alcohol drinkt (heel glas of meer) wordt in 2025 LOAGK3A21.
***LOAGK3S22:% ouders dat alcohol drinken goedkeurt of niets van zegt (heel glas of meer) wordt in 2025 LOAGK3A22.
***LOAGK3S23:% ouders dat alcohol drinken afkeurt of er niets van weet (heel glas of meer)  wordt in 2025 LOAGK3A23.
 

***LOAGK3S25:% ouders dat alcohol drinken van zijn/haar kind goed zou vinden (geen alcohol gedronken of slokjes) wordt in 2025 LOAGK3A25.
***LOAGK3S26:% ouders dat zijn/haar kind alcohol drinken zou afraden (geen alcohol gedronken of slokjes) wordt in 2025 LOAGK3A26.
***LOAGK3S27:% ouders dat zijn/haar kind alcohol drinken zou verbieden (geen alcohol gedronken of slokjes) wordt in 2025 LOAGK3A27.
***LOAGK3S28:% ouders dat niets zou zeggen van alcohol drinken van zijn/haar kind (geen alcohol gedronken of slokjes) wordt in 2025 LOAGK3A28.
***LOAGK3S29:% jongeren dat niet weet wat hun ouders zouden vinden als zij wel alcohol zouden drinken (geen alcohol gedronken of slokjes) wordt in 2025 LOAGK3A29.
***LOAGK3S30:% ouders dat alcohol drinken zou goedkeuren of niets van zou zeggen (geen alcohol gedronken of slokjes) wordt in 2025 LOAGK3A30.
***LOAGK3S31:% ouders dat alcohol drinken zou afkeuren (geen alcohol gedronken of slokjes)wordt in 2025 LOAGK3A31.

***alcoholoordeel_ouders_goed2: % ouders dat het alcohol drinken van zijn/haar kind goed vindt of er niets van zegt (van de jongeren die wel en niet hebben gedronken) .  

********************************************************************************************************

*** Syntax OKO Houding ouders Alcohol 2023
*** Versie 1 / 30 november 2022 Sander Vermeulen, 20-12-2022 aangepast Gea Schouten nvt op missing gezet
*** Versie 2 / 27 november 2023 Gea Schouten (naamgeving aangepast en in 2023 niet gevraagd naar wat ouders zouden vinden als kind alcohol zou drinken, vraagstelling verder niet gewijzigd)
*** Versie 3 / februari 2024 Lobke Kuijs (bij aanmaken van LOAGKA316 de missende waarden van LOAGK316 overnemen).


*** Naamgeving 2022:
*  LBAGK323 'Wat vinden je ouders/verzorgers ervan dat je alcohol drinkt?'
* Naamgeving 2022 aangemaakte indicatoren:
* LBAGK323S1: % ouders dat het alcohol drinken van zijn/haar kind goed vindt 
* LBAGK323S2:% ouders dat vindt dat zijn/haar kind minder moet drinken
* LBAGK323S3:% ouders dat zijn/haar kind alcohol drinken afraadt
* LBAGK323S4:% ouders dat zijn/haar kind alcohol drinken verbiedt
* LBAGK323S5:% ouders dat niets zegt van het alcohol drinken van zijn/haar kind
* LBAGK323S6:% ouders dat niet weet dat zijn/haar kind alcohol drinkt
* LBAGK323S7:% ouders dat alcohol drinken goedkeurt of niets van zegt
* LBAGK323S8:% ouders datalcohol drinken afkeurt of er niets van weet   

*** Contactpersoon: Frouwke Veenstra
********************************************************************************************************
 ***Gezondheidsmonitor Jeugd 2023
********************************************************************************************************
***deze syntax runnen na  Alcoholgebruik-1219-vragenlijst-kind-basis
*** LET OP: in deze syntax worden alleen de indicatoren gemaakt voor de jongeren die ooit
*** een heel glas hebben gedronken. GGD' en die ook de slokjesdrinkers de alcoholvervolgvragen
*** hebben laten invullen, zullen voor slokjesdrinkers zelf de indicatoren moeten maken.
*** in 2025 aangevuld met jongeren die nooit hebben gedronken (naar voorbeeld van Gea Schouten (OKO 2024)).

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT:

***LOAGK3S16:% ouders dat het alcohol drinken van zijn/haar kind goed vindt (heel glas of meer)
***LOAGK3S17:% ouders dat vindt dat zijn/haar kind minder moet drinken (heel glas of meer)
***LOAGK3S18:% ouders dat zijn/haar kind alcohol drinken afraadt (heel glas of meer)
***LOAGK3S19:% ouders dat zijn/haar kind alcohol drinken verbiedt (heel glas of meer)
***LOAGK3S20:% ouders dat niets zegt van het alcohol drinken van zijn/haar kind (heel glas of meer)
***LOAGK3S21:% ouders dat niet weet dat zijn/haar kind alcohol drinkt (heel glas of meer)
***LOAGK3S22:% ouders dat alcohol drinken goedkeurt of niets van zegt (heel glas of meer)
***LOAGK3S23:% ouders dat alcohol drinken afkeurt of er niets van weet (heel glas of meer)


***LOAGK3S25:% ouders dat alcohol drinken van zijn/haar kind goed zou vinden (geen alcohol gedronken of slokje)
***LOAGK3S26:% ouders dat zijn/haar kind alcohol drinken zou afraden (geen alcohol gedronken of slokje)
***LOAGK3S27:% ouders dat zijn/haar kind alcohol drinken zou verbieden (geen alcohol gedronken of slokje)
***LOAGK3S28:% ouders dat niets zou zeggen van alcohol drinken van zijn/haar kind (geen alcohol gedronken of slokje)
***LOAGK3S29:% jongeren dat niet weet wat hun ouders zouden vinden als zij wel alcohol zouden drinken (geen alcohol gedronken of slokje)
***LOAGK3S30:% ouders dat alcohol drinken zou goedkeuren of niets van zou zeggen (geen alcohol gedronken of slokje)
***LOAGK3S31:% ouders dat alcohol drinken zou afkeuren (geen alcohol gedronken of slokje)

***alcoholoordeel_ouders_goed2: % ouders dat het alcohol drinken van zijn/haar kind goed vindt of er niets van zegt (van de jongeren die wel en niet hebben gedronken) .  

   
*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***
   
*** LOAGK316 'Wat vinden je ouders/verzorgers ervan dat je alcohol drinkt?'. Voor de heel glas of meer alcoholdrinkers.
*** LOAGK317 'Wat zouden je ouders/verzorgers ervan vinden als jij wel alcohol zou drinken?'.  Voor de slokjes drinkers of diegene die hebben aangegeven geen alcohol te drinken.

VARIABLE LABELS 
  LOAGK316 'Wat vinden je ouders/verzorgers ervan dat je alcohol drinkt?'
  LOAGK317 'Wat zouden je ouders/verzorgers ervan vinden als jij wel alcohol zou drinken?'.
VALUE LABELS
  LOAGK316 1 'Ze vinden het goed' 2 'Ze vinden dat ik minder alcohol zou moeten drinken' 3 'Ze raden het af' 4 'Ze verbieden het' 
      5 'Ze zeggen er niets van' 6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend'/
  LOAGK317 1 'Ze zouden het goed vinden' 2 'Ze zouden het afraden' 3 'Ze zouden het verbieden' 4 'Ze zouden er niets van zeggen' 
     5 'Dat weet ik niet'  8 'Nvt' 9 'Onbekend'.
FORMATS
 LOAGK316 LOAGK317 (F1.0) .
MISSING VALUES
LOAGK316 LOAGK317(9) .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (LOAGK316) LOAGK316= 9 .
IF missing (LOAGK317) LOAGK317= 9 .
EXECUTE .

* Op basis van de voorlopervraag LBAGK391 de vervolgvraag LOAGK316 en LOAGK317 opschonen .
* Hiertoe een nieuwe variabele voor de vervolgvragen aanmaken: LOAGKA316 .
COMPUTE LOAGKA316 = LOAGK316.
COMPUTE LOAGKA317 = LOAGK317.
 EXECUTE .

* Als bij de voorlopervraag LBAGK391 niets is ingevuld, dan worden de vervolgvragen op missend (waarde 9) gezet .
IF missing (LBAGK391) LOAGKA316 = 9 .
IF missing (LBAGK391) LOAGKA317 = 9 .
EXECUTE .

* Afhankelijk van antwoord op de voorlopervraag LOAGK391 worden de vervolgvragen opgeschoond .
* Alleen kinderen meenemen die ooit een heel glas hebben gedronken, indien niet dan LOAGKA316 op 'nvt' (waarde 8) gezet .
* LOAGK317 is alleen ingevuld door kinderen die hebben aangegeven geen alcohol te drinken of aleen slokjes, anders LOAGKA317 op 'nvt' zetten.

VARIABLE LABELS 
  LOAGKA316 'Wat vinden je ouders/verzorgers ervan dat je alcohol drinkt? (opgeschoond, heel glas of meer)'
  LOAGKA317 'Wat zouden je ouders/verzorgers ervan vinden als jij wel alcohol zou drinken? (opgeschoond, slokje of geen alcohol)' .
VALUE LABELS
  LOAGKA316 1 'Ze vinden het goed' 2 'Ze vinden dat ik minder alcohol zou moeten drinken' 3 'Ze raden het af' 4 'Ze verbieden het' 
      5 'Ze zeggen er niets van' 6 'Ze weten het niet' 8 'Nvt' 9 'Onbekend'/
  LOAGKA317 1 'Ze zouden het goed vinden' 2 'Ze zouden het afraden' 3 'Ze zouden het verbieden' 4 'Ze zouden er niets van zeggen' 
     5 'Dat weet ik niet'  8 'Nvt' 9 'Onbekend'.
FORMATS
  LOAGKA316 LOAGKA317 (F1.0) .
MISSING VALUES
  LOAGKA316 LOAGKA317(8, 9).
EXECUTE .

**Recoden opgeschoonde variabelen LOAGKA316 en LOAGKA317 in LOAGKA318 en LOAGKA319.

RECODE LOAGKA316 (1=1) (5=2) (2=3) (3=4) ( 4=5) (6=6) (ELSE=COPY)  INTO LOAGKA318.
RECODE LOAGKA317 (1=1) (4=2) (2=3) (3=4) ( 5=5) (ELSE=COPY)  INTO LOAGKA319.

VARIABLE LABELS 
  LOAGKA318 'Wat vinden je ouders/verzorgers ervan dat je alcohol drinkt? (opgeschoond, heel glas of meer, gerecoded)'
  LOAGKA319 'Wat zouden je ouders/verzorgers ervan vinden als jij wel alcohol zou drinken? (opgeschoond, slokje of geen alcohol, gerecoded)' .
VALUE LABELS
  LOAGKA318 1 'Ze vinden het goed' 2 'Ze zeggen er niets van' 3 'Ze vinden dat ik minder alcohol zou moeten drinken' 4 'Ze raden het af' 5 'Ze verbieden het' 
   6 'Ze weten het niet'  8 'Nvt' 9 'Onbekend'/
  LOAGKA319 1 'Ze zouden het goed vinden' 2 'Ze zouden er niets van zeggen'  3 'Ze zouden het afraden' 4 'Ze zouden het verbieden' 5 'Dat weet ik niet'  8 'Nvt' 9 'Onbekend'.
FORMATS
  LOAGKA318 LOAGKA319 (F1.0) .
MISSING VALUES
  LOAGKA318 LOAGKA319 (8,9).
EXECUTE .
 
*** STAP 2: INDICATOREN AANMAKEN ***(van de kinderen die ooit een glas hebben gedronken)

***LOAGK3A16: % ouders dat het alcohol drinken van zijn/haar kind goed vindt  .

RECODE LOAGKA316 (1=1)(2=0)(3=0) (4=0) (5=0) (6=0) (else=copy) into LOAGK3A16 .
EXECUTE .

VARIABLE LABELS 
  LOAGK3A16 'Ouders vinden het alcohol drinken van zijn/haar kind goed (heel glas of meer)' .
VALUE LABELS 
  LOAGK3A16 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A16 (F1.0) .
MISSING VALUES
  LOAGK3A16 (8,9) .
EXECUTE .

***LOAGK3A2:% ouders dat vindt dat zijn/haar kind minder moet drinken.
RECODE  LOAGKA316 (1=0)(2=1)(3=0) (4=0) (5=0) (6=0) (else=copy) into LOAGK3A17.
EXECUTE .

VARIABLE LABELS 
 LOAGK3A17  'Ouders vinden dat zijn/haar kind minder alcohol zou moeten drinken (heel glas of meer)' .
VALUE LABELS 
  LOAGK3A17 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
LOAGK3A17 (F1.0) .
MISSING VALUES
  LOAGK3A17 (8,9) .
EXECUTE.

***LOAGK3A3:% ouders dat zijn/haar kind alcohol drinken afraadt.
RECODE LOAGKA316 (1=0)(2=0)(3=1) (4=0) (5=0) (6=0) (else=copy) into LOAGK3A18 .
EXECUTE .

VARIABLE LABELS 
  LOAGK3A18 'Ouders raden zijn/haar kind alcohol drinken af (heel glas of meer)' .
VALUE LABELS 
  LOAGK3A18 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A18 (F1.0) .
MISSING VALUES
  LOAGK3A18 (8,9) .
EXECUTE .

***LOAGK3A4:% ouders dat zijn/haar kind alcohol drinken verbiedt.
RECODE LOAGKA316 (1=0)(2=0)(3=0) (4=1) (5=0) (6=0) (else=copy) into LOAGK3A19 .
EXECUTE .

VARIABLE LABELS 
  LOAGK3A19 'Ouders verbieden zijn/haar kind alcohol te drinken (heel glas of meer)' .
VALUE LABELS 
  LOAGK3A19 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
LOAGK3A19 (F1.0) .
MISSING VALUES
 LOAGK3A19 (8,9) .
EXECUTE .

***LOAGK3A5:% ouders dat niets zegt van het alcohol drinken van zijn/haar kind.
RECODE LOAGKA316 (1=0)(2=0)(3=0) (4=0) (5=1) (6=0) (else=copy) into LOAGK3A20 .
EXECUTE .

VARIABLE LABELS 
 LOAGK3A20 'Ouders zeggen niets van het alcohol drinken van zijn/haar kind (heel glas of meer)' .
VALUE LABELS 
   LOAGK3A20 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
   LOAGK3A20 (F1.0) .
MISSING VALUES
 LOAGK3A20 (8,9) .
EXECUTE .

***LOAGK3A6:% ouders dat niet weet dat zijn/haar kind alcohol drinkt.
RECODE LOAGKA316 (1=0)(2=0)(3=0) (4=0) (5=0) (6=1) (else=copy) into LOAGK3A21 .
EXECUTE .

VARIABLE LABELS 
LOAGK3A21 'Ouders weten niet dat zijn/haar kind alcohol drinkt (heel glas of meer)' .
VALUE LABELS 
LOAGK3A21 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A21 (F1.0) .
MISSING VALUES
  LOAGK3A21 (8,9) .
EXECUTE .

***LOAGK3A7:% ouders dat alcohol drinken goedkeurt of niets van zegt.
RECODE LOAGKA316  (1=1)(2=0)(3=0) (4=0) (5=1) (6=0) (else=copy) into LOAGK3A22 .
EXECUTE .

VARIABLE LABELS 
LOAGK3A22 'Ouders dat alcohol drinken goedkeurt of niets van zegt (heel glas of meer)' .
VALUE LABELS 
  LOAGK3A22 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A22 (F1.0) .
MISSING VALUES
  LOAGK3A22 (8,9) .
EXECUTE .

**LOAGK3A8:% ouders dat alcohol drinken afkeurt of er niets van weet.   
RECODE LOAGKA316 (1=0)(2=1)(3=1) (4=1) (5=0) (6=1) (else=copy) into LOAGK3A23.
EXECUTE .

VARIABLE LABELS 
  LOAGK3A23 'Ouders dat alcohol drinken afkeurt of er niets van weet (heel glas of meer)' .
VALUE LABELS 
  LOAGK3A23 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
LOAGK3A23 (F1.0) .
MISSING VALUES
 LOAGK3A23 (8,9) .
EXECUTE .



***********************************************************************************************************************************************************************************.
*** Vervolg STAP 2: INDICATOREN AANMAKEN ***(van de kinderen die geen alcohol hebben gedronken of slokjes)

***LOAGK3A9: % ouders dat het alcohol drinken van zijn/haar kind zou goed vinden  .

RECODE LOAGKA317 (1=1)(2=0)(3=0) (4=0) (5=0) (else=copy) into LOAGK3A25.
EXECUTE .

VARIABLE LABELS 
  LOAGK3A25 'Ouders zouden het alcohol drinken van zijn/haar kind goed vinden (geen alcohol gedronken of slokje)'.
VALUE LABELS 
  LOAGK3A25 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A25 (F1.0) .
MISSING VALUES
  LOAGK3A25 (8,9) .
EXECUTE .


***LOAGK3A10:% ouders dat zijn/haar kind alcohol drinken zou afraden.
RECODE LOAGKA317 (1=0)(2=1)(3=0) (4=0) (5=0) (else=copy) into LOAGK3A26 .
EXECUTE .

VARIABLE LABELS 
  LOAGK3A26 'Ouders zouden zijn/haar kind alcohol drinken afraden (geen alcohol gedronken of slokje)'.
VALUE LABELS 
  LOAGK3A26 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A26 (F1.0) .
MISSING VALUES
  LOAGK3A26 (8,9) .
EXECUTE .

***LOAGK3A11:% ouders dat zijn/haar kind alcohol drinken zou verbieden.
RECODE LOAGKA317 (1=0)(2=0)(3=1) (4=0) (5=0) (else=copy) into LOAGK3A27.
EXECUTE .

VARIABLE LABELS 
  LOAGK3A27 'Ouders zouden zijn/haar kind alcohol drinken verbieden (geen alcohol gedronken of slokje)'.
VALUE LABELS 
  LOAGK3A27 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
LOAGK3A27 (F1.0) .
MISSING VALUES
 LOAGK3A27 (8,9) .
EXECUTE .

***LOAGK3A12:% ouders dat niets zou zeggen van het alcohol drinken van zijn/haar kind.
RECODE LOAGKA317 (1=0)(2=0)(3=0) (4=1) (5=0) (else=copy) into LOAGK3A28.
EXECUTE .

VARIABLE LABELS 
 LOAGK3A28 'Ouders zouden niets zeggen van het alcohol drinken van zijn/haar kind (geen alcohol gedronken of slokje)'.
VALUE LABELS 
   LOAGK3A28 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
   LOAGK3A28 (F1.0) .
MISSING VALUES
 LOAGK3A28 (8,9) .
EXECUTE .

***LOAGK3A13:% jongeren dat niet weet wat hun ouders ervan  zouden vinden als ze wel alcohol zouden drinken.
RECODE LOAGKA317 (1=0)(2=0)(3=0) (4=0) (5=1) (else=copy) into LOAGK3A29 .
EXECUTE .

VARIABLE LABELS 
LOAGK3A29 'Jongeren dat niet weet wat hun ouders ervan zouden vinden als ze wel alcohol zouden drinken (geen alcohol gedronken of slokje)'.
VALUE LABELS 
LOAGK3A29 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A29 (F1.0) .
MISSING VALUES
  LOAGK3A29 (8,9) .
EXECUTE .

***LOAGK3A14:% ouders dat alcohol drinken zou goedkeuren of er niets van zou zeggen.
RECODE LOAGKA317 (1=1) (2=0)(3=0) (4=1) (5=0) (else=copy) into LOAGK3A30.
EXECUTE .

VARIABLE LABELS 
LOAGK3A30 'Ouders dat alcohol drinken zou goedkeuren of er niets van zou zeggen (geen alcohol gedronken of slokje)'.
VALUE LABELS 
  LOAGK3A30 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
  LOAGK3A30 (F1.0) .
MISSING VALUES
  LOAGK3A30 (8,9) .
EXECUTE .

**LOAGK3A31:% ouders dat alcohol drinken zou afkeuren.   
RECODE LOAGKA317 (1=0)(2=1)(3=1) (4=0) (5=0) (else=copy) into LOAGK3A31 .
EXECUTE .

VARIABLE LABELS 
  LOAGK3A31 'Ouders dat alcohol drinken zou afraden/verbieden (geen alcohol gedronken of slokje)'.
VALUE LABELS 
  LOAGK3A31 0 'Nee' 1 'Ja' 8 'Nvt' 9 'Onbekend' .
FORMATS
LOAGK3A31 (F1.0) .
MISSING VALUES
 LOAGK3A31 (8,9) .
EXECUTE .

*** EXTRA SYNTAX ***
  
***alcoholoordeel_ouders_goed2: % ouders dat het alcohol drinken van zijn/haar kind goed vindt of er niets van zegt (van de jongeren wel en niet hebben gedronken) .  

COMPUTE alcoholoordeel_ouders2=9.
if (  LOAGK316=1) or (LOAGKA317=1) alcoholoordeel_ouders2=1.
if (  LOAGK316=5) or (LOAGKA317=4) alcoholoordeel_ouders2=2.
if (  LOAGK316=2) or (LOAGK316=3) or (LOAGKA317=2) alcoholoordeel_ouders2=3.
if (  LOAGK316=4) or (LOAGKA317=3) alcoholoordeel_ouders2 =4.
if (  LOAGK316=6) or (LOAGKA317=5) alcoholoordeel_ouders2=5.
EXECUTE.

VARIABLE LABELS alcoholoordeel_ouders2 'Mening van ouders over alcohol (heel glas&slokjes drinkers en geen drinkers)'.
VALUE LABELS alcoholoordeel_ouders2 1 'Goed vinden' 2 'Niets over zeggen' 3 'Minderen/afraden' 4 'Verbieden' 5 'Weet niet' 9 'onbekend'.
FORMATS  alcoholoordeel_ouders2 (F1.0).
MISSING VALUES alcoholoordeel_ouders2 (9).
EXECUTE.

RECODE alcoholoordeel_ouders2 (1=1)(2=1)(3=0) (4=0) (5=0) (else=copy) into alcoholoordeel_ouders_goed2.
EXECUTE .

VARIABLE LABELS 
alcoholoordeel_ouders_goed2 'Ouders vinden het alcohol drinken van zijn/haar kind goed of zeggen er niets van (drinkers en niet-drinkers inclusief slokjes drinkers)' .
VALUE LABELS 
alcoholoordeel_ouders_goed2 0 'Nee' 1 'Ja'  9 'Onbekend' .
FORMATS
alcoholoordeel_ouders_goed2 (F1.0) .
MISSING VALUES
alcoholoordeel_ouders_goed2 (9) .
EXECUTE .


***EINDE SYNTAX
