transform_files <- function(files, transformers) {
  transformer <- function(text) {
    roxy_lines <- get_roxy_lines(text)

    new_text <- text
    new_text[roxy_lines] <- Reduce(
      function(text, transformer) transformer(text),
      transformers,
      init = text[roxy_lines])

    new_text
  }

  changed <- utf8::transform_lines_enc(files, transformer)
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
