transform_files <- function(files, transformers) {
  transformer <- function(text) {
    roxy_lines <- get_roxy_lines(text)

    new_text <- text
    collapsed_text <- paste(text[roxy_lines], collapse = "\n")
    new_text[roxy_lines] <- strsplit(Reduce(
      function(text, transformer) transformer(text),
      transformers,
      init = collapsed_text), "\n")[[1]]

    new_text
  }

  changed <- enc::transform_lines_enc(files, transformer)
  if (any(changed)) {
      message("Please review the changes carefully!")
  }
  invisible(changed)
}

#' Convert a character vector from Rd to Markdown
#'
#' @param text A character vector containing `.Rd` style annotations.
#'
#' @return The same vector with `.Rd` style annotations converted to Markdown
#'   style annotation.
#' @export
#'
#' @examples
#'
#' text <- c(
#'   "Both \\emph{italics} and \\bold{bold} text.",
#'   "And here we have \\emph{italics} in some text.",
#'   "This is \\bold{bold} text."
#' )
#'
#' transform_text(text)
#'
transform_text <- function(text) {
  transformers <- c(
    convert_local_links,
    convert_alien_links,
    convert_S4_code_links,
    convert_S4_code_links,
    convert_S4_links,
    convert_code,
    convert_emph,
    convert_bold,
    convert_bold,
    convert_url,
    NULL)

  transform_element <- function(elem) {
    Reduce(
      function(txt, transformer) transformer(txt),
      transformers,
      init = elem
    )
  }

  vapply(text, transform_element, character(1), USE.NAMES = FALSE)
}

get_roxy_lines <- function(text) {
  rex::re_matches(
    text,
    rex::rex(
      start,
      any_blanks,
      some_of("#"),
      "'"
    )
  )
}
