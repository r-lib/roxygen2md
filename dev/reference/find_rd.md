# Searches plain Rd in R source files

Looks for Rd-like code in roxygen2 comments, especially useful after
running
[`roxygen2md()`](https://roxygen2md.r-lib.org/dev/reference/roxygen2md.md).
This function is designed for interactive use.

## Usage

``` r
find_rd()
```

## Value

A tidy data frame that has a
[`print()`](https://rdrr.io/r/base/print.html) method that also
interacts with the RStudio API.

## Examples

``` r
if (interactive()) {
  # Show remaining Rd syntax after conversion.
  find_rd()
}
```
