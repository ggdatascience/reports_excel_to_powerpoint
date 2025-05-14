excel_to_ppt <- function(config_path, 
                         reload_config = FALSE, 
                         reload_data = FALSE) {
  
  # Controleer of 'report_config' al bestaat in de global environment
  if (!exists("report_config", envir = .GlobalEnv) | reload_config == TRUE) {
    # Alle tabbladen uit de Excelconfiguratie inlezen en opslaan in een list
    report_config <<- config_path %>%
      readxl::excel_sheets() %>% 
      rlang::set_names() %>% 
      lapply(read_excel, path = config_path) %>%
      lapply(function(df) {
        df %>% mutate(row_number = row_number())
      })
    
  }
  
  # Controleer of 'report_data' al bestaat in de global environment
  if (!exists("report_data", envir = .GlobalEnv) | reload_data == TRUE) {
    # Alle datasets uit de rapportconfiguratie laden en opslaan in een list
    report_data <<- report_config %>% 
      magrittr::extract2('reports') %>%
      dplyr::distinct(data_path) %>%
      dplyr::pull() %>%
      rlang::set_names() %>%
      lapply(read_sav)
  }
  
  # Rapporten aanmaken door de create_ppt functie toe te passen op alle regels 
  # van de rapportconfiguratie
  purrr::pmap(.l = report_config$reports,
              .f = create_ppt,
              config = report_config,
              data = report_data)
  
  
  cat("✅ Alle rapporten zijn aangemaakt en opgeslagen in je working directory\n\n")
  
  purrr::walk(report_log, function(x) {
    cat(x, "\n\n")
  })
  rm(report_log, envir = .GlobalEnv)
  
}
