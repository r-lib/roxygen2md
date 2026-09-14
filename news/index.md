# Changelog

## roxygen2md 1.0.1

CRAN release: 2024-02-18

### Bug fixes

- Refine regular expression for matching roxygen2 blocks.

### Features

- Prefer brio over enc
  ([\#16](https://github.com/r-lib/roxygen2md/issues/16),
  [\#21](https://github.com/r-lib/roxygen2md/issues/21)).
- New `"indent"` scope for adding indent to `@param` and `@return` tags.

### Documentation

- Prefer pak.
- Update code of conduct.
- Use tidytemplate.
- Package documentation.
- Fix URLs.

### Testing

- Use testthat edition 3.

### Uncategorized

- Internal changes only.
- Harmonize yaml formatting.
- Revert changes to matrix section.
- Reduce parallelism.
- Also check dev on cran-\* branches.
- Update hash key for dev.
- Remove R 3.3.
- Merge pull request
  [\#15](https://github.com/r-lib/roxygen2md/issues/15) from
  r-lib/b-gha.
- New `scope = "unlink"` to help hunt down unwanted `\link{...}`
  elements.
- Same as previous version.

## roxygen2md 1.0.0

CRAN release: 2019-06-17

Initial release.

- Function
  [`roxygen2md()`](https://roxygen2md.r-lib.org/reference/roxygen2md.md)
  that can be run in the package’s directory and converts all roxygen2
  comments to Markdown, guiding the user with helpful output.
  - The `DESCRIPTION` is edited if necessary, or a message is given that
    the user should edit themselves.
  - Runs `document()` automatically if `markdown = TRUE` in
    `DESCRIPTION`.
  - Perform only partial conversion by specifying the `scope` argument.
  - Makes use of
    [`usethis::proj_get()`](https://usethis.r-lib.org/reference/proj_utils.html).
- Function
  [`find_rd()`](https://roxygen2md.r-lib.org/reference/find_rd.md) to
  find the remaining Rd syntax
- Function
  [`markdownify()`](https://roxygen2md.r-lib.org/reference/markdownify.md)
  converts Rd to Markdown in character vectors
  ([\#10](https://github.com/r-lib/roxygen2md/issues/10),
  [@alexpghayes](https://github.com/alexpghayes)).
- RStudio add-in with menu items “Rd to Markdown” and “Find Rd.
