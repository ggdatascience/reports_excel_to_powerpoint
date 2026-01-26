## OKO Stappenplan

1.  Download alle bestanden in de repository met behulp van de het dropdown menu onder de groene knop Code

![](Afbeeldingen/Code.png)

![](Afbeeldingen/ZIP.png)

2.  Pak het gedownloade ZIP-bestand uit in de folder waar je de rapportages wilt maken

3.  Open reports.Rproj. Hiermee open je de projectfile die automatisch de working directory in RStudio instelt op de locatie waar reports.Rproj zich bevindt. Wil je niet werken met een .Rproj file dan kun je ook direct `create_reports.R` openen en handmatig de working directory instellen.

![](Afbeeldingen/Project.png)

4.  Voordat je rapportages uitdraait is het handig om de themakleuren in het PowerPoint template aan te passen. Voor OKO kun je in het PowerPoint template een nieuw kleurenthema aanmaken. Hiervoor zijn de volgende kleuren gebruikt:

    -   Tekst/Achtergrond - Donker 1 = #000000
    -   Tekst/Achtergrond - Licht1 = #FFFFFF
    -   Tekst/Achtergrond - Donker 2 = #737375
    -   Tekst/Achtergrond = Licht 2 = #DAD3D1
    -   Accent 1 = #E3032C
    -   Accent 2 = #36B03F
    -   Accent 3 = #4450C6
    -   Accent 4 = #FABD15
    -   Accent 5 = #6EA6FF
    -   Accent 6 = #FF6200
    -   Hyperlink = #0092AE
    -   Gevolgde hyperlink = #EAF4F8

![](Afbeeldingen/Kleurenthema.png)

5.  Open het config oko.xlsx bestand. Dit kun je doen via de verkenner of via de mappenstructuur rechtsonderin RStudio via het tabblad 'Files'.

6.  Wijzig in het tabblad 'reports' de volgende kolommen

    -   'report_name' : vul hier de naam in die je aan het rapport wilt geven
    -   'report_name_prefix' : vul hier een prefix in voor de rapportnaam
    -   'data_path' : vul hier de padnaam van je databestand in
    -   'template_path' : deze kolom hoef je alleen aan te passen als de map 'oko' niet in je working directory staat
    -   'dim_vars' : vul hier de variabele in die de waarde bevat waarvoor je een rapport wilt maken
    -   'dim_val' : vul hier de waarde in die overeenkomt met de waarde voor 'dim_vars' waarvoor je een rapport wilt maken
    -   'dim_name' : vul hier de naam op die gebruikt moet worden in figuren voor de opgeven 'dim_vars' en 'dim_val'

    Het aanpassen van de andere kolommen in dit tabblad is optioneel.

7.  Het is verstandig om nu eerst `create_reports.R` te openen en te runnen voordat je wijzigingen aanbrengt in de slideconfiguratie.

8.  Is het gelukt om een (of meer) rapportages uit te draaien dan kun je wijzigingen doorvoeren in de slideconfiguratie(s). Over het algemeen zullen wijzigingen in de slideconfiguratie (of het template) er niet voor zorgen dat het script vastloopt, maar wijzigingen kunnen wel resulteren in errors. Zodra het script klaar is met het uitdraaien van de rapportages krijg je per rapport een samenvatting van errors in de Console in RStudio. Als er geen errors zijn dan krijg je dat ook te zien in je console.

9.  Voor het aanpassen van de volgende standaardinstellingen moet je de volgende bestanden aanpassen:

    -   N-regel (grote en kleine N) kun je aanpassen in `compute_values.R`
    -   Kleurpalet en lettertype voor figuren kun je aanpassen in `layout.R`

    Als je een wijziging aanbrengt, sla het bestand dan op en laat het bestand opnieuw in voordat je het gebruikt (dit kan je doen in `create_reports.R` of door de aangepaste regels opnieuw te runnen)

10. Loop je verder nog tegen issues of foutmeldingen aan die je niet opgelost krijgt, maak dan een GitHub account aan en open een issue op: <https://github.com/ggdatascience/reports_excel_to_powerpoint/issues>
