# Functie die de juiste grafiek variant selecteert
select_barchart_variant <- function(slide_params) {
  
  param_mode <- function(param) {
    if (is.na(param)) {
      0
    } else {
      ifelse(str_detect(param, ';\\s*'), 2, 1)
    }
  }
  
  barchart_variants <- data.frame(
    variant = paste("variant", 1:18),
    var = c(1,2,1,2,1,2,1,2,1,2,1,1,2,1,1,2,1,1),
    grouping1 = c(0,0,0,0,1,1,0,0,1,1,0,2,2,0,1,1,2,0),
    grouping2 = c(0,0,0,0,0,0,1,1,0,0,1,0,0,2,1,1,0,2),
    dim_var = c(1,1,2,2,1,1,1,1,2,2,2,1,1,1,1,1,2,2),
    x = c("value_label", "value_label", "value_label", "value_label", 
          "grouping1", "value_label", "value_label", "value_label",
          "grouping1", "value_label", "dim_name", "grouping1", 
          "value_label", "dim_name", "grouping1", "value_label", 
          "grouping1", "dim_name"),
    group = c("dim_name", "dim_name", "dim_name", "dim_name",
              "dim_name", "grouping1", "grouping2", "grouping2",
              "dim_name", "dim_name", "grouping2", "grouping1_var", 
              "grouping1", "grouping2", "grouping2", "grouping1", 
              "dim_name", "grouping2"))
  
  barchart_variants %>%
    filter(
      var        == param_mode(slide_params$var),
      grouping1  == param_mode(slide_params$grouping1),
      grouping2  == param_mode(slide_params$grouping2),
      dim_var    == param_mode(slide_params$dim_var))

}

# Functie om grafiekrichting te veranderen
set_chart_direction<- function(chart, direction) {
  
  if (!is.na(direction) && direction == "horizontal") {
    chart_settings(x = chart, dir = "horizontal", gap_width = 30, overlap = -30)
  } else {
    chart
  }
  
}

# Functie om labels samen te voegen indien nodig
adjust_labels_by_variant <- function(df, variant) {
  
  if (!"grouping1" %in% names(df)) df$grouping1 <- NA_character_
  if (!"grouping2" %in% names(df)) df$grouping2 <- NA_character_
  
  df %>%
    mutate(
      value_label = if ("variant 10" %in% variant$variant) 
        glue::glue("{value_label} ({grouping1})", .na = "") else value_label,
      grouping1 = if ("variant 16" %in% variant$variant) 
        glue::glue("{grouping1} ({grouping2})", .na = "") else grouping1
    )

}

# Functie om factor levels om te keren voor liggende figuren
set_axis_factor_levels <- function(data, vars, direction) {
  
  walk(vars, function(var) {
    if (var %in% names(data)) {
      levels <- unique(data[[var]])
      if (!is.na(direction) && direction == "horizontal") {
        levels <- rev(levels)
      }
      data[[var]] <<- factor(data[[var]], levels = levels, ordered = TRUE)
    }
  })
  data
  
}

# Functie om labels te hercoderen
recode_labels <- function(data, label_var, label_string) {
  
  labels <- str_split_1(label_string, ';\\s*')
  
  recode_vector <- setNames(as.numeric(str_extract(labels, "^[0-9]")),
                            str_extract(labels, "(?<= = ).*"))
  
  suppressMessages({
    data %>%
      mutate({{ label_var }} := replace_labels({{ label_var }}, 
                                               labels = recode_vector))
  })
  
}

# Functie om text te vervangen en twee groupen te vergelijken
replace_text <- function(string, 
                         table, 
                         mode, 
                         relative_percentage = 0.15,
                         absolute_percentage = 0.03,
                         threshold = 0.1) {
  
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
  
  if (mode == "relative") {
  
  # Compare subgroup percentages and determine the correct replacement text
  replacement_text <- if (abs(p1 - p2) / ((p1 + p2) / 2) < relative_percentage) { 
    comparison_text[1]
  } else if (p1 > p2) {
    comparison_text[2]
  } else {
    comparison_text[3]
  }
  
  }
  
  else if (mode == "absolute") {
    
    abs_percentage <- if (p1 < threshold && p2 < threshold) {
      absolute_percentage * (2/3)
    } else {
      absolute_percentage
    }
    
    # Compare subgroup percentages and determine the correct replacement text
    replacement_text <- if (abs(p1 - p2) < abs_percentage) {
      comparison_text[1]
    } else if (p1 > p2) {
      comparison_text[2]
    } else {
      comparison_text[3]
    }
    
    
  }
  
  # Replace the comparison text options with the correct replacement text
  string <- string %>% str_replace("\\[[^\\]]*;[^\\]]*\\]", replacement_text) %>%
    str_replace_all('  ', ' ') %>%
    str_replace_all(" \\.", '.')
  
  # Return the string
  return(string)
  
}
