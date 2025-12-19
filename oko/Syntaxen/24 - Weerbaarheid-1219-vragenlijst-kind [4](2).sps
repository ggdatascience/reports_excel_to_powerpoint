* Encoding: UTF-8.
*******************************************************************************************************************************************************************************
*** Standaard Weerbaarheid-1219-vragenlijst-kind .
*** Versie 4 / 16 oktober 2025.
*** Standaard vastgesteld op 4 juli 2025
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl 
***********************************************************************************************************************************************************************************.
***Aanpassingen 2026 ten opzichte van 2023
***In de vraagstelling zijn het aantal stellingen ingekort van 8 naar 5. Enkel de positief gestelde stellingen worden opgenomen in de nieuwe vraagstelling. Daarnaast wordt stelling 1 nu stelling 5

*** AANPASSINGEN 2023 TEN OPZICHTE VAN 2021 (versie 2.1): .
*** In de vraagstelling zijn tekstuele wijzigingen doorgevoerd omdat de vragen los zijn gesteld in plaats van in een matrix. Dit heeft geen gevolgen voor de syntax.
*** Wel is het opschonen van extreme waarden verplaatst naar boven, zodat dit direct in de totaalscore wordt meegenomen.

*** WIJZIGING 2021 TOV VORIGE VERSIE:
*** De value labels van PBWBK301 t/m 308 zijn aangepast in verband met consistentie in antwoordcategorieën.
*** (Helemaal) mee (on)eens is gewijzigd in (helemaal) mee (on)eens. 

*** Toelichting: vragenset en berekenwijze afkomstig van Zuid-Oost Brabant/Hart voor Brabant.
*** Item zit sinds 2015 in landelijke Gezondheidsmonitor Jeugd (heette in 2015 ' Opkomen voor jezelf)'.

*** MET DEZE SYNTAX WORDT DE VOLGENDE INDICATOR AANGEMAAKT: 
*** PBWBK3S3: % dat voldoende weerbaar is .

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

VARIABLE LABELS 
  PBWBK301 'Ik weet wat ik wel en niet wil'
  PBWBK302 'Ik zeg het als iemand iets doet wat ik vervelend vind'
  PBWBK304 'Ik kan heel goed nee zeggen'
  PBWBK306 'Ik doe dingen die ik zelf echt wil'
  PBWBK307 'Ik kom voor mezelf op'.
EXECUTE.

VALUE LABELS
  PBWBK301 PBWBK302 PBWBK304 PBWBK306 PBWBK307 1 'Helemaal eens' 2 'Eens' 3 'Niet eens, niet oneens' 4 'Oneens' 5 'Helemaal oneens' 9 'Onbekend' .
EXECUTE.

FORMATS
  PBWBK301 PBWBK302 PBWBK304 PBWBK306 PBWBK307 (F1.0) .
EXECUTE.

MISSING VALUES
  PBWBK301 PBWBK302 PBWBK304 PBWBK306 PBWBK307 (9) .
EXECUTE.

* Als er niets is ingevuld, dan krijgt de variabele de waarde 9 .
IF missing (PBWBK301) PBWBK301 = 9 .
IF missing (PBWBK302) PBWBK302 = 9 .
IF missing (PBWBK304) PBWBK304 = 9 .
IF missing (PBWBK306) PBWBK306 = 9 .
IF missing (PBWBK307) PBWBK307 = 9 .

* Een aantal items moet worden omgecodeerd .
* Hiertoe (tijdelijk) nieuwe variabelen aanmaken .
RECODE PBWBK301 (1=5)(2=4)(3=3)(4=2)(5=1)(else=copy) into PBWBA301 .
RECODE PBWBK302 (1=5)(2=4)(3=3)(4=2)(5=1)(else=copy) into PBWBA302 .
RECODE PBWBK304 (1=5)(2=4)(3=3)(4=2)(5=1)(else=copy) into PBWBA304 .
RECODE PBWBK306 (1=5)(2=4)(3=3)(4=2)(5=1)(else=copy) into PBWBA306 .
RECODE PBWBK307 (1=5)(2=4)(3=3)(4=2)(5=1)(else=copy) into PBWBA307 .
EXECUTE .

MISSING VALUES
  PBWBA301 PBWBA302 PBWBA304 PBWBA306 PBWBA307 (9) .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***

* Aanmaken indicator: % dat onvoldoende/voldoende weerbaar is .

COMPUTE PBWBK3S1 = mean.3 (PBWBA301,PBWBA302,PBWBA304,PBWBA306,PBWBA307) .
EXECUTE.

VARIABLE LABELS PBWBK3S1 'Weerbaarheid, totaalscore' .
EXECUTE.

IF missing (PBWBK3S1) PBWBK3S1 = 9 .
EXECUTE.

FORMATS PBWBK3S1 (F3.2) .
EXECUTE.

MISSING VALUES PBWBK3S1 (9) .
EXECUTE .


* Afkappunten: 1 t/m 3 is onvoldoende weerbaar / > 3 t/m 5 is voldoende weerbaar (vaker dan 'soms wel, soms niet') (naar syntax GGD Hart voor Brabant 03-03-2012) .
RECODE PBWBK3S1 (1 thru 3=0)(3 thru 5=1)(else=copy) into PBWBK3S3 .
EXECUTE.

VARIABLE LABELS  PBWBK3S3 'Is voldoende weerbaar' .
EXECUTE.

VALUE LABELS PBWBK3S3 0 'Onvoldoende weerbaar' 1 'Voldoende weerbaar' 9 'Onbekend' .
EXECUTE.

FORMATS PBWBK3S3 (F1.0) .
EXECUTE.

MISSING VALUES PBWBK3S3 (9) .
EXECUTE .

* Omgecodeerde variabelen verwijderen .
DELETE VARIABLES PBWBA301 PBWBA302 PBWBA304 PBWBA306 PBWBA307 .
EXECUTE .

FREQUENCIES PBWBK3S3.

*** EINDE VAN DE SYNTAX ***

