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
