type_date <- function(format = 2, ...) {
  
  if (format == 1)
  
  Sys.Date() %>% 
    format(format = "%d-%m-%Y")
  
  else if (format == 2)
    
  Sys.Date() %>%
    format("%e %B %Y")
  
}
