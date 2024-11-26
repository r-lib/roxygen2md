<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# roxygen2md 1.0.1.9008

## Continuous integration

- Use styler from main branch (#31).


# roxygen2md 1.0.1.9007

## Continuous integration

- Need to install R on Ubuntu 24.04 (#30).

- Use Ubuntu 24.04 and styler PR (#28).

## Uncategorized

- PLACEHOLDER https://github.com/r-lib/roxygen2md/pull/16 (#16).


# roxygen2md 1.0.1.9006

## Continuous integration

  - Correctly detect branch protection (#27).


# roxygen2md 1.0.1.9005

## Continuous integration

  - Use stable pak (#26).


# roxygen2md 1.0.1.9004

## Continuous integration

  - Trigger run (#25).
    
      - ci: Trigger run
    
      - ci: Latest changes


# roxygen2md 1.0.1.9003

## Continuous integration

  - Use pkgdown branch (#24).
    
      - ci: Use pkgdown branch
    
      - ci: Updates from duckdb
    
      - ci: Trigger run


# roxygen2md 1.0.1.9002

## Continuous integration

  - Install via R CMD INSTALL ., not pak (#23).
    
      - ci: Install via R CMD INSTALL ., not pak
    
      - ci: Bump version of upload-artifact action


# roxygen2md 1.0.1.9001

## Chore

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/r-lib/roxygen2md/actions/runs/10425485750

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/r-lib/roxygen2md/actions/runs/10208520603

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/r-lib/roxygen2md/actions/runs/9728439771

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/r-lib/roxygen2md/actions/runs/9691616200

## Continuous integration

  - Install local package for pkgdown builds.

  - Improve support for protected branches with fledge.

  - Improve support for protected branches, without fledge.

  - Sync with latest developments.

  - Use v2 instead of master.

  - Inline action.

  - Use dev roxygen2 and decor.

  - Fix on Windows, tweak lock workflow.

  - Avoid checking bashisms on Windows.

  - Better commit message.

  - Bump versions, better default, consume custom matrix.

  - Recent updates.


# roxygen2md 1.0.1.9000

- Merge branch 'cran-1.0.1'.


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
