mpa_color <- function(...) {

  mpa_colors <- c(
    `mpa_blue` = "#143C64",    # RGB: ( 20,  60, 100)
    `mpa_blue_60` = "#728AA2", # RGB: (114, 138, 162)
    `mpa_blue_10` = "#E8ECF0", # RGB: (232, 236, 240)
    `green` = "#00C8DC",       # RGB: (  0, 200, 220)
    `green_60` = "#66DEEA",    # RGB: (102, 222, 234)
    `green_20` = "#CCF4F8",    # RGB: (204, 244, 248)
    `red` = "#FF5580",         # RGB: (255,  85, 128)
    `red_60` = "#FF99B4",      # RGB: (255, 153, 180)
    `red_20` = "#FFDDE6",      # RGB: (255, 221, 230)
    `yellow` = "#FFC850",      # RGB: (255, 200,  80)
    `yellow_60` = "#FFDE96",   # RGB: (255, 222, 150)
    `yellow_20` = "#FFF4DC",   # RGB: (255, 244, 220)
    `blue` = "#0096F0",        # RGB: (  0, 150, 240)
    `blue_60` = "#66C0F6",     # RGB: (102, 192, 246)
    `blue_20` = "#CCEAFC",      # RGB: (204, 234, 252)
    `mpa_blue_logo` = "#1F5BA5", # RGB: ( 31, 91, 165)
    `emergency_red` = "#E6000A" # RGB: ( 230, 0, 10)
  )

  cols <- c(...)

  if (is.null(cols))
    return (mpa_colors)

  mpa_colors[cols]
}
