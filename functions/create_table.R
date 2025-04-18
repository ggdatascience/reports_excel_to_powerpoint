# Functie om voor een specifiek rapport een specifieke rij in de slideconfiguratie cijfers te berekenen
create_table <- function(config_path, report_row = 1, slide_row = 1) {
  
  config <- config_path %>%
    readxl::excel_sheets() %>% 
    rlang::set_names() %>% 
    lapply(read_excel, path = config_path)

  report_params <- config$reports %>%
    slice(report_row)

  slide_params <- config[[report_params$slideconfig_sheetname]] %>%
    slice(slide_row)

  data <- config %>%   
    magrittr::extract2('reports') %>%
    dplyr::distinct(data_path) %>%
    dplyr::pull() %>%
    rlang::set_names() %>%
    lapply(read_sav)
  
  if (is.na(slide_params$var)) {
    
    cat('Let op! Voor deze regel is geen indicator (var) opgegeven en worden geen cijfers berekend\n\n')
    
    return(list(Report_params = report_params,
                Slide_params = slide_params))
           
  } else

  table <- compute_values_set(data, report_params, slide_params)
  
  return(list(Report_params = report_params,
              Slide_params = slide_params,
              Output = table))
  
}
