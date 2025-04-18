# Script om vanuit een Excelconfiguratie en een Powerpoint template rapportages aan te maken

# 0. Voorbereiding --------------------------------------------------------

# Environment leegmaken
rm(list = ls())

# Deze libraries moeten eenmalig worden geinstalleerd met install.packages()
# install.packages(c("extrafont", "haven", "labelled", "readxl", "tidyverse", "mschart", "officer", "flextable", "sjlabelled", "ggrepel")

# Libraries laden
library(extrafont) # Package om het lettertype Century Gothic te gebruiken
library(haven) # Package Voor het laden van spss data bestanden
library(labelled) # Package om te werken met datalabels 
library(readxl) # Package om te werken met exceldocumenten
library(tidyverse) # Meer informatie over het tidyverse is te vinden op: https://www.tidyverse.org/
library(mschart) # Package voor het aanmaken van office grafieken
library(officer) # Package om Powerpoint (en andere MS Office) documenten aan te maken of te bewerken vanuit R
library(flextable) # Package om tabellen te maken
library(sjlabelled) # Package voor functie replace_labels()
library(ggrepel) # Package met functionaliteit om labels in grafieken niet te laten overlappen

# Installeren en laden van lettertype
# In het R-bestand layout.R wordt als standaard lettertype calibri gebruikt. Wil je een ander lettertype dan moet je deze eenmalig importeren
extrafont::font_import(paths = "C:/Windows/Fonts", pattern = "calibri", prompt = FALSE)
loadfonts(device = 'win')

# Check welke lettertypes beschikbaar zijn in Rstudio
windowsFonts()

# Functies laden die nodig zijn om rapportages te maken
# Alle functies vind je terug in de map 'functions'
list.files('functions', pattern = "\\.R$", full.names = TRUE) %>%
  walk(source)

# Configuratie Excel omzetten naar rapportages in Powerpoint
# Geef de padnaam van je Excel configuratie op
excel_to_ppt(config_path = 'example/config.xlsx')

# Loop je tegen errors aan? Met behulp van de table() functie kun je de onderliggende tabel voor elke regel berekenen
# Geef de padnaam van je configuratie op en vul bij report_row het rapport waarvoor je cijfers wilt bereken en 
# bij slide_row de regel in de slideconfiguratie. Let op dat Excel begint te tellen bij 2 omdat in regel 1 de kolomnamen
# staan. Wil je de onderliggende tabel berekenen voor slideconfiguratie regel 2, dan vul je bij slide_row dus 1 in.
# Als voor een regel geen cijfers berekend worden dan krijgen je alleen de report- en slideconfiguratie te zien voor die regel.
create_table('example/config.xlsx', report_row = 1, slide_row = 1)



