# Functie om labels te hercoderen
recode_labels <- function(data, label_var, label_string) {
  
  labels <- str_split_1(label_string, ';\\s*')
  
  recode_vector <- setNames(as.numeric(str_extract(labels, "^[0-9]")),
                            str_extract(labels, "(?<= = ).*"))
  
  suppressMessages({
    data %>%
      mutate({{ label_var }} := replace_labels({{ label_var }}, labels = recode_vector))
  })
  
}
