<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# roxygen2md 1.0.0.9002

- Harmonize yaml formatting.

- Revert changes to matrix section.

- Reduce parallelism.

- Also check dev on cran-* branches.

- Update hash key for dev.

- Remove R 3.3.

- Merge pull request #15 from r-lib/b-gha.




# roxygen2md 1.0.0.9001

- New `scope = "unlink"` to help hunt down unwanted `\link{...}` elements.


# roxygen2md 1.0.0.9000

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
