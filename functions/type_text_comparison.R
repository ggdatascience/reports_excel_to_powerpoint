type_text_comparison <- function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params)

  content <- slide_params$description
  
  while (grepl("\\[.*?\\]", content)) {
    content <- replace_text(string = content, 
                            table = values, 
                            mode = "absolute")
  }

  return(content)
  
}
