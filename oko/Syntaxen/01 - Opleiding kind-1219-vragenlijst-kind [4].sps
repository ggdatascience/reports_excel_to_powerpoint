* Encoding: UTF-8.
********************************************************************************************************
*** Basisstandaard Opleiding kind (GM Jeugd)-1219-vragenlijst-kind .
*** Versie 4 / augustus 2025
*** Standaard vastgesteld op ???.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl	.
********************************************************************************************************

*** Wijzigingen tov versie 3.2:
* In 2025 is de vraag over soort onderwijs uitgebreid met de optie 'praktijkonderwijs', wat betekent dat er een variabele (MBOKK339) bijkomt.

*** Wijzigingen tov versie 3.1:
*Stap 0 uit 2019 volledig verwijderd ten behoeve van overzichtelijkheid van de syntax. 
*Variable labels in stap 1 aangepast conform codeboek. 
*In regel 104 t/m 113 aan de opschoning "AND (MBOKK33... = 1)" toegevoegd, zodat 9 (missing) niet wordt herschreven naar 2. 

***Wijzigingen tov vorige versie (versie 2):
* Wijzigingen die in 2019 waren doorgevoerd in verband met tool Formdesk verwijderd uit de syntax, omdat er in 2021 met een andere tool wordt gewerkt, waarbij de antwoorden wel direct als aparte variabelen zijn geprogrammeerd.
* Definiëren van missings is aangepast conform andere meerkeuzevragen.

*** Wijzigingen tov syntax Opleiding kind (GM Jeugd)-1219-vragenlijst-kind (regulier vo) - versie 1 / 1 december 2015: .
* Vanwege nieuwe tool Formdesk ipv www.monitorgezondheid.nl, variabele MBOKK341 toegevoegd en omgezet naar de variabelen per antwoordcategorie zoals in de GM Jeugd 2015 .
* Extra opschoonstap toegevoegd, namelijk: .
* Op basis van de vraag naar klas/leerjaar de antwoorden MBOKK332 t/m MBOKK336 bij de vraag naar soort onderwijs opschonen: .
* Als bij de vraag 'In welke klas/leerjaar zit je?' 5 of 6 is ingevuld, dan worden de antwoorden MBOKK332 t/m MBOKK335 (vmbo) op 'niet aangekruist' (waarde 2) gezet .  
* Als bij de vraag 'In welke klas/leerjaar zit je?' 6 is ingevuld, dan wordt het antwoord MBOKK336 (havo) op 'niet aangekruist' (waarde 2) gezet .  
* Hiertoe nieuwe variabelen voor de antwoorden aangemaakt: MBOKA332 t/m MBOKA336. Deze variabelen vervolgens ook gebruikt bij het aanmaken van de indicatoren, ipv MBOKK332 t/m MBOKK336 .

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** KLAS: Leerjaar in 3 categorieën .
*** MBOKK3S31: % dat vmbo volgt; % dat havo/vwo volgt .
*** MBOKK3S32: % dat vmbo volgt; % dat havo volgt; % dat vwo volgt .
*** MBOKK3S33: % dat vmbo-bk volgt; % dat vmbo-gt volgt; % dat havo volgt; % dat vwo volgt .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  MBOKK331  'In welke klas/leerjaar zit je?' 
  MBOKK332  'Vmbo-b (basis)'
  MBOKK333  'Vmbo-k (kader)'
  MBOKK334  'Vmbo-g (gemengd)'
  MBOKK335  'Vmbo-t (theoretisch, mavo)'
  MBOKK336  'Havo'
  MBOKK337  'Vwo (atheneum, gymnasium)'
  MBOKK338  'Ander soort onderwijs'
  MBOKK339  'Praktijkonderwijs'.
EXECUTE. 

VALUE LABELS 
  MBOKK331 1 '1' 2 '2' 3 '3' 4 '4' 5 '5' 6 '6' 9 'Onbekend'/
  MBOKK332 MBOKK333 MBOKK334 MBOKK335 MBOKK336 MBOKK337 MBOKK338 MBOKK339 1 'Aangekruist' 2 'Niet aangekruist' 9 'Onbekend' . 
EXECUTE .

FORMATS
  MBOKK331 MBOKK332 MBOKK333 MBOKK334 MBOKK335 MBOKK336 MBOKK337 MBOKK338 MBOKK339 (F1.0) .
EXECUTE .

MISSING VALUES
  MBOKK331 MBOKK332 MBOKK333 MBOKK334 MBOKK335 MBOKK336 MBOKK337 MBOKK338 MBOKK339 (9) .
EXECUTE .

*** Als er niets is ingevuld, dan krijgt de variabele de waarde 9 (onbekend) ***.
*** Als er niets is ingevuld bij de meerkeuze-items, dan krijgt de variabele de waarde 2 (niet aangekruist)***.
IF missing (MBOKK331) MBOKK331 = 9 .
IF missing (MBOKK332) MBOKK332 = 2 .
IF missing (MBOKK333) MBOKK333 = 2 .
IF missing (MBOKK334) MBOKK334 = 2 .
IF missing (MBOKK335) MBOKK335 = 2 .
IF missing (MBOKK336) MBOKK336 = 2 .
IF missing (MBOKK337) MBOKK337 = 2 .
IF missing (MBOKK338) MBOKK338 = 2 .
IF missing (MBOKK339) MBOKK339 = 2 .
EXECUTE .

* Als bij de vraag 'Welk soort onderwijs volg je?' bij geen enkele antwoordcategorie iets is ingevuld, dan krijgen de variabelen de waarde 9 .
* Hiertoe eerst het aantal keren 'niet aangekruist' (waarde 2) optellen bij álle antwoordcategorieën (bij MBOKK332 t/m MBOKK339) . 

COUNT anee1 = MBOKK332 MBOKK333 MBOKK334 MBOKK335 MBOKK336 MBOKK337 MBOKK338 MBOKK339 (2) .
EXECUTE .

IF (anee1=8) MBOKK332 = 9 .
IF (anee1=8) MBOKK333 = 9 .
IF (anee1=8) MBOKK334 = 9 .
IF (anee1=8) MBOKK335 = 9 .
IF (anee1=8) MBOKK336 = 9 .
IF (anee1=8) MBOKK337 = 9 .
IF (anee1=8) MBOKK338 = 9 .
IF (anee1=8) MBOKK339 = 9 .
EXECUTE .

* Op basis van de vraag naar klas/leerjaar de antwoorden MBOKK332 t/m MBOKK336 bij de vraag naar soort onderwijs opschonen .

* Hiertoe nieuwe variabelen voor de antwoorden aanmaken: MBOKA332 t/m MBOKA336 .
COMPUTE MBOKA332 = MBOKK332 .
COMPUTE MBOKA333 = MBOKK333 .
COMPUTE MBOKA334 = MBOKK334 .
COMPUTE MBOKA335 = MBOKK335 .
COMPUTE MBOKA336 = MBOKK336 .
EXECUTE .

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (MBOKK332) MBOKA332 = 9 .
IF missing (MBOKK333) MBOKA333 = 9 .
IF missing (MBOKK334) MBOKA334 = 9 .
IF missing (MBOKK335) MBOKA335 = 9 .
IF missing (MBOKK336) MBOKA336 = 9 .
EXECUTE .

* Als bij de vraag 'In welke klas/leerjaar zit je?' 5 of 6 is ingevuld, dan worden de antwoorden MBOKK332 t/m MBOKK335 (vmbo) op 'niet aangekruist' (waarde 2) gezet .  
IF ((MBOKK331 = 5 or MBOKK331 = 6) AND (MBOKK332 = 1)) MBOKA332 = 2 .
IF ((MBOKK331 = 5 or MBOKK331 = 6) AND (MBOKK333 = 1)) MBOKA333 = 2 .
IF ((MBOKK331 = 5 or MBOKK331 = 6) AND (MBOKK334 = 1)) MBOKA334 = 2 .
IF ((MBOKK331 = 5 or MBOKK331 = 6) AND (MBOKK335 = 1)) MBOKA335 = 2 .
EXECUTE .

* Als bij de vraag 'In welke klas/leerjaar zit je?' 6 is ingevuld, dan wordt het antwoord MBOKK336 (havo) op 'niet aangekruist' (waarde 2) gezet .  
IF ((MBOKK331 = 6) AND (MBOKK336 = 1)) MBOKA336 = 2 .
EXECUTE .

VARIABLE LABELS 
  MBOKA332 'Vmbo-b (basis) (opgeschoond)'
  MBOKA333 'Vmbo-k (kader) (opgeschoond)'
  MBOKA334 'Vmbo-g (gemengd) (opgeschoond)'
  MBOKA335 'Vmbo-t (theoretisch, mavo) (opgeschoond)'
  MBOKA336 'Havo (opgeschoond)' .
EXECUTE .

VALUE LABELS 
  MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 1 'Aangekruist' 2 'Niet aangekruist' 9 'Onbekend' . 
EXECUTE .

FORMATS
  MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 (F1.0) .
EXECUTE .

MISSING VALUES
  MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 (9) .
EXECUTE .

* Als bij de vraag 'Welk soort onderwijs volg je?' bij geen enkele opgeschoonde antwoordcategorie iets is ingevuld, dan krijgen de variabelen de waarde 9 .
* Hiertoe eerst het aantal keren 'niet aangekruist' (waarde 2) optellen bij álle antwoordcategorieën (bij MBOKA332 t/m MBOKA336 en MBOKK337 t/m MBOKK339) . 

COUNT anee2 = MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 MBOKK337 MBOKK338 MBOKK339 (2) .
EXECUTE .

IF (anee2=8) MBOKA332 = 9 .
IF (anee2=8) MBOKA333 = 9 .
IF (anee2=8) MBOKA334 = 9 .
IF (anee2=8) MBOKA335 = 9 .
IF (anee2=8) MBOKA336 = 9 .
IF (anee2=8) MBOKK337 = 9 .
IF (anee2=8) MBOKK338 = 9 .
IF (anee2=8) MBOKK339 = 9 .
EXECUTE .

FREQUENCIES MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 MBOKK337 MBOKK338 MBOKK339.

* Tijdelijke tussenvariabele verwijderen .

DELETE VARIABLES anee1 anee2 .
EXECUTE .

*** STAP 2: INDICATOR AANMAKEN ***

* Aanmaken indicator: Klas:% dat in klas 2 zit; % dat in klas 4 zit .

RECODE MBOKK331  (1=0)(2=1)(3=0)(4=2)(5=0) (6=0)(else=copy) into KLAS.
EXECUTE .

VARIABLE LABELS 
  KLAS 'Leerjaar in 3 cat' .
EXECUTE .
  
VALUE LABELS
  KLAS 0 'Ander leerjaar' 1 'Klas 2' 2 'Klas 4' 9 'Onbekend' .
EXECUTE .

FORMATS
  KLAS (F1.0) .
EXECUTE .

MISSING VALUES
  KLAS (9) .
EXECUTE .

* Voor het aanmaken van de indicatoren MBOKK3S31 t/m MBOKK3S33 eerst een aantal tussenvariabelen berekenen:
* het aantal keren 'aangekruist' (waarde 1) optellen bij vmbo (MBOKA332 t/m MBOKA335) .
* het aantal keren 'aangekruist' (waarde 1) optellen bij vmbo/havo (MBOKA332 t/m MBOKA336) .
* het aantal keren 'aangekruist' (waarde 1) optellen bij vmbo/havo/vwo (MBOKA332 t/m MBOKA336 en MBOKK337) .
* het aantal keren 'aangekruist' (waarde 1) optellen bij vmbo-b/vmbo-k (MBOKA332 t/m MBOKA333) .
* Opmerking: bij gecombineerde klassen wordt er afgerond naar beneden; .
* ofwel als jongeren bijv. zowel vmbo als havo hebben aangekruist (omdat ze in een gecombineerde klas zitten), dan worden deze jongeren bij vmbo ingedeeld .
* Opmerking: deze keuze lijkt te worden ondersteund door cijfers van CBS over doorstroom van klas 3 naar klas 4. Over doorstroom van klas 2 naar klas 3 zijn geen cijfers gepubliceerd op Statline. 
* Het gaat bovendien om een beperkt percentage leerlingen met een dubbel onderwijsniveau.

COUNT avmbo = MBOKA332 MBOKA333 MBOKA334 MBOKA335 (1) .
COUNT avmbohavo = MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 (1) .
COUNT avmbohavovwo = MBOKA332 MBOKA333 MBOKA334 MBOKA335 MBOKA336 MBOKK337 (1) .
COUNT avmbobk = MBOKA332 MBOKA333 (1) .
EXECUTE .

* Aanmaken indicator: % dat vmbo volgt; % dat havo/vwo volgt .

COMPUTE MBOKK3S31 = 9 .
IF (MBOKA332 = 1) MBOKK3S31 = 1 .
IF (MBOKA333 = 1) MBOKK3S31 = 1 .
IF (MBOKA334 = 1) MBOKK3S31 = 1 .
IF (MBOKA335 = 1) MBOKK3S31 = 1 .
IF (MBOKA336 = 1 and avmbo = 0) MBOKK3S31 = 2 .
IF (MBOKK337 = 1 and avmbo = 0) MBOKK3S31 = 2 .
IF (MBOKK338 = 1 and avmbohavovwo = 0) MBOKK3S31 = 8 .
IF (MBOKK339 = 1 and avmbohavovwo = 0) MBOKK3S31 = 8 .
EXECUTE .

VARIABLE LABELS 
  MBOKK3S31 'Onderwijssoort in 2 groepen' .
EXECUTE .

VALUE LABELS 
  MBOKK3S31 1 'Vmbo' 2 'Havo/Vwo' 8 'Ander onderwijs' 9 'Onbekend' .
EXECUTE .

FORMATS
  MBOKK3S31 (F1.0) .
EXECUTE .

MISSING VALUES
  MBOKK3S31 (8,9) .
EXECUTE .

* Aanmaken indicator: % dat vmbo volgt; % dat havo volgt, % dat vwo volgt .

COMPUTE MBOKK3S32 = 9 .
IF (MBOKA332 = 1) MBOKK3S32 = 1 .
IF (MBOKA333 = 1) MBOKK3S32 = 1 .
IF (MBOKA334 = 1) MBOKK3S32 = 1 .
IF (MBOKA335 = 1) MBOKK3S32 = 1 .
IF (MBOKA336 = 1 and avmbo = 0) MBOKK3S32 = 2 .
IF (MBOKK337 = 1 and avmbohavo = 0) MBOKK3S32 = 3 .
IF (MBOKK338 = 1 and avmbohavovwo = 0) MBOKK3S32 = 8 .
IF (MBOKK339 = 1 and avmbohavovwo = 0) MBOKK3S32 = 8 .
EXECUTE .

VARIABLE LABELS 
  MBOKK3S32 'Onderwijssoort in 3 groepen' .
EXECUTE .

VALUE LABELS 
  MBOKK3S32 1 'Vmbo' 2 'Havo' 3 'Vwo' 8 'Ander onderwijs' 9 'Onbekend' .
EXECUTE .

FORMATS
  MBOKK3S32 (F1.0) .
EXECUTE .

MISSING VALUES
  MBOKK3S32 (8,9) .
EXECUTE .

* Aanmaken indicator: % dat vmbo-bk volgt; % dat vmbo-gt volgt; % dat havo volgt, % dat vwo volgt .

COMPUTE MBOKK3S33 = 9 .
IF (MBOKA332 = 1) MBOKK3S33 = 1 .
IF (MBOKA333 = 1) MBOKK3S33 = 1 .
IF (MBOKA334 = 1 and avmbobk = 0) MBOKK3S33 = 2 .
IF (MBOKA335 = 1 and avmbobk = 0) MBOKK3S33 = 2 .
IF (MBOKA336 = 1 and avmbo = 0) MBOKK3S33 = 3 .
IF (MBOKK337 = 1 and avmbohavo = 0) MBOKK3S33 = 4 .
IF (MBOKK338 = 1 and avmbohavovwo = 0) MBOKK3S33 = 8 .
IF (MBOKK339 = 1 and avmbohavovwo = 0) MBOKK3S33 = 8 .
EXECUTE .

VARIABLE LABELS 
  MBOKK3S33 'Onderwijssoort in 4 groepen' .
EXECUTE .

VALUE LABELS 
  MBOKK3S33 1 'Vmbo-bk' 2 'Vmbo-gt' 3 'Havo' 4 'Vwo' 8 'Ander onderwijs' 9 'Onbekend' .
EXECUTE .

FORMATS
  MBOKK3S33 (F1.0) .
EXECUTE .

MISSING VALUES
  MBOKK3S33 (8,9) .
EXECUTE .

* Tijdelijke tussenvariabelen verwijderen .

DELETE VARIABLES avmbo avmbohavo avmbohavovwo avmbobk .
EXECUTE .

*** EINDE VAN DE SYNTAX ***
