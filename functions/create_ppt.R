# Functie om een Powerpoint rapportage te maken
create_ppt <- function(config, data, prefix = 'Rapportage', ...) {
  
  report_params <- list(...)
  
  template <- officer::read_pptx(report_params$template_path)
  
  purrr::pmap(.l = config[[report_params$slideconfig_sheetname]],
              .f = create_content,
              template = template,
              data = data,
              report_params = report_params)
  
  print(template, paste0(prefix,' ', report_params$report_name, '.pptx'))
  
}

