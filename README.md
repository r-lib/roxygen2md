# roxygen2md

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/r-lib/roxygen2md.svg?branch=master)](https://travis-ci.org/r-lib/roxygen2md)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/r-lib/roxygen2md?branch=master&svg=true)](https://ci.appveyor.com/project/r-lib/roxygen2md)
[![Codecov test coverage](https://codecov.io/gh/r-lib/roxygen2md/branch/master/graph/badge.svg)](https://codecov.io/gh/r-lib/roxygen2md?branch=master)
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN status](https://www.r-pkg.org/badges/version/roxygen2md)](https://cran.r-project.org/package=roxygen2md)
<!-- badges: end -->

The goal of roxygen2md is to replace Rd syntax with Markdown
in your package's `roxygen2` documentation.
Currently, the following substitutions are carried out:

- `\code{\link{...}}` becomes `[...()]`
- `\code{\link[...]{...}}` becomes `[...::...()]`
- `\code{...}` becomes `` `...` ``

If necessary, `DESCRIPTION` is edited to enable Markdown in roxygen blocks.
You'll need `roxygen2` version 6.0.0 or later.

Call `roxygen2md::roxygen2md()` in your package's directory, or navigate to "Tools/Addins/Rd to Markdown" in RStudio.

More to come. The substitutions are not completely safe,
please carefully examine the results!

Let me know if this works with your documentation.


## Installation

Install from GitHub using

```r
# install.packages("roxygen2")
# install.packages("remotes")
remotes::install_github("r-lib/roxygen2md")
```


## Usage

In your package directory, run

```r
roxygen2md::roxygen2md()
```

If you are using RStudio, simply choose the item "Rd to Markdown" from your "Addins" menu.

-----

GPL-3 © Kirill Müller
