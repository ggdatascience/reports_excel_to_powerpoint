# PowerPoint rapportages vanuit Excel

Met dit script maak je met behulp van een configuratie in Excel en een template in PowerPoint geautomatiseerd Powerpoint rapportages aan.

## Stappenplan voor voorbeeldrapportage

> 1.  Klik rechtsboven op de pagina op de groene knop met de tekst `<> Code`. Kies dan onderaan in het drop down-menu de optie `Download ZIP`. Pak het ZIP bestand uit in de locatie van waaruit je wilt werken.
> 2.  Open in de uitgepakte map het R Project file genaamd `reports.Rproj`. Open nu vanuit R of vanuit diezelfde map het hoofdscript `create_reports.R`
> 3.  Volg de instructies die in het script `create_reports.R` staan om een voorbeeld rapportage op basis van nepdata uit te draaien. In deze voorbeeldrapportage zie je welke mogelijkheden het script heeft. De nepdata, het template en de configuratie die voor dit voorbeeld worden gebruikt vind je terug in de map `example`.

## Wat te doen bij problemen?

> Loop je tegen problemen aan maak dan op deze GitHub pagina een Issue aan (om dit te kunnen doen moet je een GitHub account aanmaken). [Issues · ggdatascience/reports_excel_to_powerpoint](https://github.com/ggdatascience/reports_excel_to_powerpoint/issues)

## Handleiding

> De handleiding volgt nog.

## Patch Notes

### Versie 1.2

-   Optimalisatie
    -   `type_linechart.R()` aangepast zodat de labels van de x-as afhankelijk zijn van de beschikbare waardes van time_val
-   Verbeteringen
    -   Errors in de slideconfiguratie resulteren niet meer in het afbreken van het script. De errors worden opgeslagen in een error log.
    -   Error log toegevoegd die wordt geprint naar de console als het script klaar is met uitvoeren. Hierin staan per rapport welke regels van de slideconfiguratie een error geven.
    -   Progressiebalk toegevoegd aan de Console (met trolleybus 🚎). Hierdoor zie je tijdens het uitvoeren van `excel_to_ppt()` met welk rapport en op welke slideregel van de Excelconfiguratie het script is. Zodra het scripts succesvol is afgerond wordt in de Console een bericht geprint dat alle rapporten zijn opgeslagen in de working directory.
    -   `excel_to_ppt()` aangepast zodat je met de functieargumenten `reload_config` en `reload_data` kan aangeven of de Excelconfiguratie en/of het databestand opnieuw moeten worden ingeladen. Standaard zijn deze argumenten `FALSE` en worden de Excelconfiguratie en het databestand eenmalig (bij de eerste keer uitvoeren van de functie) ingeladen. Heb je de Excelconfiguratie aangepast en wil je `excel_to_ppt()` opnieuw uitvoeren zorg dan dat het `reload_config` argument `TRUE` is. Wil je een aangepast databestand gebruiken pas dan het `reload_data` argument aan naar `TRUE`.
    -   `create_table()` aangepast zodat je met de functieargumenten `reload_config` en `reload_data` kan aangeven of de Excelconfiguratie en/of het databestand opnieuw moeten worden ingeladen.
-   Nieuwe functies
    -   `type_population_table()` toegevoegd waarmee een rekentabel kan worden gemaakt. Hiervoor moet je de populatie aantallen invullen in het bestand `population.xlsx` in de map `data`.
-   Aanpassingen
    -   `replace_text()` aangepast zodat bij het aanroepen van `type_text_comparison()` de daadwerkelijke percentages (tussen haakjes) van de groepen die worden vergeleken worden toegevoegd aan de tekst.
    -   `create_table()` argumenten `report_row` en `slide_row` aangepast zodat deze overeenkomen met de rijnummers in de Excelconfiguratie.
    -   Nieuwe map `data` aangemaakt en nepdata (`data.sav` en `fake_data.R`) verplaatst naar deze map.
    -   Voorbeeld rapportage geupdate op basis van aanpassingen.

### Versie 1.1

-   Optimalisatie
    -   `excel_to_ppt()` aangepast zodat de Excelconfiguratie en databestanden worden opgeslagen in de Global Environment.
    -   `excel_to_ppt()` aangepast zodat er eerst gekeken wordt of de Excelconfiguratie en databestanden al beschikbaar zijn in de Global Environment. Zoja, dan worden ze niet opnieuw ingeladen.
-   Verbeteringen
    -   Voorbeeldrapportage voor fictieve gemeente toegevoegd aan de map `example`.

### Versie 1.0

-   Optimalisatie
    -   Script bestaat uit losse functies zodat aanpassingen makkelijker zijn. Hierdoor is het ook mogelijk om zelf type functies te maken en daarmee content te plaatsen in rapportages.
-   Verbeteringen
    -   Werkzaam voorbeeld met Excelconfiguratie en PowerPoint template toegevoegd op basis van nepdata. Voorbeeldrapportage bevat de belangrijkste mogelijkheden van het script.
    -   Value labels voor variabelen en groeperingen (grouping 1 en grouping2) zijn aanpasbaar vanuit de slideconfiguratie.
    -   De y-as in grafieken loopt standaard van 0 tot 100% en is aanpasbaar via de slideconfiguratie.
    -   De richting van staafgrafieken is standaard verticaal en is per grafiek aanpasbaar via de slideconfiguratie.
    -   Lettertype en kleurpalette zijn aanpasbaar in `layout.R`.
-   Nieuwe functies
    -   `type_text_comparison()` toegevoegd om twee groepen, dimensies of jaren met elkaar te vergelijken in een tekst. De vergelijking is gebaseerd op een relatief percentage van 15% dat kan worden aangepast in `replace_text.R`
    -   `type_barchart()` aangepast om groeperingen van meerdere variabelen op de x-as te combineren.
    -   `type_linechart()` toegevoegd die met behulp van ggplot een trendgrafiek maakt waarbij de value labels automatisch in de figuur komen en niet overlappen.
    -   `type_text()` toegevoegd om tekst te plaatsen vanuit de slideconfiguratie. **Let op!** *Deze functionaliteit is toegevoegd zodat de titels van slides aan de slideconfiguratie kunnen worden toegevoegd om in de slideconfiguratie meer overzicht te creëren. Het script is hierdoor langzamer omdat er meer content vanuit R in de PowerPoint moet worden geplaatst. Vaste teksten kunnen in de meeste gevallen het beste in het diamodel worden geplaatst.*
    -   `create_table()` toegevoegd om voor een specifieke regel uit de slideconfiguratie de onderliggende cijfers te berekenen. Dit kan gebruikt worden om cijfers te controleren op juistheid of bij het oplossen van errors.
