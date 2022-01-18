#' Format a flextable object for a Word or PowerPoint document
#'
#' This function provide the option to apply State of Minnesota template table formatting 
#' to flextable objects that can be rendered in R Markdown to Word or PowerPoint. 
#' This function applies the theme only to existing elements when the function is called, and
#' it should be applied only after all elements of the table have been added.
#'
#' @param ft_tbl flextable object created using the flextable package
#' @param last_row_bold logical value to indicate whether the last row should be bold. Defaults to FALSE.
#' @param color string value to apply color scheme. Defaults to "gray". Other options include "blue" and "green".
#' @param fontsize numeric value to set the size of all fonts in the table. Defaults to 11.
#' @param borders string value to indicate whether borders are "narrow" or "thick". Defaults to "narrow".
#'
#' @return A `flextable` object
#'
#' @name flextable_format
#' @rdname flextable_format
#'
#' @importFrom flextable fontsize font bold bg align border_remove border_outer border_inner padding
#' @importFrom officer fp_border
#' @importFrom rlang abort
#'
#' @examples
#'
#' if (require("flextable")) {
#'   ft <- flextable(head(mtcars))
#'   ft <- theme_ft_mn(ft)
#'   ft 
#' }
#' 
#' @export
#'
theme_ft_mn <- function(
  ft_tbl, 
  last_row_bold = FALSE,
  color = "gray",
  fontsize = 11,
  borders = "narrow"){
  
  # test parameters
  if (class(ft_tbl) != "flextable") {
    rlang::abort("object must be of class 'flextable'")
  }
  
  if (class(last_row_bold) != "logical") {
    rlang::abort("last_row_bold must be a logical value (TRUE/FALSE)")
  }
  
  if (!color %in% c("gray", "grey", "blue", "green")) {
    rlang::abort("color must be a valid name")
  }
  
  if (class(fontsize) != "numeric") {
    rlang::abort("fontsize must be a numeric value")
  }
  
  if (!borders %in% c("narrow", "thick")) {
    rlang::abort("borders must be a valid name (narrow/thick)")
  }
  
  # set colors
  if (color %in% c("gray", "grey")){
    
    header_bg <- "#D9D9D9"
    header_font_color <- "black"
    row_bg_odd <- "#F2F2F2"
    row_bg_even <- "white"
    row_font_color <- "black"
    border_color <- "#BFBFBF"
    
  } else if (color == "blue"){
    
    header_bg <- "#003865"
    header_font_color <- "white"
    row_bg_odd <- "#CBCED3"
    row_bg_even <- "#E7E8EA"
    row_font_color <- "#003865"
    border_color <- "white"
    
  } else {
    
    header_bg <- "#78BE21"
    header_font_color <- "white"
    row_bg_odd <- "#D6E8CC"
    row_bg_even <- "#ECF4E8"
    row_font_color <- "#003865"
    border_color <- "white"
    
  }
  
  # set border sizes
  if (borders == "narrow"){
    
    border_size <- 0.5
    border_size_header <- 0.5
    
  } else {
    
    border_size <- 1
    border_size_header <- 3
    
  }
  
  ft_rows <- ft_tbl$body$content$content$nrow
  odd <- seq(1, ft_rows, 2)
  even <- seq(2, ft_rows, 2)
  
  ft_tbl %>% 
    flextable::fontsize(size = fontsize, part = "all") %>% 
    flextable::font(fontname = "Calibri", part = "all") %>% 
    flextable::bold(bold = T, part = "header") %>% 
    flextable::bold(i = ft_rows, bold = last_row_bold, part = "body") %>% 
    flextable::bg(bg = header_bg, part = "header") %>% 
    flextable::color(color = header_font_color, part = "header") %>% 
    flextable::bg(i = odd, bg = row_bg_odd, part = "body") %>% 
    flextable::bg(i = even, bg = row_bg_even, part = "body") %>% 
    flextable::color(color = row_font_color, part = "body") %>% 
    flextable::align(align = "center", part = "header") %>% 
    flextable::border_remove() %>% 
    flextable::border_outer(border = officer::fp_border(color = border_color, width = border_size), part = "all") %>% 
    flextable::border_inner(border = officer::fp_border(color = border_color, width = border_size), part = "all") %>% 
    flextable::border(border.bottom = officer::fp_border(color = border_color, width = border_size_header), part = "header") %>% 
    flextable::padding(padding.top = 1.5, part = "all") %>% 
    flextable::padding(padding.bottom = 1.5, part = "all") %>% 
    flextable::align_text_col(align = "left", header = FALSE) %>% 
    flextable::align_nottext_col(align = "right", header = FALSE)
}
  