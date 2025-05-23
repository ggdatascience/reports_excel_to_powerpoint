# Functie om een Powerpoint rapportage te maken
create_ppt <- function(config, data, prefix = 'Rapportage', ...) {
  
  report_params <- list(...)
  template <- officer::read_pptx(report_params$template_path)
  
  safe_create_content <- purrr::safely(create_content)
  
  if (!exists("report_log", envir = .GlobalEnv)) {
    assign("report_log", list(), envir = .GlobalEnv)
  }
  
  slide_config <- config[[report_params$slideconfig_sheetname]]
  
  # String om fouten in op te slaan
  error_lines <- character(0)
  
  purrr::pmap(
    .l = slide_config,
    .f = function(...) {
      result <- safe_create_content(..., template = template, data = data, report_params = report_params)
      
      if (!is.null(result$error)) {
        row_number <- list(...)[["row_number"]]
        error_line <- paste0("⚠️  Regel ", row_number + 1, " in slideconfiguratie: ", result$error$message)
        error_lines <<- c(error_lines, error_line)
      }
      
      invisible(NULL)
    }
  )
  
  output_path <- paste0(prefix, ' ', report_params$report_name, '.pptx')
  print(template, output_path)
  
  cat("\014")
  
  # Bouw de tekstversie van het rapportlog
  if (length(error_lines) > 0) {
    log_text <- paste(
      paste0("Rapportnaam: ", report_params$report_name),
      paste(error_lines, collapse = "\n"),
      sep = "\n"
    )
  } else {
    log_text <- paste0("Rapportnaam: ", report_params$report_name, "\n✅ Geen errors")
  }
  
  report_log[[report_params$report_name]] <<- log_text
}
