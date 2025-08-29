library(testthat)

# Test 1: Default palette returns mpa_blues
test_that("returns mpa_blues palette by default", {
  result <- mpa_palette()
  expect_length(result, 5)
  expect_true(all(
    c(
      "mpa_blue",
      "mpa_blue_60",
      "mpa_blue_30",
      "mpa_blue_10",
      "mpa_blue_05"
    ) %in%
      names(result)
  ))
})

# Test 2: All defined palettes work
test_that("returns correct palettes for valid names", {
  # Test complementary palette
  comp <- mpa_palette("complementary")
  expect_length(comp, 4)
  expect_true(all(
    c(
      "blue_complement",
      "yellow_complement",
      "turquoise_complement",
      "pink_complement"
    ) %in%
      names(comp)
  ))

  # Test highlight palette
  highlight <- mpa_palette("highlight")
  expect_length(highlight, 2)
  expect_true(all(c("mpa_blue", "yellow_complement") %in% names(highlight)))

  # Test complementary_all palette
  comp_all <- mpa_palette("complementary_all")
  expect_length(comp_all, 12)
})

# Test 3: Invalid palette names return NULL
test_that("returns NULL for invalid palette names", {
  expect_null(mpa_palette("invalid_palette"))
})

# Test 4: Palette returns named character vectors
test_that("returns named character vectors", {
  result <- mpa_palette("complementary")
  expect_true(is.character(result))
  expect_true(is.vector(result))
  expect_true(all(!is.null(names(result))))
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", result))) # Valid hex colors
})

# Test 5: All palette variants have consistent naming
test_that("complementary variants have consistent structure", {
  comp <- mpa_palette("complementary")
  comp_60 <- mpa_palette("complementary_60")
  comp_20 <- mpa_palette("complementary_20")

  expect_length(comp, 4)
  expect_length(comp_60, 4)
  expect_length(comp_20, 4)

  # Check that base colors match pattern
  base_names <- gsub("_complement.*", "_complement", names(comp))
  names_60 <- gsub("_complement.*", "_complement", names(comp_60))
  names_20 <- gsub("_complement.*", "_complement", names(comp_20))

  expect_equal(base_names, names_60)
  expect_equal(base_names, names_20)
})
