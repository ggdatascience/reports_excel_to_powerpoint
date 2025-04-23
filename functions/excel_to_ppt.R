excel_to_ppt <- function(config_path) {
  
  # Controleer of 'report_config' al bestaat in de global environment
  if (!exists("report_config", envir = .GlobalEnv)) {
    # Alle tabbladen uit de Excelconfiguratie inlezen en opslaan in een list
    report_config <<- config_path %>%
      readxl::excel_sheets() %>% 
      rlang::set_names() %>% 
      lapply(read_excel, path = config_path)
  }
  
  # Controleer of 'report_data' al bestaat in de global environment
  if (!exists("report_data", envir = .GlobalEnv)) {
    # Alle datasets uit de rapportconfiguratie laden en opslaan in een list
    report_data <<- report_config %>% 
      magrittr::extract2('reports') %>%
      dplyr::distinct(data_path) %>%
      dplyr::pull() %>%
      rlang::set_names() %>%
      lapply(read_sav)
  }
  
  # Rapporten aanmaken door de create_ppt functie toe te passen op alle regels van de rapportconfiguratie
  purrr::pmap(.l = report_config$reports,
              .f = create_ppt,
              config = report_config,
              data = report_data)
  
}
