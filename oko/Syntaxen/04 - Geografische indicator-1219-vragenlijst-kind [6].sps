* Encoding: UTF-8.
************************************************************************************************************.
*** Standaard Geografische indicator (GM Jeugd)-1219-vragenlijst-kind .
*** Versie 5 / 20 november 2023 .
*** Standaard vastgesteld op 23 maart 2023.
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl 
************************************************************************************************************.

***Voor OKO 2025: geen postcode uitgevraagd; alleen provincie en woonlplaats.
***onderin worden de ingevulde woonplaatsen van de twee deelnemende scholen ingedeeld in gemeente Moerdijk en overig.

*** Wijzigingen tov 2023:
  * Geen postcode uitgevraagd in 2025 voor OKO, dus postcode is eruit gehaald.

***Wijzigingen tov 2021:
* Provincie is als numeric variable gecodeerd.
* Value labels van België en Duitsland veranderd van 0111 en 0222 naar 111 en 222.
* Opgeschoonde variabele voor postcode4 wordt in deze syntax aangemaakt.

*** Syntax gecheckt en aangepast door Rosemarijn Boekee & Pauline Geuijen (RIVM), 18 oktober 2021.
    *** Aanpassing t.o.v. versie 3: doordat MBGIK403 en MBGIK402 stringvariabelen zijn, moeten de waardes van deze variabelen tussen aanhalingstekens worden gezet, dus "0" i.p.v. 0.
    *** Format F4.0 kan niet worden toegepast op MBGIK403 en MBGIK402 aangezien dit stringvariabelen zijn, middels alter type is het format voor deze stringvariabelen nu gedefiniëerd.
    *** "IF missing..." command werkt niet voor stringvariabelen (SPSS niet lege stringvariabelen niet als missing), daarom veranderd in IF MBGIK403="" MBGIK403 = "0" en IF MBGIK402="" MBGIK402 = "0".
    *** Aanmaken indicator Postcode 4 is achterwege gelaten, aangezien dit een kopie was van de originele variabele. Een opgeschoonde postcode 4 variabele wordt aangemaakt in de opschoningssyntax van het RIVM.

*** Wijziging tov 2019: dummies voor Belgie en Duitsland toegevoegd en naast woonplaats ook gevraagd naar provincie ten behoeve van filtering woonplaats.
*** Toelichting: Deze syntax betreft de variabelen over postcodecijfers (PC4=MBGIK401) en woonplaats (=MBGIK402).
*** Woonplaats is alleen gevraagd als de PC4 niet is ingevuld.
*** Het RIVM bewerkt deze variabelen later (samenvoegen, opschonen, imputeren) tot de variabele(n) GEMEENTECODE.

*** MET DEZE SYNTAX WORDT DE VOLGENDE INDICATOR AANGEMAAKT: .
*** POSTCODE4 'Postcode 4 (opgeschoond)'.

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELE ***

VARIABLE LABELS 
  MBGIK403 'Provincie (vraag alleen gesteld als postcodevraag is overgeslagen)'
  MBGIK402 'Woonplaats (vraag alleen gesteld als postcodevraag is overgeslagen)'.
EXECUTE.

VALUE LABELS
  MBGIK403 0 'Onbekend' 1 'Drenthe' 2 'Flevoland' 3 'Fryslân' 4 'Gelderland' 5 'Groningen' 6 'Limburg' 7 'Noord-Brabant' 8 'Noord-Holland' 9 'Overijssel' 10 'Utrecht' 11 'Zeeland' 12 'Zuid-Holland' 13 'Niet in Nederland'/
  MBGIK402 "0" 'Onbekend' .
EXECUTE.
 
FORMATS
  MBGIK403 (F2.0).
EXECUTE.

ALTER TYPE
  MBGIK402 (A40).
EXECUTE.

MISSING VALUES
  MBGIK403 (0)/
  MBGIK402 ("0").
EXECUTE.

*Als er niets is ingevuld, dan krijgt de variabele de waarde 0.
IF missing (MBGIK403) MBGIK403 = 0 .
IF MBGIK402="" MBGIK402 = "0" .
EXECUTE .

**indelen woonplaats in gemeente (Moerdijk of anders).
compute gemeente=0.
FORMATS gemeente (f1).
if MBGIK402='0' gemeente=9.
if MBGIK402='Fijnaart' or MBGIK402='Heijningen' or MBGIK402='Klundert' or MBGIK402='Langeweg' or MBGIK402='gemeente' or MBGIK402='Noordhoek'
 or MBGIK402='Oudemolen' or MBGIK402='Standdaarbuiten' or MBGIK402='Willemstad' or MBGIK402='Zevenbergen' or MBGIK402='Zevenbergschen Hoek' gemeente=1.
val lab gemeente 0 'Overige' 1 'Moerdijk'.
MISSING VALUES gemeente (9).
*fre gemeente.

*** EINDE VAN DE SYNTAX ***
