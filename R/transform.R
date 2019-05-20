transform_files <- function(files, scope) {
  force(scope)

  transformer <- function(text) {
    roxy_lines <- get_roxy_lines(text)

    new_text <- text
    collapsed_text <- paste(text[roxy_lines], collapse = "\n")
    new_text[roxy_lines] <- strsplit(markdownify(collapsed_text, scope), "\n")[[1]]

    new_text
  }

  changed <- enc::transform_lines_enc(files, transformer)
  if (any(changed)) {
    message("Please review the changes carefully!")
  }
  invisible(changed)
}

get_roxy_lines <- function(text) {
  re_matches(
    text,
    rex(
      start,
      any_blanks,
      some_of("#"),
      "'"
    )
  )
}
