# Functie om de excelconfiguratie om te zetten naar rapportages in Powerpoint
excel_to_ppt <- function(config_path) {
  
  # Alle tabbladen uit de Excelconfiguratie inlezen en opslaan in een list
  config <- config_path %>%
    readxl::excel_sheets() %>% 
    rlang::set_names() %>% 
    lapply(read_excel, path = config_path)
  
  # Alle datasets uit de rapportconfiguratie laden en opslaan in een list
  data <- config %>%   
    magrittr::extract2('reports') %>%
    dplyr::distinct(data_path) %>%
    dplyr::pull() %>%
    rlang::set_names() %>%
    lapply(read_sav)
  
  # Rapporten aanmaken door de create_ppt functie toe te passen op alle regels van de rapportconfiguratie
  purrr::pmap(.l = config$reports,
              .f = create_ppt,
              config = config,
              data = data)
  
}
