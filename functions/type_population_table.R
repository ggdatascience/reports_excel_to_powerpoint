type_population_table <- function(data, report_params, slide_params, h = 4, w = 10) {
  # De kolom CBS dient toegevoegd te worden aan het Excel bestand met hierin de gemeentecode GMXXXX
  # Het jaartal is ingelezen met behulp van de slide instelling time_val.
  df_cbs <- report_params$cbs_dim_code
  jaar <- slide_params$time_val
  bevolking_1jan_gm <- cbs_get_data("03759ned", catalog = "CBS", Perioden=paste(jaar,"JJ00",sep=""), BurgerlijkeStaat = "T001019", 
                                    Geslacht = "T001038", RegioS = df_cbs)
  
  bevolking_1jan_gm <- bevolking_1jan_gm %>%
    filter(Leeftijd > 11700) %>%
    filter(!Leeftijd == 10000) %>%
    filter(!Leeftijd == 22300) %>%
    filter(!Leeftijd == 22000) %>%
    select(BevolkingOp1Januari_1) %>%
    mutate(BevolkingOp1Januari_1=sum(BevolkingOp1Januari_1)) %>%
    mutate(`1%` = round(BevolkingOp1Januari_1 / 100),
           `5%` = round(BevolkingOp1Januari_1 / 20),
           `10%` = round(BevolkingOp1Januari_1 / 10),
           `25%` = round(BevolkingOp1Januari_1 / 4),
           `50%` = round(BevolkingOp1Januari_1 / 2)) %>%
    filter(row_number()==1) %>%
    rename(!!report_params$report_name := BevolkingOp1Januari_1) %>%
    flextable() %>%
    set_header_labels(dim_name = "") %>%
    border_remove() %>%
    fontsize(size = 10, part = "all") %>%
    font(fontname = global_font, part = "all") %>%
    align(align = "center", part = "all") %>%
    bg(bg = color_palette[1], part = 'header') %>%
    bg(bg = "white", part = 'body') %>% 
    color(color = "white", part = "header") %>%
    color(color = "black", part = "body") %>%
    border_outer(part="all", border = fp_border_default(width = 2, color = "white") ) %>%
    border_inner_h(border = fp_border_default(width = 2, color = "white"), part="all") %>%
    border_inner_v(border = fp_border_default(width = 2, color = "white"), part="all") %>%
    set_table_properties(layout = "fixed") %>%
    width(width = w/7, unit = 'cm') %>%
    width(j=1, width = w/12) %>% # Breedte linkerkolom meer gemaakt zodat gemeentenaam beter uitkomt.
    colformat_num(big.mark = "", digits = 0) # Toevoeging; geen komma's of punten in cijfers
  
}
