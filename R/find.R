#' Searches plain Rd in R source files
#'
#' Looks for Rd-like code in roxygen2 comments, especially useful after running
#' [roxygen2md()].
#' This function is designed for interactive use.
#'
#' @return A tidy data frame that has a [print()] method
#' that also interacts with the RStudio API.
#' @export
#' @examples
#' if (interactive()) {
#'   # Show remaining Rd syntax after conversion.
#'   find_rd()
#' }
find_rd <- function() {
  with_project(code = find_rd_local())
}

find_rd_local <- function() {
  files <- find_r_files()
  ret <- find_rd_in_files(files)
  tibble::new_tibble(ret, nrow = nrow(ret), class = "roxygen2md_find")
}

#' @export
print.roxygen2md_find <- function(x, ...) {
  if (nrow(x) > 0) {
    if (rlang::is_installed("rstudioapi") && rstudioapi::isAvailable()) {
      rstudioapi::sourceMarkers("roxygen2md", x, autoSelect = "first")
    } else {
      NextMethod()
    }
  } else {
    ui_info("No Rd syntax found")
  }
  invisible(x)
}

find_rd_in_files <- function(files) {
  locations <- map(files, find_rd_in_file)
  do.call(rbind, locations)
}

find_rd_in_file <- function(path) {
  rx <- rex(
    start,
    capture(
      zero_or_more(" "),
      "#'",
      zero_or_more(any)
    ),
    capture(
      "\\",
      any_letters,
      zero_or_more(" ")
    ),
    one_of(c("[", "{")),
    zero_or_more(any),
    end
  )

  lines <- readLines(path)
  line <- grep(rx, lines, perl = TRUE)
  column <- nchar(gsub(rx, "\\1", lines[line]), type = "chars") + 1L
  val <- gsub(rx, "\\2", lines[line])

  tibble::tibble(
    type = "info",
    file = path,
    line,
    column,
    message = val
  )
}
