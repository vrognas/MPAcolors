library(testthat)

# Test palette_gen function
test_that("palette_gen creates function that generates colors", {
  gen_func <- palette_gen()
  expect_type(gen_func, "closure")

  # Test generated function returns colors
  colors <- gen_func(3)
  expect_length(colors, 3)
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", colors)))
})

# Test palette_gen with different palettes
test_that("palette_gen works with different palettes", {
  # Test with highlight palette
  highlight_gen <- palette_gen("highlight")
  colors <- highlight_gen(2)
  expect_length(colors, 2)

  # Test with mpa_blues palette
  blues_gen <- palette_gen("mpa_blues")
  colors <- blues_gen(3)
  expect_length(colors, 3)
})

# Test direction parameter
test_that("palette_gen respects direction parameter", {
  gen_normal <- palette_gen("complementary", direction = 1)
  gen_reversed <- palette_gen("complementary", direction = -1)

  colors_normal <- gen_normal(4)
  colors_reversed <- gen_reversed(4)

  expect_length(colors_normal, 4)
  expect_length(colors_reversed, 4)
  expect_equal(colors_normal, rev(colors_reversed))
})

# Test warning when requesting too many colors
test_that("palette_gen warns when requesting too many colors", {
  gen_func <- palette_gen("highlight") # Only has 2 colors
  expect_warning(gen_func(5), "Not enough colors in this palette!")
})

# Test palette_gen_c continuous function
test_that("palette_gen_c creates color ramp function", {
  ramp_func <- palette_gen_c("highlight")
  expect_type(ramp_func, "closure")

  # Test generated function
  colors <- ramp_func(10)
  expect_length(colors, 10)
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", colors)))
})

# Test palette_gen_c with direction
test_that("palette_gen_c respects direction parameter", {
  ramp_normal <- palette_gen_c("highlight", direction = 1)
  ramp_reversed <- palette_gen_c("highlight", direction = -1)

  colors_normal <- ramp_normal(5)
  colors_reversed <- ramp_reversed(5)

  expect_length(colors_normal, 5)
  expect_length(colors_reversed, 5)
  # Colors should be different due to direction
  expect_false(identical(colors_normal, colors_reversed))
})

# Test with invalid palette
test_that("palette_gen handles invalid palette names", {
  expect_error(palette_gen("invalid_palette"), NA) # Should not error but may return NULL
  gen_func <- palette_gen("invalid_palette")
  # This will generate colors but from NULL palette, so should return NULL
  result <- gen_func(3)
  expect_null(result)
})
