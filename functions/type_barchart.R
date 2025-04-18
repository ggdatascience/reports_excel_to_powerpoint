type_barchart <- function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params)
  
  x_axis_grouping <- (!is.na(slide_params$grouping1) && str_detect(slide_params$grouping1, ';'))
  
  values %>%
    {if (!is.na(slide_params$direction) && slide_params$direction == 'horizontal') {
      arrange(., desc(row_number()))
    } else .} %>%
    ms_barchart(x = if (x_axis_grouping | all(c('grouping1', 'grouping2') %in% names(values))) {'grouping1'} else {'value_label'},
                y = 'p',
                group = if ('grouping2' %in% names(values)) { 
                  'grouping2'
                } else if (x_axis_grouping) {
                  NULL
                } else if ('grouping1' %in% names(values) && !'grouping2' %in% names(values)) {
                  'grouping1'
                } else if (any(!c('grouping1', 'grouping2') %in% names(values))) {
                  'dim_name'
                } else NULL) %>%
    graph_style(graphtitle = unique(values$description),
                ylimit = ifelse(is.na(slide_params$ylimit), 1, as.numeric(slide_params$ylimit)),
                legendposition = if ((!x_axis_grouping && any(c('grouping1', 'grouping2') %in% names(values))) | length(unique(values$dim_name)) > 1) 'b' else 'n') %>%
    chart_data_fill(graph_color(values, type = ifelse(x_axis_grouping, 'x-axis', 'default'))) %>%
    {if (!is.na(slide_params$direction) && slide_params$direction == 'horizontal') {
      chart_settings(x = .,
                     dir = "horizontal",
                     gap_width = 30,
                     overlap = -30)
    } else {
        .
    }
    }
  
}
