# Functie om voor een specifiek rapport een specifieke rij in de slideconfiguratie cijfers te berekenen
create_table <- function(config_path, 
                         report_row, 
                         slide_row, 
                         reload_config = FALSE, 
                         reload_data = FALSE) {
  
  if (report_row < 2) {
    stop("Fout: 'report_row' moet minimaal 2 zijn omdat rij 1 de kolomnamen bevat.")
  }
  
  if (slide_row < 2) {
    stop("Fout: 'slide_row' moet minimaal 2 zijn omdat rij 1 de kolomnamen bevat.")
  }
  
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

  report_params <- report_config$reports %>%
    slice(report_row - 1)

  slide_params <- report_config[[report_params$slideconfig_sheetname]] %>%
    slice(slide_row - 1)

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
  
  if (is.na(slide_params$var)) {
    
    cat('Let op! Voor deze regel is geen indicator (var) opgegeven en worden geen cijfers berekend\n\n')
    
    return(list(Report_params = report_params,
                Slide_params = slide_params))
           
  } else

  table <- compute_values_set(report_data, report_params, slide_params)

  return(list(Report_params = report_params,
              Slide_params = slide_params,
              Output = table))
  
}
