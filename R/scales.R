#' Discrete scales to use for ggplot2
#'
#' These functions provide the option to use State of Minnesota discrete palette colors
#' with ggplot2. There are ten available discrete colors available.
#'
#' Available State of Minnesota color names are available in the `show_palette_mn` function.
#'
#' @param ... Arguments to pass on to `ggplot2::discrete_scale()`
#'
#' @return A `ScaleDiscrete` object that can be added to a `ggplot` object
#'
#' @name scale_discrete
#' @rdname scale_discrete
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @examples
#'
#' if (require("ggplot2")) {
#'   ggplot(mtcars, aes(x = mpg, y = hp, color = as.factor(carb))) +
#'     geom_point(size = 4) +
#'     scale_color_mn_d()
#' }
#' @export
#'
scale_color_mn_d <- function(...) {

  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = "mn",
    palette = mn_palette(),
    ...
  )
}
#' @rdname scale_discrete
#' @export
#'
scale_colour_mn_d <- scale_color_mn_d
#' @rdname scale_discrete
#' @export
#'
scale_fill_mn_d <- function(...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "mn",
    palette = mn_palette(),
    ...
  )
}
#' Continuous scales to use for ggplot2
#'
#' These functions provide the option to use State of Minnesota continuous palette colors
#' with ggplot2.
#'
#' Available State of Minnesota color names are available in the `show_palette_mn` function.
#'
#' @param high_color character color name or index value for high values. Defaults to "minnesota_blue". See `show_palette_mn` for all names.
#' @param low_color character color name or index value for low values. Defaults to "minnesota_green".
#' @param diverge logical value to indicate whether color values should diverge. Defaults to FALSE.
#' @param color_range numeric specifying the amount of lightening. Negative numbers cause darkening. Defaults to 0.75.
#' @param ... Arguments to pass on to `ggplot2::scale_color_gradient` (non-diverging) or
#' `ggplot2::scale_color_gradient2` (diverging)
#'
#' @return A `ScaleContinous` object that can be added to a `ggplot` object
#'
#' @name scale_continuous
#' @rdname scale_continuous
#'
#' @importFrom ggplot2 scale_color_gradient scale_color_gradient2
#' @importFrom colorspace lighten
#'
#' @examples
#'
#' if (require("ggplot2")) {
#'   ggplot(mtcars, aes(x = mpg, y = hp, color = wt)) +
#'     geom_point(size = 4) +
#'     scale_color_mn_c()
#' }
#' @export
#'
scale_color_mn_c <- function(
  diverge = FALSE,
  high_color = "minnesota_blue",
  low_color = "minnesota_green",
  color_range = 0.75,
  ...){

  if(diverge){

    high_mn <- mn_colors(high_color)
    low_mn <- mn_colors(low_color)

    ggplot2::scale_color_gradient2(
      low = low_mn,
      high = high_mn,
      ...
    )

  } else {

    high_mn <- mn_colors(high_color)
    low_mn <- colorspace::lighten(high_mn, amount = color_range)

    ggplot2::scale_color_gradient(
      low = low_mn,
      high = high_mn,
      ...
    )

  }

}
#' @rdname scale_continuous
#' @name scale_continuous
#'
#' @export
#'
scale_colour_mn_c <- scale_color_mn_c
#' @rdname scale_continuous
#' @name scale_continuous
#'
#' @export
#'
scale_fill_mn_c <- function(
  diverge = FALSE,
  high_color = "minnesota_blue",
  low_color = "minnesota_green",
  color_range = 0.75,
  ...){

  if(diverge){

    high_mn <- mn_colors(high_color)
    low_mn <- mn_colors(low_color)

    ggplot2::scale_fill_gradient2(
      low = low_mn,
      high = high_mn,
      ...
    )

  } else {

    high_mn <- mn_colors(high_color)
    low_mn <- colorspace::lighten(high_mn, amount = color_range)

    ggplot2::scale_fill_gradient(
      low = low_mn,
      high = high_mn,
      ...
    )

  }

}
