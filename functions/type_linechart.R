type_linechart <- function(data, report_params, slide_params) {
  
  values <- compute_values_set(data, report_params, slide_params)
  
  ylimit <- ifelse(is.na(slide_params$ylimit), 1, as.numeric(slide_params$ylimit))
  
  plot <- ggplot(values, aes(x = time_val, y = p, color = dim_name)) +
    geom_line() +
    geom_point() +
    labs(title = slide_params$description,
         x = NULL,
         y = NULL,
         color = NULL) +
    theme(legend.position = "bottom",
          text = element_text(family = global_font),
          plot.title = element_text(size = 9, face = "bold", hjust = 0.5, color = "black", margin = margin(b = 10)),
          plot.title.position = "plot",
          axis.title.x = element_text(size = 9, color = "black"),
          axis.title.y = element_text(size = 9, color = "black"),
          axis.text.x = element_text(size = 9, color = "black"),
          axis.text.y = element_text(size = 9, color = "black"),
          panel.grid = element_blank(),
          axis.line = element_line(color = "black", linewidth = 0.5),
          axis.ticks = element_blank(),
          panel.background = element_rect(fill = "white"),
          plot.background = element_rect(fill = "white"),
          plot.margin = margin(t = 20, r = 20, b = 20, l = 20),
          legend.margin = margin(t = -10)) +
    scale_x_continuous(breaks = seq(min(values$time_val), max(values$time_val), 
                                    by = ifelse((max(values$time_val) - min(values$time_val)) %% 2 == 0, 2, 1))) +
    scale_y_continuous(limits = c(0, ylimit), 
                       breaks = seq(0, ylimit, by = ifelse(ylimit == 1, 0.2, 0.1)), 
                       labels = scales::percent_format(scale = 100, accuracy = 1), expand = c(0, 0)) +
    scale_color_manual(values = color_palette[c(1,3,5,2,4,6)])
  
  # Conditionally add labels
  if (length(unique(values$dim_name)) == 1) {
    
    plot <- plot + geom_text(aes(label = scales::percent(p, accuracy = 1)), vjust = -1, size = 3, show.legend = FALSE)
  
    } else {
    
    plot <- plot + geom_text_repel(aes(label = scales::percent(p, accuracy = 1)), size = 3, direction = "y", segment.size = 0.2, show.legend = FALSE)
  
    }
  
  return(plot)
  
}
