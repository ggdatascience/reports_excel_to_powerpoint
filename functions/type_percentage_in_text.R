type_percentage_in_text <- function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params) %>%
    mutate(p = ifelse(is.na(p), '-', paste0(round(p*100), '%')))
  
  reduce2(values$var, values$p,  .init = slide_params$description, str_replace)
  
}
