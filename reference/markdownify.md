# Convert text to Markdown

Converts a character vector from Rd to Markdown.

The `scope` argument controls the depth of the transformation.

With `scope = "none"`, no transformations are carried out. The only
effect is that Markdown is enabled for this package.

With `scope = "simple"`, the following elements are converted:

- `\\code{}`

- `\\emph{}`

- `\\bold{}` and `\\strong{}`

- `\\href{}`

- `\\url{}`

With `scope = "full"`, the following elements are converted in addition:

- `\\code{\link{}}` and `\\link{}`, with `[]` options

- `\\linkS4class{}`

With `scope = "unlink"`, *only* the following elements are translated:

- `\\link{...}` to `...`

With `scope = "indent"`, `@param` and `@return` tags spanning multiple
lines are indented with two spaces.

## Usage

``` r
markdownify(text, scope = c("full", "simple", "unlink", "indent", "none"))
```

## Arguments

- text:

  A character vector containing `.Rd` style annotations.

- scope:

  The scope of transformations: `"simple"` runs only transformations
  that shouldn't substantially change the resulting `.Rd` files,
  `"full"` runs all transformations. In larger packages, run `"none"`,
  double-check and track the changes, and then run `"simple"` and then
  `"full"`.

## Value

The same vector with `.Rd` style annotations converted to Markdown style
annotations.

## Examples

``` r
text <- c(
  "Both \\emph{italics} and \\bold{bold} text.",
  paste0("We can also convert code: \\", "code{\\", "link{identity}}.")
)

text
#> [1] "Both \\emph{italics} and \\bold{bold} text."        
#> [2] "We can also convert code: \\code{\\link{identity}}."
markdownify(text)
#> [1] "Both *italics* and **bold** text."      
#> [2] "We can also convert code: [identity()]."
```
