#' Show Palette
#'
#' Display available State of MN named palette colors
#'
#' @rdname show_palette
#' @name show_palette
#'
#' @return A `ggplot` object
#' @export
#'
#' @importFrom ggplot2 geom_col scale_fill_identity coord_flip theme_void aes_string position_stack
#' @importFrom dplyr mutate
#' @importFrom tibble enframe
#' @importFrom magrittr %>%
#' @importFrom shadowtext geom_shadowtext
show_palette_mn <- function(){

  .mn_colors %>%
    tibble::enframe() %>%
    dplyr::mutate(row = dplyr::row_number() * -1) %>%
    ggplot2::ggplot(
      ggplot2::aes_string(x = row, y = 1, fill = "value", label = "name")) +
    ggplot2::geom_col() +
    ggplot2::scale_fill_identity() +
    ggplot2::coord_flip() +
    shadowtext::geom_shadowtext(position = ggplot2::position_stack(vjust = .5)) +
    ggplot2::theme_void()

}
