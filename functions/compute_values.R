# Functie die cijfers berekent voor een specifieke regel in de slideconfiguratie
compute_values <- function(data, Nvar = 30, Ncel = 5, ...) {
  
  params <- data.frame(...)
  
  data_filtered <- data %>%
    filter(KLAS != 0) %>% # TIJDELIJKE OPLOSSING, MOET OPGELOST WORDEN IN DE DATA NIET IN HET SCRIPT
    filter(.[[params$dim_var]] %in% params$dim_val & .[[params$time_var]] %in% params$time_val) %>%
    select(all_of(setdiff(c(params$time_var, params$var, params$grouping1, params$grouping2, params$weight_var), NA)))
  
  data_filtered %>%
    group_by(across(all_of(setdiff(c(params$time_var, params$var, params$grouping1, params$grouping2), NA)))) %>%
    {if (params$weight_type == 'none') . else rename_with(., ~ str_replace(., params$weight_var, 'weight_var'), matches(params$weight_var))} %>%
    summarise(n_cel = n(),
              n_cel_weighted = ifelse(params$weight_type == 'none', NA, sum(weight_var)),
              .groups = 'drop') %>%
    drop_na(-n_cel_weighted) %>%
    group_by(across(all_of(setdiff(c(params$time_var, params$grouping1, params$grouping2), NA)))) %>%
    mutate(n_total = sum(n_cel),
           n_total_weighted = sum(n_cel_weighted),
           n_min = n_total-n_cel,
           p = ifelse(test = n_total < Nvar | n_cel < Ncel | n_min < Ncel | n_cel == n_total, 
                      yes = NA, 
                      no = if(params$weight_type == 'none') n_cel/n_total else n_cel_weighted/n_total_weighted) %>% as.numeric(),
           var = params$var,
           description = params$description,
           grouping1_var = params$grouping1,
           grouping2_var = params$grouping2,
           dim_var = params$dim_var,
           dim_name = params$dim_name,
           weight_var = params$weight_var) %>%
    {if (is.na(params$value)) . else filter_at(., vars(all_of(params$var)), function(x) x %in% params$value)} %>%
    ungroup() %>%
    rename(time_val = 1, value_label = 2) %>%
    {if (is.na(params$grouping1)) . else rename_with(., ~ str_replace(., params$grouping1, 'grouping1'), matches(params$grouping1))} %>%
    {if (is.na(params$grouping2)) . else rename_with(., ~ str_replace(., params$grouping2, 'grouping2'), matches(params$grouping2))} %>%
    {if (is.na(params$value_label)) . else recode_labels(., value_label, params$value_label)} %>%
    {if (is.na(params$grouping1_labels)) . else recode_labels(., grouping1, params$grouping1_labels)} %>%
    {if (is.na(params$grouping2_labels)) . else recode_labels(., grouping2, params$grouping2_labels)} %>%
    mutate(across(!n_cel & !n_cel_weighted & !n_total & !n_total_weighted & !n_min & !p & !time_val, to_character)) %>%
    select(var, description, value_label, time_val, dim_var, dim_name, grouping1_var, grouping2_var, weight_var, everything())

}
