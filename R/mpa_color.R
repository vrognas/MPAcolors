#' Define MPA colors
#'
#' This function returns the hex color codes for specified colors used by the MPA.
#' If no colors are specified, it returns all available colors.
#'
#' @param ... Character strings specifying the color names.
#'            If empty, all colors are returned.
#'
#' @return A named vector of hex color codes.
#' @export
#'
#' @examples
#' mpa_color("mpa_blue")
#' mpa_color("mpa_blue", "red")
#' mpa_color() # returns all colors
mpa_color <- function(...) {

  mpa_colors <- c(
    `mpa_blue` = "#143C64",      # RGB: ( 20,  60, 100)
    `mpa_blue_60` = "#728AA2",   # RGB: (114, 138, 162)
    `mpa_blue_30` = "#B8C4D0",   # RGB: (114, 138, 162)
    `mpa_blue_10` = "#E7EBEF",   # RGB: (232, 236, 240)
    `mpa_blue_05` = "#F3F5F7",   # RGB: (232, 236, 240)
    `blue_complement` = "#0096F0",          # RGB: (  0, 150, 240)
    `blue_complement_60` = "#66C0F6",       # RGB: (102, 192, 246)
    `blue_complement_20` = "#CCEAFC",       # RGB: (204, 234, 252)
    `yellow_complement` = "#FFC850",        # RGB: (255, 200,  80)
    `yellow_complement_60` = "#FFDE96",     # RGB: (255, 222, 150)
    `yellow_complement_20` = "#FFF4DC",     # RGB: (255, 244, 220)
    `turquoise_complement` = "#009fb3",         # RGB: (  0, 200, 220)
    `turquoise_complement_60` = "#66C5D1",      # RGB: (102, 222, 234)
    `turquoise_complement_20` = "#CCECF0",      # RGB: (204, 244, 248)
    `pink_complement` = "#D83F6C",           # RGB: (255,  85, 128)
    `pink_complement_60` = "#E88CA7",        # RGB: (255, 153, 180)
    `pink_complement_20` = "#F7D9E2",        # RGB: (255, 221, 230)
    `black_text` = "#191919",
    `white_text` = "#FFFFFF",
    `yellow_text` = "#FFC850",
    `gray_byline` = "#4C4C4C",
    `link` = "#006BAD",
    `link_visited` = "#4C97C5",
    `gray_byline` = "#4C4C4C",
    `mpa_blue_logo` = "#1F5BA5", # RGB: ( 31,  91, 165)
    `red_signal` = "#E6000A",  # RGB: ( 230,  0,  10)
    `green_signal` = "#37A437"
  )

  cols <- c(...)

  if (length(cols) == 0) {
    return(mpa_colors)
  } else {
    valid_colors <- cols %in% names(mpa_colors)
    if (all(valid_colors)) {
      return(mpa_colors[cols])
    } else {
      warning("Some requested colors are not defined. Returning available colors.")
      return(mpa_colors[cols[valid_colors]])
    }
  }
}
