#' @importFrom rlang abort
.mn_colors <- c(
  minnesota_blue = "#003865",
  minnesota_green = "#78BE21",
  accent_teal = "#008EAA",
  accent_green = "#0D5257",
  accent_orange  = "#8D3F2B",
  accent_purple = "#5D295F",
  accent_blue_gray = "#A4BCC2",
  accent_cream = "#F5E1A4",
  accent_sky_blue = "#9BCBEB",
  accent_gold = "#FFC845")

# This function takes a character or integer index
mn_colors <- function(index = NULL, named = FALSE) {
  # Default to everything
  if (is.null(index)) {
    index <- names(.mn_colors)
  }

  # This works with integer or character values
  return_value <- .mn_colors[index]

  if (!named) {
    names(return_value) <- NULL
  }

  return(return_value)
}

mn_color_names <- function() {
  names(.mn_colors)
}

mn_palette <- function() {

  mn_color_length <- length(mn_colors())

  function(n) {
    if (n > mn_color_length) {
      rlang::abort(paste0("discrete values must be fewer than ", mn_color_length))
    }
    
    # stopifnot(n <= mn_color_length)

    color_indices <-
      if (n == 1) { "minnesota_blue" }
      else if (n == 2) { c("minnesota_blue",
                           "minnesota_green") }
      else if (n == 3) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange") }
      else if (n == 4) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange",
                           "accent_gold") }
      else if (n == 5) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange",
                           "accent_gold",
                           "accent_purple") }
      else if (n == 6) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange",
                           "accent_gold",
                           "accent_purple",
                           "accent_cream") }
      else if (n == 7) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange",
                           "accent_gold",
                           "accent_purple",
                           "accent_cream",
                           "accent_teal") }
      else if (n == 8) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange",
                           "accent_gold",
                           "accent_purple",
                           "accent_cream",
                           "accent_teal",
                           "accent_blue_gray") }
      else if (n == 9) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange",
                           "accent_gold",
                           "accent_purple",
                           "accent_cream",
                           "accent_teal",
                           "accent_blue_gray",
                           "accent_green") }
      else if (n == 10) { c("minnesota_blue",
                           "minnesota_green",
                           "accent_orange",
                           "accent_gold",
                           "accent_purple",
                           "accent_cream",
                           "accent_teal",
                           "accent_blue_gray",
                           "accent_green",
                           "accent_sky_blue") }

    return(mn_colors(color_indices))
  }
}
