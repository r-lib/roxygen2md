
<!-- README.md is generated from README.Rmd. Please edit that file -->

# roxygen2md

<!-- badges: start -->

[![rcc](https://github.com/r-lib/roxygen2md/workflows/rcc/badge.svg)](https://github.com/r-lib/roxygen2md/actions)
[![Codecov test
coverage](https://codecov.io/gh/r-lib/roxygen2md/branch/main/graph/badge.svg)](https://app.codecov.io/gh/r-lib/roxygen2md?branch=main)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/roxygen2md)](https://cran.r-project.org/package=roxygen2md)
<!-- badges: end -->

The goal of roxygen2md is to replace Rd syntax with Markdown in your
package’s `roxygen2` documentation. The following Rd code is converted
to the Markdown equivalent:

- `\emph{}`
- `\bold{}` and `\strong{}`
- `\href{}`
- `\url{}`
- `\code{...}`
- Various variants of `\code{\link{...}}` and `\code{\link[...]{...}}`
  (only with `scope = "full"`, see below)

If necessary, `DESCRIPTION` is edited to enable Markdown in roxygen
blocks. You’ll need `roxygen2` version 6.0.0 or later.

Call `roxygen2md::roxygen2md()` in your package’s directory, or navigate
to “Tools/Addins/Rd to Markdown” in RStudio.

The substitutions are not completely safe, please carefully examine the
results!

## Installation

Install from CRAN using

``` r
install.packages("roxygen2md")
```

Get the latest development version from GitHub with:

``` r
# install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))
pak::pak("r-lib/roxygen2md")
```

## Usage

In your package directory, run

``` r
roxygen2md::roxygen2md()
```

If you are using RStudio, choose the item “Rd to Markdown” from your
“Addins” menu.

You will be guided through the process.

At any time, choose the item “Find Rd” from your “Addins” menu, or run
`find_rd()`, to enumerate Rd elements in your R scripts.

## Converting large packages

For larger existing packages, a three-stage workflow is recommended,
using `roxygen2md(scope = "none")`, `"simple"` and `"full"` in sequence:

- `"none"` only adds `list(markdown = TRUE)` to the `Roxygen` field in
  `DESCRIPTION`
- `"simple"` only converts elements like `\code{}` and `\emph{}`
- `"full"` runs all conversions
- `"unlink"` splits complicated `\code{}` tags with embedded `\link{}`

This helps isolating mostly automated changes from changes that require
review. After this `find_rd()` shows remaining Rd format artifacts that
were not handled by the conversion.

See <https://github.com/rstudio/rmarkdown/pull/1583> for an example
conversion.

### Baseline

After `roxygen2md(scope = "none")`, interpretation of Markdown elements
is enabled. Running `devtools::document()` should ideally lead to
whitespace-only changes in the `.Rd` files, this can be verified with
`git diff -w -- man` or with a visual diff tool like Meld or diffuse.
Make sure that enabling of Markdown doesn’t add unwanted artifacts. (The
second commit in the example PR was necessary due to such artifacts –
the underscore has a special meaning in Markdown.)

### Simple conversion

Running `roxygen2md(scope = "simple")` after `"none"` (and running
`devtools::document()`) should lead to changes in R files mostly, only
very few `.Rd` files should be changed. Again, make sure this doesn’t
add unwanted artifacts.

### Removing links

Optionally, run `roxygen2md(scope = "unlink")` after `"simple"` (and
running `devtools::document()`). This replaces all instances of
`\link{...}` with `...`. This isn’t a valid conversion, but a helper to
split up complex instances of `\code{...\link{...}...}` for which no
easy-to-read translation to Markdown exists. Use a visual diff tool like
Meld or diffuse to quickly iterate through all changes and keep only
those that are intended. Run `devtools::document()` and commit if
necessary.

Consider inserting `@seealso` tags to link to functions instead. Render
the documentation with [pkgdown](https://pkgdown.r-lib.org/) to take
advantage of its [auto-link
feature](https://pkgdown.r-lib.org/articles/linking.html) – all
functions gain automatic links without the need for further markup.

### Full conversion

Running `roxygen2md()` after `scope = "simple"` (and running
`devtools::document()`) converts all `\link{}` expressions. This is the
trickiest part of the entire conversion. Due to the staged approach, the
changeset is reduced to a minimum. Review carefully, luckily
`R CMD check` catches bad links introduced in this stage.

### Manual conversion

The `find_rd()` functions shows positions of Rd-like comments that were
not handled by the conversion. In RStudio, a markers pane will open.

## Limitations

The package’s `DESCRIPTION` must have its `Encoding` field set to
`UTF-8` or `ASCII`:

    Encoding: UTF-8

If you use a different encoding, please recode your files with
[`recode`](https://manpages.ubuntu.com/manpages/noble/man1/recode.1.html)
or a similar tool and update the `Encoding` field before proceeding.
Example:

``` sh
recode latin1..utf8 R/*
```

GPL-3 © Kirill Müller

------------------------------------------------------------------------

## Code of Conduct

Please note that the roxygen2md project is released with a [Contributor
Code of Conduct](https://roxygen2md.r-lib.org/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
