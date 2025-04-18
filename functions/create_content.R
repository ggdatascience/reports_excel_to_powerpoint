# Functie die de content aanmaakt en op de juiste plaats in de Powerpoint zet
create_content <- function(template, data, report_params, ...) {
  
  slide_params <- list(...)
  
  content <- get(paste0('type_', slide_params$type))(data = data, report_params = report_params, slide_params = slide_params)
  
  officer::on_slide(x = template, index = slide_params$slide_number) %>%
    officer::ph_with(value = content, location = ph_location_label(ph_label = slide_params$placeholder_name))
  
}

