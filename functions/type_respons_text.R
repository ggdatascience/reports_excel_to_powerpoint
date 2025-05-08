type_respons_text <- function(data, report_params, slide_params, h = 4, w = 18) {
  
  dimensions <- str_split_1(report_params$dim_name, ';\\s*')
  # Let op: de report naam dient gelijk te zijn aan het gebied in het Excel bestand
  read_excel("data/respons_data.xlsx") %>%
    filter(gebied == report_config$reports$report_name) %>%
    select(!gebied) %>%
    mutate('Respons %' = paste(round((aantal_response / aantal_uitnodigingen)*100, digits = 1),"%", sep = "")) %>%
    select('Respons %') %>%
    slice(2:3) %>%
    unlist(use.names = FALSE) %>%
    gsub('\\.', ',', .) %>%
    paste0('De respons in uw gemeente voor de groep 18-64 jaar is ',.[[1]],'. Voor 65+ is dit ',.[[2]],'.') %>%
    first(.) %>%
    substr(., 6, nchar(.)) # Dit is een werkende oplossing (wegsnoeien eerste vier karakters)

}