<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# roxygen2md 1.0.1

## Bug fixes

- Refine regular expression for matching roxygen2 blocks.

## Features

- Prefer brio over enc (#16, #21).
- New `"indent"` scope for adding indent to `@param` and `@return` tags.

## Documentation

- Prefer pak.
- Update code of conduct.
- Use tidytemplate.
- Package documentation.
- Fix URLs.

## Testing

- Use testthat edition 3.

## Uncategorized

- Internal changes only.
- Harmonize yaml formatting.
- Revert changes to matrix section.
- Reduce parallelism.
- Also check dev on cran-\* branches.
- Update hash key for dev.
- Remove R 3.3.
- Merge pull request #15 from r-lib/b-gha.
- New `scope = "unlink"` to help hunt down unwanted `\link{...}` elements.
- Same as previous version.


# roxygen2md 1.0.0

Initial release.

- Function `roxygen2md()` that can be run in the package's directory and converts all roxygen2 comments to Markdown, guiding the user with helpful output.
    - The `DESCRIPTION` is edited if necessary, or a message is given that the user should edit themselves.
    - Runs `document()` automatically if `markdown = TRUE` in `DESCRIPTION`.
    - Perform only partial conversion by specifying the `scope` argument.
    - Makes use of `usethis::proj_get()`.
- Function `find_rd()` to find the remaining Rd syntax
- Function `markdownify()` converts Rd to Markdown in character vectors (#10, @alexpghayes).
- RStudio add-in with menu items "Rd to Markdown" and "Find Rd.
