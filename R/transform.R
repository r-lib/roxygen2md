transform_files <- function(files, scope) {
  force(scope)

  transformer <- function(text) {
    roxy_lines <- get_roxy_lines(text)

    new_text <- text
    collapsed_text <- paste(text[roxy_lines], collapse = "\n")
    new_text[roxy_lines] <- strsplit(markdownify(collapsed_text, scope), "\n")[[1]]

    new_text
  }

  changed <- transform_lines(files, transformer)

  if (is_roxygen_field_markdown()) {
    ui_info("Running {ui_code('devtools::document()')}")
    devtools::document(proj_get())
  } else {
    ui_todo("Run {ui_code('devtools::document()')}")
  }

  ui_todo("Review the changes carefully")
  ui_todo("Commit the changes to version control")
  if (scope != "full") {
    ui_todo("Run {ui_code('roxygen2md::roxygen2md()')} with a stricter {ui_code('scope')} argument")
  }

  invisible(changed)
}

get_roxy_lines <- function(text) {
  re_matches(
    text,
    rex(
      start,
      any_blanks,
      one_or_more("#"),
      "'"
    )
  )
}
