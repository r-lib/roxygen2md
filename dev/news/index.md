# Changelog

## roxygen2md 1.0.1.9032

### Continuous integration

- Wrap the commit status update into an action.

- Route ccache through one-word compiler wrappers on Unix.

- Name every step and restore the log entry `setup-pandoc` swallows.

## roxygen2md 1.0.1.9031

### Continuous integration

- Add sharded `revdep2` workflow.

### Uncategorized

- Ci: Harden `workflow_run` workflows against untrusted pull requests
  ([\#106](https://github.com/r-lib/roxygen2md/issues/106)).

- Ci: Pin third-party actions to commits and let Renovate keep them
  pinned ([\#105](https://github.com/r-lib/roxygen2md/issues/105)).

## roxygen2md 1.0.1.9030

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/30974770859>

### Continuous integration

- Remove unused pr-commands workflow.

### Uncategorized

- Ci: Give every workflow and job an explicit `permissions` block
  ([\#103](https://github.com/r-lib/roxygen2md/issues/103)).

- Ci: Pass workflow context through the environment, not into script
  text ([\#102](https://github.com/r-lib/roxygen2md/issues/102)).

- Ci: Add a Windows arm64 (`windows-11-arm`) check on R-release
  ([\#99](https://github.com/r-lib/roxygen2md/issues/99)).

## roxygen2md 1.0.1.9029

- Ci: Run all smoke-test checks even when one fails
  ([\#97](https://github.com/r-lib/roxygen2md/issues/97)).

- Ci: Apply matrix `env` vars in the workflow, not in custom actions
  ([\#95](https://github.com/r-lib/roxygen2md/issues/95)).

- Ci: Link the responsible workflow run in snapshot update PRs
  ([\#96](https://github.com/r-lib/roxygen2md/issues/96)).

## roxygen2md 1.0.1.9028

### Continuous integration

- Lock down `format-suggest` egress (audit → block).

## roxygen2md 1.0.1.9027

### Bug fixes

#### ci

- Emit empty package matrix when there are no (rev)deps.

### Uncategorized

- Ci: Harden `format-suggest` against `pull_request_target` pwn requests
  ([\#93](https://github.com/r-lib/roxygen2md/issues/93)).

## roxygen2md 1.0.1.9026

### Continuous integration

- Run on Ubuntu 26.04.

- Align workflows with template.

## roxygen2md 1.0.1.9025

### Continuous integration

- Update ccache-action reference.

- Bump action version.

## roxygen2md 1.0.1.9024

- Ci: Unify fledge.yaml across cynkratemplate and fledge
  ([\#86](https://github.com/r-lib/roxygen2md/issues/86)).

## roxygen2md 1.0.1.9023

### Chore

- Add ccache to `.gitignore` and `.Rbuildignore`.

### Continuous integration

- Create snapshot update PR against correct branch.

- Add reference to `/apply-patch` workflow in commit message.

- Clarify rationale for not deploying on schedule.

## roxygen2md 1.0.1.9022

### Continuous integration

- Only run fledge on pushes to main.

## roxygen2md 1.0.1.9021

### Continuous integration

- Tweak fledge workflow and ccache action.

## roxygen2md 1.0.1.9020

### Continuous integration

- Cosmetics.

- Bump action versions.

- Install clang-format-21.

- Align fledge workflow.

- Harmonize.

## roxygen2md 1.0.1.9019

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/25270173379>

## roxygen2md 1.0.1.9018

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/22790999033>

## roxygen2md 1.0.1.9017

### Continuous integration

- Fix comment ([\#57](https://github.com/r-lib/roxygen2md/issues/57)).

- Tweaks ([\#56](https://github.com/r-lib/roxygen2md/issues/56)).

- Test all R versions on branches that start with cran-
  ([\#55](https://github.com/r-lib/roxygen2md/issues/55)).

## roxygen2md 1.0.1.9016

### Continuous integration

- Install binaries from r-universe for dev workflow
  ([\#54](https://github.com/r-lib/roxygen2md/issues/54)).

## roxygen2md 1.0.1.9015

### Continuous integration

- Fix reviewdog and add commenting workflow
  ([\#53](https://github.com/r-lib/roxygen2md/issues/53)).

## roxygen2md 1.0.1.9014

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/17451400696>

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/14636195570>

### Continuous integration

- Use workflows for fledge
  ([\#52](https://github.com/r-lib/roxygen2md/issues/52)).

- Sync ([\#51](https://github.com/r-lib/roxygen2md/issues/51)).

- Use reviewdog for external PRs
  ([\#49](https://github.com/r-lib/roxygen2md/issues/49)).

- Cleanup and fix macOS
  ([\#48](https://github.com/r-lib/roxygen2md/issues/48)).

- Format with air, check detritus, better handling of `extra-packages`
  ([\#47](https://github.com/r-lib/roxygen2md/issues/47)).

- Enhance permissions for workflow
  ([\#45](https://github.com/r-lib/roxygen2md/issues/45)).

- Permissions, better tests for missing suggests, lints
  ([\#44](https://github.com/r-lib/roxygen2md/issues/44)).

- Only fail covr builds if token is given
  ([\#43](https://github.com/r-lib/roxygen2md/issues/43)).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false`
  ([\#42](https://github.com/r-lib/roxygen2md/issues/42)).

- Correct installation of xml2
  ([\#41](https://github.com/r-lib/roxygen2md/issues/41)).

- Explain ([\#40](https://github.com/r-lib/roxygen2md/issues/40)).

- Add xml2 for covr, print testthat results
  ([\#39](https://github.com/r-lib/roxygen2md/issues/39)).

- Fix ([\#38](https://github.com/r-lib/roxygen2md/issues/38)).

- Sync ([\#37](https://github.com/r-lib/roxygen2md/issues/37)).

## roxygen2md 1.0.1.9013

### Continuous integration

- Avoid failure in fledge workflow if no changes
  ([\#36](https://github.com/r-lib/roxygen2md/issues/36)).

## roxygen2md 1.0.1.9012

### Continuous integration

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries
  ([\#35](https://github.com/r-lib/roxygen2md/issues/35)).

## roxygen2md 1.0.1.9011

### Continuous integration

- Use larger retry count for lock-threads workflow
  ([\#34](https://github.com/r-lib/roxygen2md/issues/34)).

## roxygen2md 1.0.1.9010

### Continuous integration

- Ignore errors when removing pkg-config on macOS
  ([\#33](https://github.com/r-lib/roxygen2md/issues/33)).

## roxygen2md 1.0.1.9009

### Continuous integration

- Explicit permissions
  ([\#32](https://github.com/r-lib/roxygen2md/issues/32)).

## roxygen2md 1.0.1.9008

### Continuous integration

- Use styler from main branch
  ([\#31](https://github.com/r-lib/roxygen2md/issues/31)).

## roxygen2md 1.0.1.9007

### Continuous integration

- Need to install R on Ubuntu 24.04
  ([\#30](https://github.com/r-lib/roxygen2md/issues/30)).

- Use Ubuntu 24.04 and styler PR
  ([\#28](https://github.com/r-lib/roxygen2md/issues/28)).

### Uncategorized

- PLACEHOLDER <https://github.com/r-lib/roxygen2md/pull/16>
  ([\#16](https://github.com/r-lib/roxygen2md/issues/16)).

## roxygen2md 1.0.1.9006

### Continuous integration

- Correctly detect branch protection
  ([\#27](https://github.com/r-lib/roxygen2md/issues/27)).

## roxygen2md 1.0.1.9005

### Continuous integration

- Use stable pak
  ([\#26](https://github.com/r-lib/roxygen2md/issues/26)).

## roxygen2md 1.0.1.9004

### Continuous integration

- Trigger run ([\#25](https://github.com/r-lib/roxygen2md/issues/25)).

  - ci: Trigger run

  - ci: Latest changes

## roxygen2md 1.0.1.9003

### Continuous integration

- Use pkgdown branch
  ([\#24](https://github.com/r-lib/roxygen2md/issues/24)).

  - ci: Use pkgdown branch

  - ci: Updates from duckdb

  - ci: Trigger run

## roxygen2md 1.0.1.9002

### Continuous integration

- Install via R CMD INSTALL ., not pak
  ([\#23](https://github.com/r-lib/roxygen2md/issues/23)).

  - ci: Install via R CMD INSTALL ., not pak

  - ci: Bump version of upload-artifact action

## roxygen2md 1.0.1.9001

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/10425485750>

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/10208520603>

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/9728439771>

- Auto-update from GitHub Actions.

  Run: <https://github.com/r-lib/roxygen2md/actions/runs/9691616200>

### Continuous integration

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

## roxygen2md 1.0.1.9000

- Merge branch ‘cran-1.0.1’.

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
  [`roxygen2md()`](https://roxygen2md.r-lib.org/dev/reference/roxygen2md.md)
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
  [`find_rd()`](https://roxygen2md.r-lib.org/dev/reference/find_rd.md)
  to find the remaining Rd syntax
- Function
  [`markdownify()`](https://roxygen2md.r-lib.org/dev/reference/markdownify.md)
  converts Rd to Markdown in character vectors
  ([\#10](https://github.com/r-lib/roxygen2md/issues/10),
  [@alexpghayes](https://github.com/alexpghayes)).
- RStudio add-in with menu items “Rd to Markdown” and “Find Rd.
