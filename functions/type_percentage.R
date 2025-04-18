type_percentage <- function(data, report_params, slide_params) {
  
  compute_values_set(data, report_params, slide_params) %>%
    mutate(p = round(p*100)) %>%
    pull(p) %>%
    {if(length(.) != 1) '-' 
      else if(is.na(.)) '-' 
      else paste0(., '%')}
  
}
