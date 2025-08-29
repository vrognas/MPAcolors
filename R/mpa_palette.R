#' Retrieve a Predefined Color Palette
#'
#' This function provides access to a set of predefined color palettes. It allows users to select a specific palette, each composed of various color shades. Additional parameters can modify the palette selection behavior.
#'
#' @param palette A character string specifying the name of the palette to retrieve. Accepted values are 'mpa_blues', 'complementary', 'complementary_60', 'complementary_20', 'complementary_all', and 'highlight'. Defaults to 'mpa_blues'.
#' @param ... Additional arguments passed to the color selection function (if applicable).
#'
#' @return A list of color values corresponding to the chosen palette.
#' @export
#'
#' @examples
#' mpa_palette("mpa_blues")
#' mpa_palette("complementary")
#' mpa_palette("highlight")
mpa_palette <- function(palette = "mpa_blues", ...) {
  mpa_palettes <- list(
    `mpa_blues` = mpa_color(
      "mpa_blue",
      "mpa_blue_60",
      "mpa_blue_30",
      "mpa_blue_10",
      "mpa_blue_05"
    ),
    `complementary` = mpa_color(
      "blue_complement",
      "yellow_complement",
      "turquoise_complement",
      "pink_complement"
    ),
    `complementary_60` = mpa_color(
      "blue_complement_60",
      "yellow_complement_60",
      "turquoise_complement_60",
      "pink_complement_60"
    ),
    `complementary_20` = mpa_color(
      "blue_complement_20",
      "yellow_complement_20",
      "turquoise_complement_20",
      "pink_complement_20"
    ),
    `complementary_all` = mpa_color(
      "blue_complement",
      "blue_complement_60",
      "blue_complement_20",
      "yellow_complement",
      "yellow_complement_60",
      "yellow_complement_20",
      "turquoise_complement",
      "turquoise_complement_60",
      "turquoise_complement_20",
      "pink_complement",
      "pink_complement_60",
      "pink_complement_20"
    ),
    `highlight` = mpa_color("mpa_blue", "yellow_complement")
  )

  mpa_palettes[[palette]]
}
