type_barchart_stacked_combi <- function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params) %>%
    set_axis_factor_levels(vars = c('dim_name', 'value_label'), 
                            direction = slide_params$direction) %>%
    left_join(
      slide_params %>%
        as.data.frame() %>%
        select(var, var_label = value_label) %>%
        mutate(across(c(var, var_label), ~ .x %>% str_split(";\\s*"))) %>%
        unnest(cols = everything()),
      by = "var"
    ) %>%
    select(var_label, everything())
  
  colors <- if (is.na(slide_params$color_palette)) {
    color_palette[1:length(unique(values$value_label))] %>% 
      set_names(unique(values$value_label))
  } else {
    slide_params$color_palette %>%
      str_split(';\\s*') %>%
      unlist() %>%
      .[1:length(unique(values$value_label))] %>%
      set_names(unique(values$value_label))
  }
  
  values %>%
    ms_barchart(x = ifelse(!is.na(slide_params$grouping1), 'grouping1','var_label'),
                y = 'p',
                group = 'value_label') %>%
    chart_data_fill(colors) %>%
    set_chart_direction(slide_params$direction) %>%
    graph_style(graphtitle = unique(values$description),
                legendposition = ifelse(is.na(slide_params$legend_position),
                                        'b',
                                        slide_params$legend_position),
                labelposition = 'ctr',
                labelcolor = 'white',
                ticklabelposition = ifelse(is.na(slide_params$x_ticklabel_position), "low", slide_params$x_ticklabel_position),
                ylimit = ifelse(test = is.na(slide_params$ylimit), 
                                yes = 1, 
                                no = as.numeric(slide_params$ylimit))) %>%
    as_bar_stack(dir = ifelse(is.na(slide_params$direction), 'vertical', slide_params$direction))
  
}

