* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Leeftijd (GM Jeugd)-1219-vragenlijst-kind .
*** Versie 5 / 21 juli 2025
*** Standaard vastgesteld op 4 juni 2025 .
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************

*** AANPASSINGEN TOV VORIGE VERSIE (versie 4):
    *In 2025 is alleen leeftijd uitgevraagd, en geen geboortemaand en -jaar meer
    *Daarnaast is de antwoordcategorie '17 jaar of ouder' gesplitst in '17 jaar' en '18 jaar of ouder'
    *De variabelenaam is hierdoor weer hetzelfde als in 2019. 
    *Anders dan in 2019, is missing nu '99' ipv '9'.

*** AANPASSINGEN TOV VORIGE VERSIE (versie 2):
    *In 2023 is leeftijd in klas 4 uitgevraagd door naar geboortemaand en -jaar te vragen. Dit in verband met samenwerking met Trimbos.
    *Het definiëren van de variabelen is voor klas 4 daarom aangepast. Hieruit wordt dezelfde leeftijdsindicator berekend als in 2021.
    *Voor andere klassen wordt wel de oude leeftijdsvraag gesteld en deze wordt direct gecodeerd als de indicator BBLFA322.
    *Het omcoderen van geboortemaand en -jaar voor klas 4 wordt door het veldwerkbureau gedaan middels deze syntax, zodat geen privacygevoelige gegevens worden gedeeld met de GGD'en.
    *Voor klas 2 wordt wel gevraagd naar leeftijd ipv geboortemaand en - jaar. Per abuis is hiervoor nu direct de opgeschoonde variabele gebruikt. De omcoderingsstap van BBLFK322 naar BBLFA322 wordt daarom overgeslagen.

*** AANPASSINGEN TOV VORIGE VERSIE (versie 1):
*** In 2021 zijn de antwoordcategorieën '17 jaar' en '18 jaar of ouder' samengevoegd tot '17 jaar of ouder'.
*** De variabelenaam en indicator zijn daarom aangepast.

*** MET DEZE SYNTAX WORDT DE VOLGENDE INDICATOR AANGEMAAKT: .
*** BBLFA321: Leeftijd in jaren .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS 
  BBLFK321 'Hoe oud ben je?' .
EXECUTE .
  
VALUE LABELS
  BBLFK321 1 '12 jaar of jonger' 2 '13 jaar' 3 '14 jaar' 4 '15 jaar' 5 '16 jaar' 6 '17 jaar' 7 '18 jaar of ouder' 99 'onbekend' .
EXECUTE .

FORMATS
  BBLFK321 (F1.0) .
EXECUTE .

MISSING VALUES
  BBLFK321 (99) .
EXECUTE .

*** Als er niets is ingevuld, dan krijgt de variabele de waarde 99 .
IF missing (BBLFK321) BBLFK321 = 99 .
EXECUTE .


*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: Leeftijd in jaren .
RECODE BBLFK321 (1=12)(2=13)(3=14)(4=15)(5=16)(6=17)(7=18)(else=copy) into BBLFA321 .
EXECUTE .

VARIABLE LABELS 
  BBLFA321 'Leeftijd in jaren' .
EXECUTE .

VALUE LABELS
  BBLFA321 12 '12 jaar of jonger' 13 '13 jaar' 14 '14 jaar' 15 '15 jaar' 16 '16 jaar' 17 '17 jaar' 18 '18 jaar of ouder' 99 'onbekend'.
EXECUTE .

FORMATS
  BBLFA321 (F1.0).
EXECUTE .

MISSING VALUES
  BBLFA321 (99).
EXECUTE .

*** EINDE VAN DE SYNTAX ***
