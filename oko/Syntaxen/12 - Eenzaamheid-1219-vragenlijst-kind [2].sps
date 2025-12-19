* Encoding: UTF-8.

********************************************************************************************************
*** Standaard Eenzaamheid-1219-vragenlijst-kind .
*** Versie 2 / 21 juli 2025 .
*** Standaard vastgesteld op 4 juni 2025.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************

***Geen wijzigingen tov 2023.

***Wijzigingen tov 2021:
*** De tweede vraag over eenzaamheid - betreffende de laatste 12 maanden-   is in 2023 verwijderd. 
*** De syntax 2023 is hier op aangepast.
*** Values van indicatoren aangepast van 1/2 naar 0/1. 

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*** SBEZK3S1: % dat zich de laatste 4 weken vaak tot altijd eenzaam heeft gevoeld .
*** SBEZK3S2: % dat zich de laatste 4 weken soms tot altijd eenzaam heeft gevoeld . 

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS
   SBEZK301 'Hoe vaak heb je je eenzaam gevoeld in de laatste 4 weken?'.
EXECUTE .

VALUE LABELS
   SBEZK301  1 'Nooit' 2 'Bijna nooit' 3 'Soms' 4 'Vaak' 5 '(Bijna) altijd' 9 'Onbekend'.
EXECUTE .

FORMATS
 SBEZK301 (F1.0). 
EXECUTE .

MISSING VALUES
  SBEZK301 (9) .
EXECUTE .

*** Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (SBEZK301) SBEZK301 = 9 .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat zich de laatste 4 weken vaak tot altijd eenzaam heeft gevoeld .

RECODE SBEZK301 (1=0)(2=0)(3=0)(4=1)(5=1)(else=copy) into SBEZK3S1 .
EXECUTE .

VARIABLE LABELS 
  SBEZK3S1 'Vaak tot altijd eenzaam de laatste 4 weken' .
EXECUTE .
  
VALUE LABELS
  SBEZK3S1 0 '(Bijna) nooit / Soms' 1 'Vaak / (bijna) altijd' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBEZK3S1 (F1.0) .
EXECUTE .

MISSING VALUES
  SBEZK3S1 (9) .
EXECUTE .

* Aanmaken indicator: % dat zich de laatste 4 weken soms tot altijd eenzaam heeft gevoeld .

RECODE SBEZK301 (1=0)(2=0)(3=1)(4=1)(5=1)(else=copy) into SBEZK3S2 .
EXECUTE .

VARIABLE LABELS 
  SBEZK3S2 'Soms tot altijd eenzaam de laatste 4 weken' .
EXECUTE .
  
VALUE LABELS
  SBEZK3S2 0 '(Bijna) nooit' 1 'Soms tot altijd' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBEZK3S2 (F1.0) .
EXECUTE .

MISSING VALUES
  SBEZK3S2 (9) .
EXECUTE .


*** EINDE VAN DE SYNTAX ***


