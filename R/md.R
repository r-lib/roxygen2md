#' Convert from Rd to Markdown in roxygen2 comments
#'
#' Performs various substitutions in all `.R` files in a package
#' to make use of the Markdown functionality in `roxygen2`.
#' This function is designed for interactive use, see [markdownify()] for details
#' on the transformations.
#' Also attempts to enable Markdown support in `roxygen2` by adding a field to
#' `DESCRIPTION`.
#' Carefully examine the results after running this function!
#'
#' @param scope The scope of transformations: `"simple"` runs only transformations
#'   that shouldn't substantially change the resulting `.Rd` files, `"full"` runs
#'   all transformations. In larger packages, run `"none"`, double-check and track
#'   the changes, and then run `"simple"` and then `"full"`.
#'
#' @return List of changed files, invisibly
#'
#' @export
#' @examples
#' if (interactive()) {
#'   # Convert roxygen to Markdown in one run
#'   roxygen2md()
#' }
#'
#' # Alternatively, convert in three steps:
#' if (interactive()) {
#'   # 1. Enable Markdown processing
#'   roxygen2md("none")
#'
#'   menu("Please examine/commit the changes and press 1 <enter> to continue.")
#'
#'   # 2. Convert simple markup
#'   roxygen2md("simple")
#'
#'   menu("Please examine/commit the changes and press 1 <enter> to continue.")
#'
#'   # 3. (Optionally) Remove some of the \code{} expressions
#'   roxygen2md("unlink")
#'
#'   menu(paste0(
#'     "Please remove all unwanted changes, commit the wanted ones, ",
#'     "and press 1 <enter> to continue."
#'   ))
#'
#'   # 4. Convert everything, including links
#'   roxygen2md("full")
#' }
roxygen2md <- function(scope = c("full", "simple", "unlink", "indent", "none")) {
  scope <- match.arg(scope)
  with_project(code = roxygen2md_local(scope))
}

roxygen2md_local <- function(scope) {
  files <- find_r_files()
  check_utf8()
  add_roxygen_field()
  transform_files(files, scope)
}

check_utf8 <- function() {
  encoding <- desc::desc_get("Encoding")
  if (is.null(encoding) || is.na(encoding) || !(encoding %in% c("UTF-8", "ASCII"))) {
    abort(c(
      "roxygen2md requires UTF-8 encoding.",
      i = "Please make sure that the DESCRIPTION file contains a field `Encoding: UTF-8`."
    ))
  }
}

add_roxygen_field <- function() {
  roxygen_field <- desc::desc_get("Roxygen")
  if (is_roxygen_field_markdown(roxygen_field)) {
    return()
  }

  roxygen_field_new <- "list(markdown = TRUE)"
  if (is.na(roxygen_field)) {
    desc::desc_set("Roxygen" = roxygen_field_new)
    ui_done("Updated {ui_path('DESCRIPTION')}")
  } else {
    ui_todo("Update the {ui_value('Roxygen')} field in {ui_path('DESCRIPTION')} to include {ui_code(roxygen_field_new)}}. Current value: {ui_code(roxygen_field)}")
  }

  invisible()
}

is_roxygen_field_markdown <- function(roxygen_field = desc::desc_get("Roxygen")) {
  if (is.na(roxygen_field)) {
    return(FALSE)
  }
  roxygen_field_new <- "list(markdown = TRUE)"
  if (identical(unname(roxygen_field), roxygen_field_new)) {
    return(TRUE)
  }

  roxygen_field_val <- try_eval_text(roxygen_field)
  isTRUE(roxygen_field_val$markdown)
}

try_eval_text <- function(text) {
  tryCatch(
    eval(parse(text = text)),
    error = function(e) NULL
  )
}
