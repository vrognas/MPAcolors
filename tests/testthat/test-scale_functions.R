library(testthat)
library(ggplot2)

# Test scale_colour_mpa function
test_that("scale_colour_mpa creates proper ggplot scale", {
  scale <- scale_colour_mpa()
  expect_s3_class(scale, "Scale")
  expect_equal(scale$aesthetics, "colour")

  # Test with different palette
  scale_highlight <- scale_colour_mpa(palette = "highlight")
  expect_s3_class(scale_highlight, "Scale")
})

# Test scale_color_mpa alias
test_that("scale_color_mpa is identical to scale_colour_mpa", {
  expect_identical(scale_color_mpa, scale_colour_mpa)
})

# Test scale_fill_mpa function
test_that("scale_fill_mpa creates proper ggplot scale", {
  scale <- scale_fill_mpa()
  expect_s3_class(scale, "Scale")
  expect_equal(scale$aesthetics, "fill")

  # Test with different palette
  scale_blues <- scale_fill_mpa(palette = "mpa_blues")
  expect_s3_class(scale_blues, "Scale")
})

# Test continuous color scale
test_that("scale_colour_mpa_c creates continuous scale", {
  scale <- scale_colour_mpa_c()
  expect_s3_class(scale, "Scale")
  expect_equal(scale$aesthetics, "colour")

  # Test with different palette and direction
  scale_reversed <- scale_colour_mpa_c(palette = "highlight", direction = -1)
  expect_s3_class(scale_reversed, "Scale")
})

# Test scale_color_mpa_c alias
test_that("scale_color_mpa_c is identical to scale_colour_mpa_c", {
  expect_identical(scale_color_mpa_c, scale_colour_mpa_c)
})

# Test continuous fill scale
test_that("scale_fill_mpa_c creates continuous scale", {
  scale <- scale_fill_mpa_c()
  expect_s3_class(scale, "Scale")
  expect_equal(scale$aesthetics, "fill")

  # Test with different palette and direction
  scale_reversed <- scale_fill_mpa_c(palette = "highlight", direction = -1)
  expect_s3_class(scale_reversed, "Scale")
})

# Test direction parameter
test_that("direction parameter works for discrete scales", {
  scale_normal <- scale_colour_mpa(direction = 1)
  scale_reversed <- scale_colour_mpa(direction = -1)

  expect_s3_class(scale_normal, "Scale")
  expect_s3_class(scale_reversed, "Scale")
})

# Integration test with ggplot
test_that("scales work with ggplot objects", {
  skip_if_not_installed("palmerpenguins")

  # Create a simple plot to test integration
  p <- ggplot(
    data.frame(x = 1:3, y = 1:3, group = letters[1:3]),
    aes(x, y, color = group)
  ) +
    geom_point() +
    scale_colour_mpa()

  expect_s3_class(p, "ggplot")

  # Test fill scale
  p_fill <- ggplot(
    data.frame(x = 1:3, y = 1:3, group = letters[1:3]),
    aes(x, y, fill = group)
  ) +
    geom_col() +
    scale_fill_mpa()

  expect_s3_class(p_fill, "ggplot")
})
