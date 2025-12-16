# Script om met behulp van Excel en PowerPoint rapportages aan te maken
# Versie 1.3.6

# 0. Voorbereiding --------------------------------------------------------

# Environment leegmaken
rm(list = ls())

# Deze libraries moeten eenmalig worden geinstalleerd met install.packages()
# install.packages(c("extrafont", "haven", "labelled", "readxl",
#                    "tidyverse", "mschart", "officer", "flextable",
#                    "sjlabelled", "ggrepel","cbsodataR","rvg"))

# Libraries laden
library(extrafont) # Package om lettertypes te importeren
library(ggrepel) # Package om labels in grafieken niet te laten overlappen
library(haven) # Package voor het laden van spss data bestanden
library(labelled) # Package om te werken met datalabels 
library(mschart) # Package voor het aanmaken van office grafieken
library(officer) # Package om MS Office documenten te maken/bewerken vanuit R
library(readxl) # Package om te werken met exceldocumenten
library(sjlabelled) # Package voor functie replace_labels()
library(tidyverse) # Meer info over tidyverse op: https://www.tidyverse.org/
library(flextable) # Package om tabellen te maken
library(cbsodataR) # Nodig om CBS cijfers in te lezen
library(rvg) # Nodig om grafieken te bewerken in Powerpoint

# Installeren en laden van lettertype
# In het R-bestand layout.R wordt als standaard lettertype calibri gebruikt. 
# Wil je een ander lettertype dan moet je deze eenmalig importeren.
extrafont::font_import(paths = "C:/Windows/Fonts", 
                       pattern = "Century Gothic", 
                       prompt = FALSE)

# Lettertypes laden
loadfonts(device = 'win')

# Check welke lettertypes beschikbaar zijn in Rstudio
windowsFonts()

# Functies laden die nodig zijn om rapportages te maken
# Alle functies vind je terug in de map 'functions'
list.files(path = 'functions', 
           pattern = "\\.R$", 
           full.names = TRUE) %>%
  walk(source)


# 1. Script uitvoeren -----------------------------------------------------

# Configuratie Excel omzetten naar rapportages in Powerpoint
# Geef de padnaam van je Excel configuratie op
# Let op! Heb je excel_to_ppt() al een keer uitgevoerd dan hoeft het script niet 
# steeds opnieuw de configuratie en de data in te laden. Heb je aanpassingen 
# gedaan aan de configuratie dan moet deze wel opnieuw ingeladen worden. Pas het 
# reload_config argument dan aan naar TRUE. Wil je de data opnieuw inladen pas 
# dan het reload_data argument aan naar TRUE. Als een of beide argumenten FALSE 
# zijn dan worden ze niet opnieuw ingeladen (tenzij ze nog niet in de Global 
# Environment van R aanwezig zijn, bijvoorbeeld als je het script na het 
# opstarten voor het eerst uitvoert)
excel_to_ppt(config_path = 'oko/config oko.xlsx', 
             reload_config = TRUE, 
             reload_data = TRUE)


# 2. Foutmeldingen oplossen -----------------------------------------------

# Loop je tegen errors aan? Met behulp van de create_table() functie kun je de 
# onderliggende tabel voor elke regel berekenen. Geef de padnaam van je 
# configuratie op bij config_path. Geef bij report_row het rijnummer in waarvoor 
# je cijfers wilt berekenen en vul bij slide_row het rijnummer van de slide-
# configuratie waarvoor je de onderliggende tabel wilt berekenen. In Excel staan
# kolomnamen in rij 1 dus report_row en slide_row kunnen niet kleiner zijn dan 2.
create_table(config_path = 'oko/config oko.xlsx', 
             report_row = 2, 
             slide_row = 2, 
             reload_config = TRUE, 
             reload_data = TRUE)