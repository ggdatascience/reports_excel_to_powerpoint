type_barchart <- function(data, report_params, slide_params) {
  
  variant <- select_barchart_variant(slide_params)
  
  values <- compute_values_set(data, report_params, slide_params) %>%
    adjust_labels_by_variant(variant) %>%
    set_axis_factor_levels(vars = c(variant$x, variant$group), direction = slide_params$direction)
    
  
  values %>%
    ms_barchart(x = variant$x,
                y = "p",
                group = variant$group) %>%
    graph_style(graphtitle = unique(values$description),
                ylimit = ifelse(test = is.na(slide_params$ylimit), 
                                yes = 1, 
                                no = as.numeric(slide_params$ylimit))) %>%
    chart_data_fill(graph_color(values = values, variant = variant$group)) %>%
    set_chart_direction(slide_params$direction)
  
}
