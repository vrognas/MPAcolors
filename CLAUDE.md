# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

MPAcolors is an R package that provides color palettes used by the Swedish Medical Products Agency (MPA) in their publications and reports. The package integrates with ggplot2 to provide both discrete and continuous color scales.

## Development Commands

### Testing
- Run all tests: `devtools::test()` or `testthat::test_dir("tests")`
- Run specific test file: `testthat::test_file("tests/testthat/test-mpa_color.R")`
- Check package: `devtools::check()`

### Building and Documentation
- Build package: `devtools::build()`
- Install from source: `devtools::install()`
- Generate documentation: `devtools::document()`
- Build README from Rmd: `devtools::build_readme()`

### Package Development
- Load package for development: `devtools::load_all()`
- Check package dependencies: `devtools::check()`

## Code Architecture

### Core Color System
The package is built around a hierarchical color system:

1. **Base Colors** (`mpa_color()` in `R/mpa_color.R`): Central repository of all MPA colors with hex codes and RGB values. Returns a named vector of colors and handles invalid color names gracefully.

2. **Predefined Palettes** (`mpa_palette()` in `R/mpa_palette.R`): Organized collections of colors including:
   - `mpa_blues`: Gradient of MPA blue shades
   - `complementary`: Core complementary colors 
   - `complementary_60`/`complementary_20`: Lighter variants
   - `complementary_all`: All complementary colors and variants
   - `highlight`: Two-color palette for emphasis

3. **Palette Generators** (`palette_gen.R`): Factory functions that create color palette functions:
   - `palette_gen()`: For discrete scales
   - `palette_gen_c()`: For continuous scales using `colorRampPalette()`

### ggplot2 Integration
- **Discrete scales**: `scale_colour_mpa()` and `scale_fill_mpa()` in respective files
- **Continuous scales**: `scale_colour_mpa_c()` with gradient support
- Both support `palette` parameter and `direction` for color order

### Testing Strategy
Tests are in `tests/testthat/` using the testthat framework. Current tests cover:
- Color retrieval with and without arguments
- Invalid color name handling
- Data structure consistency
- Warning message validation

## Key Design Patterns

- All functions use consistent parameter naming (`palette`, `direction`)
- Color functions return named vectors for easy identification
- Graceful error handling with informative warnings
- Integration with ggplot2's scale system through `discrete_scale()` and `scale_color_gradientn()`
- Flexible palette system supporting both full and partial color sets