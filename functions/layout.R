# Kleurpalet bepalen dat wordt gebruikt voor alle figuren die worden aangemaakt in R
color_palette <- c('#005C96', '#6FC7FF', '#E54800', '#FFB18E', '#FFE500', '#FFF6A3')

# Lettertype bepalen
global_font <- "Calibri"

# Grafiekinstellingen bepalen
# Het standaardlettertype 'Calibri' kun je aanpassen achter het functieargument font.
graph_style <- function(graph, 
                        font = global_font, 
                        graphtitle = NULL, 
                        legendposition = 'b', 
                        datalabels = T, 
                        labelposition = 'outEnd', 
                        labelcolor = 'black', 
                        ylimit = 1) {
  
  chart_theme <- mschart_theme(main_title = fp_text(font.size = 9, bold = TRUE, font.family = font, color = 'black'),
                               axis_title_x = fp_text(font.size = 9, font.family = font),
                               axis_title_y = fp_text(font.size = 9, font.family = font),
                               axis_text_x = fp_text(font.size = 8, font.family = font),
                               axis_text_y = fp_text(font.size = 9, font.family = font),
                               legend_text = fp_text(font.size = 9, font.family = font),
                               grid_major_line = fp_border(style = "none"),
                               axis_ticks_x =  fp_border(width = 1),
                               axis_ticks_y =  fp_border(width = 1),
                               legend_position = legendposition) 
  
  graph %>% set_theme(chart_theme) %>%
    chart_data_stroke('transparent') %>%
    chart_labels(title = graphtitle, xlab = NULL, ylab = NULL) %>%
    chart_ax_x(major_tick_mark = 'none') %>%
    chart_ax_y(limit_min = 0, num_fmt = '0%', major_tick_mark = 'none', limit_max = ylimit) %>%
    chart_data_labels(show_val = datalabels, num_fmt = '0%', position = labelposition) %>%
    chart_labels_text(fp_text(font.size = 8, font.family = font, color = labelcolor))
  
}

# Functie aanmaken om grafiekkleuren te bepalen
graph_color <- function(values, colors = color_palette, variant) {
  
  if(variant == "grouping1")
    
    colors[1:length(unique(values$grouping1))] %>% set_names(unique(values$grouping1))
  
  else if(variant == 'grouping2')
    
    colors[1:length(unique(values$grouping2))] %>% set_names(unique(values$grouping2))
  
  else if(variant == 'dim_name') 
    
    colors[c(1,3,5,2,4,6)][1:length(unique(values$dim_name))] %>% set_names(unique(values$dim_name))
  
  else colors[1]
  
}
