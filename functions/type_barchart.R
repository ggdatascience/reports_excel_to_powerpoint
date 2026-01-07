type_barchart <- function(data, report_params, slide_params) {
  
  variant <- select_barchart_variant(slide_params)
  
  values <- compute_values_set(data, report_params, slide_params) %>%
    adjust_labels_by_variant(variant) %>%
    set_axis_factor_levels(vars = c(variant$x, variant$group), 
                           direction = slide_params$direction)
    
  values %>%
    ms_barchart(x = variant$x,
                y = "p",
                group = variant$group) %>%
    chart_data_fill(graph_color(values = values, 
                                variant = variant$group, 
                                colors = if (is.na(slide_params$color_palette)) {
                                  color_palette
                                } else {
                                  slide_params$color_palette %>%
                                    str_split(';\\s*') %>%
                                    unlist()
                                })) %>%
    set_chart_direction(slide_params$direction) %>%
    chart_settings(overlap = ifelse(variant$group == "grouping1_var", 100, 0)) %>%
    graph_style(graphtitle = if (!is.na(slide_params$graph_title) && slide_params$graph_title == "none") {
      NULL
    } else {
      slide_params$description
    },
                legendposition = ifelse(is.na(slide_params$legend_position),
                                        "b",
                                        slide_params$legend_position),
                ticklabelposition = ifelse(is.na(slide_params$x_ticklabel_position), "low", slide_params$x_ticklabel_position),
                ylimit = ifelse(test = is.na(slide_params$ylimit), 
                                yes = 1, 
                                no = as.numeric(slide_params$ylimit)))
  
}



