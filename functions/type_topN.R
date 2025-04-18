type_topN <-  function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params)
  
  top <- str_extract(slide_params$description, "(?<=\\[)\\d+(?=\\])") %>% as.numeric()
  
  values %>%
    slice_max(p, n = top, na_rm = T) %>%
    {if (!is.na(slide_params$direction) && slide_params$direction == 'horizontal') {
      arrange(., desc(row_number()))
    } else .} %>%
    ms_barchart(x = 'value_label',
                y = 'p',
                group = NULL) %>%
    graph_style(graphtitle = str_replace(slide_params$description, "\\s*\\[\\d+\\]", ""),
                ylimit = ifelse(is.na(slide_params$ylimit), 1, as.numeric(slide_params$ylimit)),
                legendposition = 'n') %>%
    chart_data_fill(graph_color(values, type = 'default')) %>%
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
