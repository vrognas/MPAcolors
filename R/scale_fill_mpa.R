#' Set Fill Scale for ggplot2 Plots Using Predefined Palettes
#'
#' Applies a discrete color scale for fill aesthetics in ggplot2 plots, using predefined color palettes.
#'
#' @param palette A string specifying the palette name. Defaults to 'complementary'.
#' @param direction A numeric value specifying the direction of the scale. Defaults to 1.
#' @param ... Additional arguments passed to ggplot2's discrete_scale function.
#'
#' @return A ggplot2 scale object.
#' @export
scale_fill_mpa <- function(palette = "complementary", direction = 1, ...) {
  ggplot2::discrete_scale(
    "fill",
    palette = palette_gen(palette, direction),
    ...
  )
}

#' Set Continuous Fill Scale for ggplot2 Plots
#'
#' Applies a continuous color gradient scale for fill aesthetics in ggplot2 plots, using predefined color palettes.
#'
#' @inheritParams scale_fill_mpa
#' @return A ggplot2 scale object.
#' @export
#' @importFrom ggplot2 scale_fill_gradientn
scale_fill_mpa_c <- function(palette = "highlight", direction = 1, ...) {
  pal <- palette_gen_c(palette = palette, direction = direction)

  ggplot2::scale_fill_gradientn(colors = pal(256), ...)
}
