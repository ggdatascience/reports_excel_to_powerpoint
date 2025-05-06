# Functie die de content aanmaakt en op de juiste plaats in de Powerpoint zet
create_content <- function(template, data, report_params, ...) {
  
  cat("\014")
  
  slide_params <- list(...)
  
  max_indent <- 40  # max aantal spaties naar rechts
  indent <- min(slide_params$row_number, max_indent)  # Beperk de verschuiving tot een max
  
  cat("\n----------------------------------------\n")
  cat(paste("📊 Rapportnaam:", report_params$report_name, "\n"))
  cat(paste("📄 Rij in slideconfiguratie:", 1 + slide_params$row_number, "\n"))
  
  # Simuleer een rijdende auto met spaties
  auto_line <- paste0(strrep(" ", indent), "🚎")
  cat(auto_line, "\n")
  
  cat("----------------------------------------\n\n")
  
  content <- get(paste0('type_', slide_params$type))(data = data, report_params = report_params, slide_params = slide_params)
  
  officer::on_slide(x = template, index = slide_params$slide_number) %>%
    officer::ph_with(value = content, location = ph_location_label(ph_label = slide_params$placeholder_name))
  
}
