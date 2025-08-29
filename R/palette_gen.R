#' Generate a Color Palette Function for Discrete Scales
#'
#' `palette_gen` is a factory function that creates a function for generating color palettes.
#' This inner function is designed to be used with `scale_fill` and `scale_color` functions
#' in plotting contexts, providing a specific number of colors from the selected palette.
#'
#' @param palette A character string indicating the name of the color palette.
#'        Accepted values include 'complementary' and others as defined in `mpa_palette`.
#'        Defaults to 'complementary'.
#' @param direction An integer indicating the direction of the color scale.
#'        Use 1 for normal order and -1 to reverse the order. Defaults to 1.
#'
#' @return Returns a function that, when called with an integer `n`,
#'         generates a vector of `n` color values from the specified palette.
#'         This function warns if `n` exceeds the number of colors available in the palette.
palette_gen <- function(palette = "complementary", direction = 1) {
  function(n) {
    pal <- mpa_palette(palette)

    # Return NULL if palette doesn't exist
    if (is.null(pal)) {
      return(NULL)
    }

    if (n > length(pal)) {
      warning("Not enough colors in this palette!")
    } else {
      all_colors <- unname(unlist(pal))

      all_colors <- if (direction >= 0) all_colors else rev(all_colors)

      color_list <- all_colors[1:n]
    }
  }
}

#' @importFrom grDevices colorRampPalette
palette_gen_c <- function(palette = "highlight", direction = 1, ...) {
  pal <- mpa_palette(palette)

  pal <- if (direction >= 0) pal else rev(pal)

  colorRampPalette(pal, ...)
}
