type_respons_text <- function(data, report_params, slide_params, h = 4, w = 18) {
  
  # Let op: de report naam dient gelijk te zijn aan het gebied in het Excel bestand
  respons_data_excel <- "data/respons_data.xlsx"
  
  aantal_resp <- read_excel(respons_data_excel) %>%
    filter(gebied == report_config$reports$report_name) %>%
    filter(leeftijdsgroep == 'Totaal') %>%
    pull(aantal_response)
  
  aantal_resp_perc <- read_excel(respons_data_excel) %>%
    filter(gebied == report_config$reports$report_name) %>%
    filter(leeftijdsgroep == 'Totaal') %>%
    mutate('Respons %' = paste(round((aantal_response / aantal_uitnodigingen)*100, digits = 1),"%", sep = "")) %>%
    pull('Respons %') %>%
    gsub('\\.', ',', .) 
  
  aantal_18_64 <- read_excel(respons_data_excel) %>%
    filter(gebied == report_config$reports$report_name) %>%
    filter(leeftijdsgroep == '18-64 jarigen') %>%
    mutate('Respons %' = paste(round((aantal_response / aantal_uitnodigingen)*100, digits = 1),"%", sep = "")) %>%
    pull('Respons %') %>%
    gsub('\\.', ',', .) 
  
  aantal_65 <- read_excel(respons_data_excel) %>%
    filter(gebied == report_config$reports$report_name) %>%
    filter(leeftijdsgroep == '65 plussers') %>%
    mutate('Respons %' = paste(round((aantal_response / aantal_uitnodigingen)*100, digits = 1),"%", sep = "")) %>%
    pull('Respons %') %>%
    gsub('\\.', ',', .) 
  
  
  tekst <- paste0('In heel Zuid-Limburg hebben 24395 inwoners de vragenlijst ingevuld (respons 28,7%) waarvan ', aantal_resp,' in uw gemeente. De respons in uw gemeente was ', aantal_resp_perc,
                  '. In de leeftijdscategorie 18-64 jarigen was de respons ', aantal_18_64,
                  '. In de leeftijdscategorie 65 plus was de respons ', aantal_65,'.')
  return(tekst)

}