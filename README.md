
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MPAcolors

<!-- badges: start -->
<!-- badges: end -->

The goal of MPAcolors is to provide colors used by the Swedish Medical
Products Agency (MPA) in their publications and reports.

The package also provides functions to generate color palettes for use
in ggplot2 plots.

## Installation

You can install the development version of MPAcolors from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("vrognas/MPAcolors")
```

## Using these colors in plots

Let’s look at some examples to see the various ways these functions can
be used to customize colors with ggplot2. Below is a very simple bar
chart using the palmerpenguins::penguins data set.

``` r
library(MPAcolors)
library(ggplot2)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

The new mpa_color function can be used to specifically define a color.
In the plot below, mpa_color(“mpa_blue”) is the fill argument in the
geom_bar layer to make all of the bars that specific shade of mpa_blue

``` r
palmerpenguins::penguins |>
  count(species) |> 
  ggplot(aes(x = species, y = n)) +
  geom_bar(stat = "identity", fill = mpa_color("mpa_blue")) +
  labs(title = "The count of each species in the palmerpenguins data set") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  theme_linedraw() +
  theme(axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.grid.major.x = element_blank())
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

We could also add fill = species to the aes layer (meaning that each
species will have its own color) and then use scale_fill_mpa(palette =
“complementary”) to automatically apply our “complementary” color
palette.

``` r
palmerpenguins::penguins |>
  count(species) |> 
  ggplot(aes(x = species, y = n, fill = species)) +
  geom_bar(stat = "identity") +
  scale_fill_mpa(palette = "complementary") +
  labs(title = "The count of each species in the palmerpenguins data set") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  theme_linedraw() +
  theme(axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.position = "none",
        panel.grid.major.x = element_blank())
```

<img src="man/figures/README-fill-1.png" width="100%" />

Or if you want to use the custom colors but not a specific palette, add
a scale_fill_manual layer and specify the values using the mpa_color
function.

``` r
palmerpenguins::penguins |>
  count(species) |> 
  ggplot(aes(x = species, y = n, fill = species)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = 
                      unname(c(mpa_color("pink_complement_20","yellow_complement","mpa_blue_60")))) +
  labs(title = "The count of each species in the palmerpenguins data set") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  theme_linedraw() +
  theme(axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.position = "none",
        panel.grid.major.x = element_blank())
```

<img src="man/figures/README-custom-colors-1.png" width="100%" />

Lastly, below is an example of a continuous color scale, with our
scale_color_mpa_c function specifying the palette to be used.

``` r
palmerpenguins::penguins |>
  filter(!is.na(sex)) |> 
  ggplot(aes(x = sex, y = body_mass_g, color = bill_depth_mm)) +
  geom_jitter(size = 3, width = 0.3) +
  scale_color_mpa_c(palette = "highlight", direction = -1) +
  labs(
    title = "Bill depth and body mass by sex",
    y = "Body mass (g)",
    color = "Bill depth (mm)"
  ) +
  theme_linedraw() +
  theme(
    axis.ticks = element_blank(),
    axis.title.x = element_blank(),
    panel.grid.major.x = element_blank()
  )
```

<img src="man/figures/README-continuous-1.png" width="100%" />

### Complementary palette

``` r
scales::show_col(mpa_palette("complementary"), cex_label = 2)
```

<img src="man/figures/README-complementary-1.png" width="100%" />

### Highlight palette

``` r
scales::show_col(mpa_palette("highlight"), cex_label = 2)
```

<img src="man/figures/README-highlight-1.png" width="100%" />
