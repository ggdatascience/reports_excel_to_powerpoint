type_topN <-  function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params)
  
  top <- str_extract(slide_params$description, "(?<=\\[)\\d+(?=\\])") %>% as.numeric()
  
  values %>%
    slice_max(p, n = top, na_rm = T) %>%
    set_axis_factor_levels(vars = "value_label", direction = slide_params$direction) %>%
    ms_barchart(x = 'value_label',
                y = 'p',
                group = 'dim_name') %>%
    graph_style(graphtitle = str_replace(slide_params$description, "\\s*\\[\\d+\\]", ""),
                ylimit = ifelse(is.na(slide_params$ylimit), 1, as.numeric(slide_params$ylimit)),
                legendposition = 'b') %>%
    chart_data_fill(graph_color(values, variant = 'dim_name')) %>%
    set_chart_direction(slide_params$direction)
  
}
