#' Convert a character vector from Rd to Markdown
#'
#' @param text A character vector containing `.Rd` style annotations.
#'
#' @return The same vector with `.Rd` style annotations converted to Markdown
#'   style annotations.
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
#' markdownify(text)
#'
markdownify <- function(text) {
  transformers <- c(
    convert_local_links,
    convert_special_alien_links,
    convert_alien_links,
    convert_S4_code_links,
    convert_S4_code_links,
    convert_S4_links,
    convert_non_code_links,
    convert_non_code_special_alien_links,
    convert_non_code_alien_links,
    convert_code,
    convert_emph,
    convert_bold,
    convert_bold,
    convert_url,
    NULL
  )

  transform_element <- function(elem) {
    Reduce(
      function(txt, transformer) transformer(txt),
      transformers,
      init = elem
    )
  }

  vapply(text, transform_element, character(1), USE.NAMES = FALSE)
}

convert_local_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{\\link{",
      capture(one_or_more(none_of("}["))),
      "}",
      maybe("()"),
      "}"
    ),
    "[\\1()]"
  )
}

convert_special_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{\\link[",
      capture(one_or_more(none_of("][:"))),
      ":",
      capture(one_or_more(none_of("]["))),
      "]{",
      capture_group(1),
      "::",
      capture_group(2),
      or(
        "}",
        "()}",
        "}()"
      ),
      "}"
    ),
    "[\\1::\\2()]"
  )
}

convert_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{\\link[",
      capture(one_or_more(none_of("]["))),
      "]{",
      capture(one_or_more(none_of("}[:"))),
      "}",
      maybe("()"),
      "}"
    ),
    "[\\1::\\2()]"
  )
}

convert_S4_code_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{\\linkS4class{",
      capture(one_or_more(none_of("}"))),
      "}}"
    ),
    "[\\1-class]"
  )
}

convert_S4_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\linkS4class{",
      capture(one_or_more(none_of("}"))),
      "}"
    ),
    "[\\1-class]"
  )
}

convert_non_code_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\link{",
      capture(one_or_more(none_of("}[:"))),
      "}"
    ),
    "[\\1]"
  )
}

convert_non_code_special_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\link[",
      capture(one_or_more(none_of("][:"))),
      ":",
      capture(one_or_more(none_of("]["))),
      "]{",
      capture_group(1),
      "::",
      capture_group(2),
      or(
        "}",
        "()}",
        "}()"
      )
    ),
    "[\\1::\\2]"
  )
}

convert_non_code_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\link[",
      capture(one_or_more(none_of("]["))),
      "]{",
      capture(one_or_more(none_of("}[:"))),
      "}"
    ),
    "[\\1::\\2]"
  )
}

convert_code <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "`\\1`"
  )
}

convert_emph <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\emph{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "*\\1*"
  )
}

convert_bold <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\bold{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "**\\1**"
  )
}

convert_url <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\url{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "<\\1>"
  )
}
