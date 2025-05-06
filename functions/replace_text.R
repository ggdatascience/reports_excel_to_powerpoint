# Functie om text te vervangen en twee groupen te vergelijken
replace_text <- function(string, table, relative_percentage = 0.15) {
  
  # Extract first subgroup
  subgroup1 <- string %>% 
    str_extract('(?<=\\[)[^\\]]+(?=\\])') %>% 
    str_split_1('\\s*=\\s*')
  
  # Select value for first subgroup
  p1 <- table %>%
    filter(!!sym(subgroup1[1]) == subgroup1[2]) %>%
    select(p)
  
  # Remove first subgroup from string
  #string <- string %>% str_remove("\\[[^\\]]*?\\]")
  string <- string %>% str_replace("\\[[^\\]]*?\\]", paste0("(",(round(p1*100)), "%)"))
  
  # Extract second subgroup
  subgroup2 <- string %>% 
    str_extract("(?<=\\[)[^\\]]*?=[^\\]]*?(?=\\])") %>%
    str_split_1('\\s*=\\s*')
  
  # Select value for second subgroup
  p2 <- table %>%
    filter(!!sym(subgroup2[1]) == subgroup2[2]) %>%
    select(p)
  
  # Remove second subgroup from string
  # string <- string %>% str_remove("\\[[^\\]]*?=[^\\]]*?\\]")
  string <- string %>% str_replace("\\[[^\\]]*?=[^\\]]*?\\]", paste0("(",(round(p2*100)), "%)"))
  
  # Extract comparison text options
  comparison_text <- string %>% 
    str_extract("(?<=\\[)[^\\]]*;[^\\]]*(?=\\])") %>% 
    str_split(";\\s*") %>%
    unlist()
  
  # Compare subgroup percentages and determine the correct replacement text
  replacement_text <- if (abs(p1 - p2) / ((p1 + p2) / 2) < relative_percentage) { 
    comparison_text[1]
  } else if (p1 > p2) {
    comparison_text[2]
  } else {
    comparison_text[3]
  }
  
  # Replace the comparison text options with the correct replacement text
  string <- string %>% str_replace("\\[[^\\]]*;[^\\]]*\\]", replacement_text) %>%
    str_replace_all('  ', ' ') %>%
    str_replace_all(" \\.", '.')
  
  # Return the string
  return(string)
  
}
