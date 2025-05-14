# Functie om parameters te 'unnesten' zodat deze kan worden gebruikt om de benodigde cijfers te berekenen
compute_values_set <- function(data, report_params, slide_params) {
  
  # Report parameters splitsen in meerdere rijen voor 'nested' regels (= regels met meer dan 1 waarde per cel)
  df_report_params <- report_params %>%
    data.frame() %>%
    mutate(across(c(data_path, dim_vars, dim_val, dim_name, weight_var), ~ .x %>% str_split(';\\s*'))) %>%
    unnest(cols = everything())
  
  # Slide parameters splitsen in meerdere rijen voor 'nested' regels (= regels met meer dan 1 waarde per cel) en
  # slide en report parameters samenvoegen tot een dataframe
  df_params <- slide_params %>%
    data.frame() %>%
    mutate(across(c(var, value, value_label, grouping1, grouping2, dim_var, time_val, weight_var), ~ .x %>% str_split(';\\s*'))) %>%
    unnest(cols = c(var, value, value_label)) %>%
    unnest(grouping1) %>%
    unnest(grouping2) %>%
    unnest(dim_var) %>%
    unnest(cols = c(time_val, weight_var)) %>%
    mutate(weight_var = ifelse(test = weight_type == 'dim',
                               yes = df_report_params$weight_var[match(.$dim_var, df_report_params$dim_vars)],
                           no = weight_var)) %>%
    cbind(df_report_params[match(.$dim_var, df_report_params$dim_vars), ])

  # compute_values functie toepassen op de parameters (df_params)
  purrr::pmap(.l = df_params,
              .f = compute_values,
              data = data %>% `[[`(report_params$data_path)) %>% # Dataset selecteren uit lijst van datasets
    reduce(bind_rows) %>%
    mutate(across(intersect(names(.), c('dim_name', 'value_label', 'grouping1', 'grouping2')), ~factor(.x, levels = unique(.x), ordered = T)))
  
}
