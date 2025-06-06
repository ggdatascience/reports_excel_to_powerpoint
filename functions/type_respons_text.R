type_respons_text <- function(data, report_params, slide_params) {
  
  # Let op: de report naam dient gelijk te zijn aan het gebied in het Excel bestand
  respons_data_excel <- "data/respons_fake.xlsx"
  
  aantal_resp <- read_excel(respons_data_excel) %>%
    filter(gebied == report_params$report_name) %>%
    filter(leeftijdsgroep == 'Totaal') %>%
    pull(aantal_response)
  
  aantal_resp_perc <- read_excel(respons_data_excel) %>%
    filter(gebied == report_params$report_name) %>%
    filter(leeftijdsgroep == 'Totaal') %>%
    mutate('Respons %' = paste(round((aantal_response / aantal_uitnodigingen)*100, digits = 1),"%", sep = "")) %>%
    pull('Respons %') %>%
    gsub('\\.', ',', .) 
  
  aantal_18_64 <- read_excel(respons_data_excel) %>%
    filter(gebied == report_params$report_name) %>%
    filter(leeftijdsgroep == '18-64 jarigen') %>%
    mutate('Respons %' = paste(round((aantal_response / aantal_uitnodigingen)*100, digits = 1),"%", sep = "")) %>%
    pull('Respons %') %>%
    gsub('\\.', ',', .) 
  
  aantal_65 <- read_excel(respons_data_excel) %>%
    filter(gebied == report_params$report_name) %>%
    filter(leeftijdsgroep == '65 plussers') %>%
    mutate('Respons %' = paste(round((aantal_response / aantal_uitnodigingen)*100, digits = 1),"%", sep = "")) %>%
    pull('Respons %') %>%
    gsub('\\.', ',', .) 
  
  
  tekst <- paste0('In heel de regio hebben xxx inwoners de vragenlijst ingevuld (respons xx,x%) waarvan ', aantal_resp,' in uw gemeente. De respons in uw gemeente was ', aantal_resp_perc,
                  '. In de leeftijdscategorie 18-64 jarigen was de respons ', aantal_18_64,
                  '. In de leeftijdscategorie 65 plus was de respons ', aantal_65,'.')
  return(tekst)

}
