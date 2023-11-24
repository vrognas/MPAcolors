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
    "fill", "mpa",
    palette_gen(palette, direction),
    ...
  )
}
