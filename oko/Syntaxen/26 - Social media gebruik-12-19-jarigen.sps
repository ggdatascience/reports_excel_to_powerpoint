* Encoding: UTF-8.
********************************************************************************************************
*** Standaard Social media gebruik 12-19-jarigen.
*** Versie 7 / juli 2025
*** Standaard vastgesteld op XXX
*** Contactpersoon: Anne Meerdink / ameerdink@ggdghor.nl.
********************************************************************************************************
***Wijzigingen in de syntax 2026 tov vorige versie 2023
*Zeven nieuwe indicatoren toegevoegd.
*Indicator '% dat slaap te kort komt door sociale media gebruik behouden'. Wordt nu berekend aan de hand van 3 antwoordopties ipv 5. In het variabel label '(zeer) vaak' vervangen in 'vaak'.
*Indicator verwijderd: SBSGK3S2: % dat risico loopt op problematisch gebruik van sociale media (obv 7 items; verkorte IVO-schaal plus slaap-item, plus verzwaard) . 
*Indicator verwijderd: SBSGK3S4: % dat risico loopt op problematisch gebruik van sociale media (obv 6 items; zoals verkorte IVO-schaal) .
*Indicator verwijderd: SBSGK3S5: % dat huiswerk afraffelt om sociale media te gebruiken.

***Wijzigingen in de syntax 2023 tov vorige versie 2021 (versie 5.2).
*Twee extra indicatoren toegevoegd gebaseerd op losse items.
*Bij opgeschoonde variabelen valuelabel 1 'Zelden' aangepast in 'Bijna nooit' in lijn met de vraagstelling.
*Score 2 wordt bij indicator SBSGK3S2 en SBSGK3S4 nu meegenomen als weinig/geen risico, dat ging in eerdere syntax mis.
*Bij verzwaren van de indicator werd een niet bestaande waarde van 8 bij SBSGA306 en SBSGA308 gebruikt, dat weggehaald.
*Bij verzwaren wordt de indicator nu op missing gezet indien zowel het slaap- als huiswerk-item missing zijn en er op basis van de andere items wel een risico zou zijn.

*** Geen wijzigingen in de syntax in 2021 tov 2019.
*** In de vraagstelling zijn de voorbeelden in de introductietekst gewijzigd. Dit heeft geen invloed op de syntax. 
*** Formulering van de indicatoren wordt aangepast naar oude formulering. De vraag geeft geen indicatie van een risico dat jongeren ervaren, maar het risico volgt uit de antwoorden die jongeren geven.

*** AANPASSINGEN TEN OPZICHTE VAN DE VORIGE VERSIE (versie 4 / 22 maart 2016): .
*** In versie 5 is de formulering van de indicatoren aangepast (zie achtergronddocument) .
*** In versie 5 is de voorlopervraag (SBSGK301 'Hoe vaak actief op sociale media?') verwijderd .
*** Hiermee zijn ook de opschoonstappen op basis van de voorlopervraag verwijderd .
*** In versie 5 is de antwoordcategorie 'Zelden' vervangen door 'Bijna nooit' .
*** In versie 5 is de term 'sociale media' vervangen door 'social media' .

*** MET DEZE SYNTAX WORDEN DE VOLGENDE INDICATOREN AANGEMAAKT: .
*SBSGK3S6: % dat slaap te kort komt door sociale media gebruik.
*SBSGK3S7: uren sociale media gebruik in 4 categorieën.
*SBSGK3S8: % dat zich vaak goed voelt door sociale media.
*SBSGK3S9: % dat zich vaak slecht voelt door sociale media.
*SBSGK3S10: % dat vaak afgeleid wordt door sociale media.
*SBSGK3S11: % dat het vaak moeilijk vindt om te stoppen met sociale media.
*SBSGK3S12: % dat zichzelf verslaafd vindt aan sociale media.
*SBSGK3S13: % dat zichzelf heel erg verslaafd vindt aan sociale media.

*** STAP 1: DEFINIËREN EN OPSCHONEN VAN DE OORSPRONKELIJKE VARIABELEN ***

* SBSGK309 t/m SBSGK315 omcoderen naar absolute nulcategorie .
* Hiertoe nieuwe variabelen voor de vragen aanmaken: SBSGA309 t/m SBSGA315 .
RECODE SBSGK309 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBSGA309 .
RECODE SBSGK310 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBSGA310 .
RECODE SBSGK311 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBSGA311 .
RECODE SBSGK312 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBSGA312 .
RECODE SBSGK313 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBSGA313 .
RECODE SBSGK314 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBSGA314 .
RECODE SBSGK315 (1=0)(2=1)(3=2)(4=3)(5=4)(else=copy) into SBSGA315 .
EXECUTE .

VARIABLE LABELS 
  SBSGA309 'Hoeveel uur per dag gebruik je sociale media? (opgeschoond)'
  SBSGA310 'Hoe vaak voel je je goed door sociale media (opgeschoond)'
  SBSGA311 'Hoe vaak voel je je slecht door sociale media? (opgeschoond)'
  SBSGA312 'Hoe vaak word je afgeleid door sociale media? (opgeschoond)'
  SBSGA313 'Hoe vaak vind je het moeilijk om te stoppen met sociale media? (opgeschoond)'
  SBSGA314 'Hoe vaak kom je slaap te kort door sociale media? (opgeschoond)'
  SBSGA315 'Vind je jezelf verslaafd aan sociale media? (opgeschoond)'.
EXECUTE .

VALUE LABELS
  SBSGA309 0 'Minder dan 1 uur per dag' 1 '1 tot 3 uur per dag' 2 '4 tot 6 uur per dag' 3 'Meer dan 6 uur per dag' 9 'Onbekend' .
EXECUTE .

VALUE LABELS
  SBSGA310 SBSGA311 SBSGA312 SBSGA313 SBSGA314 0 '(Bijna) nooit' 1 'Soms' 2 'Vaak' 9 'Onbekend' .
EXECUTE .

VALUE LABELS
  SBSGA315 0 'Ja, heel erg' 1 'Ja, een beetje' 2 'Nee' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGA309 SBSGA310 SBSGA311 SBSGA312 SBSGA313 SBSGA314 SBSGA315 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGA309 SBSGA310 SBSGA311 SBSGA312 SBSGA313 SBSGA314 SBSGA315 (9) .
EXECUTE .

*** STAP 2: INDICATOREN AANMAKEN ***
    
*Aanmaken indicator: uren sociale media gebruik in 4 categorieën.

RECODE SBSGA309 (0=1) (1=2) (2=3) (3=4) (else=copy) INTO SBSGK3S7.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S7 'Aantal uren sociale media per dag in 4 categorieën'.
EXECUTE .

VALUE LABELS
    SBSGK3S7 1 'Minder dan 1 uur per dag' 2 '1 tot 3 uur per dag' 3 '4 tot 6 uur per dag' 4 'Meer dan 6 uur per dag' 9 'Onbekend'.
EXECUTE.

FORMATS 
    SBSGK3S7 (F1.0).
EXECUTE.

MISSING VALUES SBSGK3S7 (9).
EXECUTE.

*Aanmaken indicator: % dat zich vaak goed voelt door sociale media.
RECODE SBSGA310 (0,1=0) (2=1) (else=copy) INTO SBSGK3S8.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S8 'Voelt zich vaak goed door sociale media'.
EXECUTE .

VALUE LABELS
  SBSGK3S8 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGK3S8 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGK3S8 (9) .
EXECUTE .

*Aanmaken indicator: % dat zich vaak slecht voelt door sociale media.
RECODE SBSGA311 (0,1=0) (2=1) (else=copy) INTO SBSGK3S9.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S9 'Voelt zich vaak slecht door sociale media'.
EXECUTE .

VALUE LABELS
  SBSGK3S9 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGK3S9 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGK3S9 (9) .
EXECUTE .

*Aanmaken indicator: % dat vaak afgeleid wordt door sociale media.
RECODE SBSGA312 (0,1=0) (2=1) (else=copy) INTO SBSGK3S10.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S10 'Wordt vaak afgeleid door sociale media'.
EXECUTE .

VALUE LABELS
  SBSGK3S10 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGK3S10 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGK3S10 (9) .
EXECUTE .

*Aanmaken indicator: % dat het vaak moeilijk vindt om te stoppen met sociale media.
RECODE SBSGA313 (0,1=0) (2=1) (else=copy) INTO SBSGK3S11.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S11 'Vindt het vaak moeilijk om te stoppen met sociale media'.
EXECUTE .

VALUE LABELS
  SBSGK3S11 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGK3S11 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGK3S11 (9) .
EXECUTE .

*Aanmaken indicator: % dat slaap te kort komt door sociale media gebruik.
RECODE SBSGA314 (0,1=0) (2=1) (else=copy) INTO SBSGK3S6.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S6 'Komt vaak slaap te kort door sociale media gebruik'.
EXECUTE .

VALUE LABELS
  SBSGK3S6 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGK3S6 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGK3S6 (9) .
EXECUTE .

*Aanmaken indicator: % dat zichzelf verslaafd vindt aan sociale media.
RECODE SBSGA315 (0=0) (1,2=1) (else=copy) INTO SBSGK3S12.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S12 'Vindt zichzelf een beetje tot heel erg verslaafd aan sociale media'.
EXECUTE .

VALUE LABELS
  SBSGK3S12 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGK3S12 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGK3S12 (9) .
EXECUTE .

*Aanmaken indicator: % dat zichzelf heel erg verslaafd vindt aan sociale media.
RECODE SBSGA315 (0,1=0) (2=1) (else=copy) INTO SBSGK3S13.
EXECUTE.

VARIABLE LABELS 
  SBSGK3S13 'Vindt zichzelf heel erg verslaafd aan sociale media'.
EXECUTE .

VALUE LABELS
  SBSGK3S13 0 'Nee' 1 'Ja' 9 'Onbekend' .
EXECUTE .

FORMATS
  SBSGK3S13 (F1.0) .
EXECUTE .

MISSING VALUES
  SBSGK3S13 (9) .
EXECUTE .

*** EINDE VAN DE SYNTAX ***

