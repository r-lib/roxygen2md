#' @api
NULL

#' Convert from Rd to Markdown in roxygen2 comments
#'
#' Performs various substitutions in all `.R` files in a package
#' to make use of the Markdown functionality in `roxygen2`.
#' See [markdownify()] for details.
#' Also attempts to enable Markdown support in `roxygen2` by adding a field to
#' `DESCRIPTION`.
#' Carefully examine the results after running this function!
#'
#' @param scope The scope of transformations: `"simple"` runs only transformations
#'   that shouldn't substantially change the resulting `.Rd` files, `"full"` runs
#'   all transformations. In larger packages, run `"simple"`, double-check and track
#'   the changes, and then run `"full"`.
#'
#' @return List of changed files, invisibly
#'
#' @export
roxygen2md <- function(scope = c("full", "simple")) {
  scope <- match.arg(scope)
  with_project(code = roxygen2md_local(scope))
}

roxygen2md_local <- function(scope) {
  files <- dir(path = "R", pattern = "[.][rR]$", recursive = TRUE, full.names = TRUE)
  check_utf8()
  add_roxygen_field()
  transform_files(files, scope)
}

check_utf8 <- function() {
  encoding <- desc::desc_get("Encoding")
  if (is.null(encoding) || is.na(encoding) || !(encoding %in% c("UTF-8", "ASCII"))) {
    stop("roxygen2md requires UTF-8 encoding. Please make sure that the DESCRIPTION file contains a field `Encoding: UTF-8`.", abort = FALSE)
  }
}

add_roxygen_field <- function() {
  if (!is_roxygen_field_markdown()) {
    roxygen_field <- desc::desc_get("Roxygen")
    roxygen_field_new <- "list(markdown = TRUE)"
    if (is.na(roxygen_field)) {
      desc::desc_set("Roxygen" = roxygen_field_new)
    } else {
      message(
        "If necessary, please update the Roxygen field in DESCRIPTION to include ",
        roxygen_field_new, "\nCurrent value: ", roxygen_field
      )
    }
  }
  invisible()
}

is_roxygen_field_markdown <- function() {
  roxygen_field <- desc::desc_get("Roxygen")
  if (is.na(roxygen_field)) return(FALSE)
  roxygen_field_new <- "list(markdown = TRUE)"
  if (identical(unname(roxygen_field), roxygen_field_new)) return(TRUE)

  roxygen_field_val <- try_eval_text(roxygen_field)
  isTRUE(roxygen_field_val$markdown)
}

try_eval_text <- function(text) {
  tryCatch(
    eval(parse(text = text)),
    error = function(e) NULL
  )
}
