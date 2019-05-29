#' Convert text to Markdown
#'
#' @description
#' Converts a character vector from Rd to Markdown.
#'
#' @param text A character vector containing `.Rd` style annotations.
#' @inheritParams roxygen2md
#'
#' @return The same vector with `.Rd` style annotations converted to Markdown
#'   style annotations.
#' @export
#'
#' @examples
#' text <- c(
#'   "Both \\emph{italics} and \\bold{bold} text.",
#'   paste0("We can also convert code: \\", "code{\\", "link{identity}}.")
#' )
#'
#' text
#' markdownify(text)
#'
markdownify <- function(text, scope = c("full", "simple", "none")) {
  scope <- match.arg(scope)

  #' @description
  #' With `scope = "none"`, no transformations are carried out.
  #'
  #' With `scope = "simple"`, the following elements are converted:
  simple_transformers <- c(
    #'
    #' - `\\code{}`
    convert_code,
    #'
    #' - `\\emph{}`
    convert_emph,
    #'
    #' - `\\bold{}` and `\\strong{}`
    convert_bold,
    #'
    #' - `\\href{}`
    convert_href,
    #'
    #' - `\\url{}`
    convert_url,
    NULL
  )

  #'
  #' With `scope = "full"`, the following elements are converted in addition:
  full_transformers <- c(
    #' @description
    #' - `\\code{\\link{}}` and `\\link{}`, with `[]` options
    convert_local_links,
    convert_special_alien_links,
    convert_package_alien_links,
    convert_alias_links,
    convert_alien_links,
    convert_non_code_links,
    convert_non_code_special_alien_links,
    convert_non_code_package_alien_links,
    convert_non_code_alias_links,
    convert_non_code_alien_links,
    #'
    #' - `\\linkS4class{}`
    convert_S4_code_links,
    convert_S4_code_links,
    convert_S4_links,
    NULL
  )

  if (scope == "full") {
    transformers <- c(full_transformers, simple_transformers)
  } else if (scope == "simple") {
    transformers <- c(simple_transformers)
  } else {
    transformers <- list()
  }

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
      maybe(
        capture_group(1),
        "::"
      ),
      capture_group(2),
      maybe("()"),
      "}",
      maybe("()"),
      "}"
    ),
    "[\\1::\\2()]"
  )
}

convert_package_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{\\link[",
      capture(one_or_more(none_of("][:"))),
      ":",
      capture(one_or_more(none_of("]["))),
      "]{",
      capture(one_or_more(none_of("}["), type = "lazy")),
      maybe("()"),
      "}",
      capture(zero_or_more(none_of("}["), type = "lazy")),
      maybe("()"),
      "}"
    ),
    "[`\\3\\4()`][\\1::\\2]"
  )
}

convert_alias_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{\\link[=",
      capture(one_or_more(none_of("][:"))),
      "]{",
      capture(one_or_more(none_of("}[:"), type = "lazy")),
      or(
        "}",
        "}()",
        "()}"
      ),
      "}"
    ),
    "[`\\2()`][\\1]"
  )
}

convert_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\code{\\link[",
      capture(none_of("="), zero_or_more(none_of("][:"))),
      "]{",
      capture(one_or_more(none_of("}[:"), type = "lazy")),
      or(
        "}",
        "}()",
        "()}"
      ),
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
      "}"
    ),
    "[\\1::\\2]"
  )
}

convert_non_code_package_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\link[",
      capture(one_or_more(none_of("][:"))),
      ":",
      capture(one_or_more(none_of("]["))),
      "]{",
      capture(one_or_more(none_of("}["))),
      "}"
    ),
    "[\\3][\\1::\\2]"
  )
}

convert_non_code_alias_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\link[=",
      capture(one_or_more(none_of("]["))),
      "]{",
      capture(one_or_more(none_of("}[:"))),
      "}"
    ),
    "[\\2][\\1]"
  )
}

convert_non_code_alien_links <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\link[",
      capture(none_of("="), zero_or_more(none_of("]["))),
      "]{",
      capture(one_or_more(none_of("}[:"))),
      "}"
    ),
    "[\\2][\\1::\\2]"
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
      "\\",
      or("bold", "strong"),
      "{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "**\\1**"
  )
}

convert_href <- function(text) {
  re_substitutes(
    global = TRUE,
    text,
    rex(
      "\\href{",
      capture(one_or_more(none_of("{}"))),
      "}{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "[\\2](\\1)"
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
