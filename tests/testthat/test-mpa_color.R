library(testthat)

# Test 1: Function Returns All Colors When No Arguments Passed
test_that("returns all colors when no arguments are passed", {
  expect_length(mpa_color(), 27)
})

# Test 2: Function Returns Correct Colors for Valid Arguments
test_that("returns correct colors for valid arguments", {
  expected_result <- c(`mpa_blue` = "#143C64")
  expect_equal(mpa_color("mpa_blue"), expected_result)

  # For multiple colors
  multiple_expected_result <- c(`mpa_blue` = "#143C64", `red_signal` = "#E6000A")
  expect_equal(mpa_color("mpa_blue", "red_signal"), multiple_expected_result)
})

# Test 3: Function Handles Invalid Color Names Gracefully
test_that("handles invalid color names gracefully", {
  expect_warning(mpa_color("invalid_color"))
})

# Test 4: Function Handles Mixed Valid and Invalid Color Names
test_that("handles mixed valid and invalid color names", {
  result <- suppressWarnings(mpa_color("mpa_blue", "invalid_color"))
  expect_length(result, 1)
  expect_true("mpa_blue" %in% names(result))
  expect_false("invalid_color" %in% names(result))

  # Expect a specific warning message
  expect_warning(
    mpa_color("mpa_blue", "invalid_color"),
    "Some requested colors are not defined. Returning available colors."
  )
})

# Test 5: Consistency of Returned Data Structure
test_that("returns a named vector consistently", {
  expect_true(is.vector(mpa_color()))
  expect_true(is.character(mpa_color()))
  expect_true(all(!is.null(names(mpa_color()))))
})
