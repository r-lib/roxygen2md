# Convert from Rd to Markdown in roxygen2 comments

Performs various substitutions in all `.R` files in a package to make
use of the Markdown functionality in `roxygen2`. This function is
designed for interactive use, see
[`markdownify()`](https://roxygen2md.r-lib.org/dev/reference/markdownify.md)
for details on the transformations. Also attempts to enable Markdown
support in `roxygen2` by adding a field to `DESCRIPTION`. Carefully
examine the results after running this function!

## Usage

``` r
roxygen2md(scope = c("full", "simple", "unlink", "indent", "none"))
```

## Arguments

- scope:

  The scope of transformations: `"simple"` runs only transformations
  that shouldn't substantially change the resulting `.Rd` files,
  `"full"` runs all transformations. In larger packages, run `"none"`,
  double-check and track the changes, and then run `"simple"` and then
  `"full"`.

## Value

List of changed files, invisibly

## Examples

``` r
if (interactive()) {
  # Convert roxygen to Markdown in one run
  roxygen2md()
}

# Alternatively, convert in three steps:
if (interactive()) {
  # 1. Enable Markdown processing
  roxygen2md("none")

  menu("Please examine/commit the changes and press 1 <enter> to continue.")

  # 2. Convert simple markup
  roxygen2md("simple")

  menu("Please examine/commit the changes and press 1 <enter> to continue.")

  # 3. (Optionally) Remove some of the \code{} expressions
  roxygen2md("unlink")

  menu(paste0(
    "Please remove all unwanted changes, commit the wanted ones, ",
    "and press 1 <enter> to continue."
  ))

  # 4. Convert everything, including links
  roxygen2md("full")
}
```
