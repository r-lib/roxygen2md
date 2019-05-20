convert_local_links <- function(text) {
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
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
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
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
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
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
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
      "\\code{\\linkS4class{",
      capture(one_or_more(none_of("}"))),
      "}}"
    ),
    "[\\1-class]"
  )
}

convert_S4_links <- function(text) {
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
      "\\linkS4class{",
      capture(one_or_more(none_of("}"))),
      "}"
    ),
    "[\\1-class]"
  )
}

convert_code <- function(text) {
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
      "\\code{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "`\\1`"
  )
}

convert_emph <- function(text) {
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
      "\\emph{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "*\\1*"
  )
}

convert_bold <- function(text) {
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
      "\\bold{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "**\\1**"
  )
}

convert_url <- function(text) {
  rex::re_substitutes(
    global = TRUE,
    text,
    rex::rex(
      "\\url{",
      capture(one_or_more(none_of("{}"))),
      "}"
    ),
    "<\\1>"
  )
}
