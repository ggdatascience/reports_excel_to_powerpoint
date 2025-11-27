type_table <- function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params)
  
  values %>%
    mutate(Respons = ifelse(var == dim_var, 'Totaal', value_label)) %>%
    select(Respons, Aantallen = n_cel) %>%
    flextable() %>%
    border_remove() %>%
    fontsize(size = 12, part = "all") %>%
    font(fontname = 'Century Gothic', part = "all") %>%
    align(align = "center", part = "all") %>%
    bg(bg = '#4450C6', part = 'header') %>%
    # bg(bg = '#6EA6FF', part = 'body') %>% 
    color(color = "white", part = "header") %>%
    bg(i = seq(1, nrow(values), 2), bg = '#DDE5FF', part = "body") %>%
    bg(i = seq(2, nrow(values), 2), bg = "#C5D3FF", part = "body") %>%
    hline(part = "all", border = fp_border(color = 'white', width = 1.5)) %>%
    vline(part = "all", border = fp_border(color = 'white', width = 1.5)) %>%
    width(width = 7.5, unit = 'cm') %>%
    height(height = 1, unit = 'cm') %>%
    colformat_num(j = "Aantallen", big.mark = "")
  
}
