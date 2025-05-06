type_population_table <- function(data, report_params, slide_params, h = 4, w = 18) {
  
  dimensions <- str_split_1(report_params$dim_name, ';\\s*')
  
  read_excel("data/population.xlsx") %>%
    filter(dim_name %in% dimensions) %>%
    mutate(`1%` = round(.[[2]] / 100),
           `5%` = round(.[[2]] / 20),
           `10%` = round(.[[2]] / 10),
           `25%` = round(.[[2]] / 4),
           `50%` = round(.[[2]] / 2)) %>%
    # rename(Rekenhulp = dim_name) %>%
    flextable() %>%
    set_header_labels(dim_name = "") %>%
    border_remove() %>%
    fontsize(size = 10, part = "all") %>%
    font(fontname = 'Calibri', part = "all") %>%
    align(align = "center", part = "all") %>%
    bg(bg = color_palette[1], part = 'header') %>%
    bg(bg = "lightgrey", part = 'body') %>% 
    color(color = "white", part = "header") %>%
    color(color = "black", part = "body") %>%
    border_outer(part="all", border = fp_border_default(width = 2, color = "white") ) %>%
    border_inner_h(border = fp_border_default(width = 2, color = "white"), part="all") %>%
    border_inner_v(border = fp_border_default(width = 2, color = "white"), part="all") %>%
    set_table_properties(layout = "fixed") %>%
    height_all(height = h/(length(dimensions) + 1), unit = 'cm') %>%
    width(width = w/7, unit = 'cm')
  
}
