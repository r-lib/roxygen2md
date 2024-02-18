expect_convert <- function(expr, output, final_output = output) {
  quo <- enquo(expr)
  expect_equal(force(expr), !!output)

  quo_name <- as_name(quo_get_expr(quo)[[1]])
  markdownify_override <- list2(!!quo_name := markdownify)
  expect_equal(eval_tidy(quo, data = markdownify_override), !!final_output)
}

test_that("convert_local_links", {
  expect_convert(convert_local_links("\\code{\\link{b}}"), "[b()]")
  expect_convert(convert_local_links("\\code{\\link{b}()}"), "[b()]")
})

test_that("convert_special_alien_links", {
  expect_convert(convert_special_alien_links("\\code{\\link[a:b]{a::b()}}"), "[a::b()]")
  expect_convert(convert_special_alien_links("\\code{\\link[a:b]{a::b}()}"), "[a::b()]")
  expect_convert(convert_special_alien_links("\\code{\\link[a:b]{a::b}}"), "[a::b()]")
  expect_convert(convert_special_alien_links("\\code{\\link[a:b]{b()}}"), "[a::b()]")
  expect_convert(convert_special_alien_links("\\code{\\link[a:b]{b}()}"), "[a::b()]")
  expect_convert(convert_special_alien_links("\\code{\\link[a:b]{b}}"), "[a::b()]")
})

test_that("convert_package_alien_links", {
  expect_convert(convert_package_alien_links("\\code{\\link[c:d]{a::b()}}"), "[`a::b()`][c::d]")
  expect_convert(convert_package_alien_links("\\code{\\link[c:d]{a::b}()}"), "[`a::b()`][c::d]")
  expect_convert(convert_package_alien_links("\\code{\\link[c:d]{a::b}}"), "[`a::b()`][c::d]")
})

test_that("convert_alias_links", {
  expect_convert(convert_alias_links("\\code{\\link[=b]{a}}"), "[`a()`][b]")
  expect_convert(convert_alias_links("\\code{\\link[=b]{a()}}"), "[`a()`][b]")
  expect_convert(convert_alias_links("\\code{\\link[=b]{a}()}"), "[`a()`][b]")
})

test_that("convert_alien_links", {
  expect_convert(convert_alien_links("\\code{\\link[a]{b}}"), "[a::b()]")
  expect_convert(convert_alien_links("\\code{\\link[a]{b()}}"), "[a::b()]")
  expect_convert(convert_alien_links("\\code{\\link[a]{b}()}"), "[a::b()]")
})

test_that("convert_S4_code_links", {
  expect_convert(convert_S4_code_links("\\code{\\linkS4class{b}}"), "[b-class]")
})

test_that("convert_S4_links", {
  expect_convert(convert_S4_links("\\linkS4class{b}"), "[b-class]")
})

test_that("convert_non_code_links", {
  expect_convert(convert_non_code_links("\\link{b}"), "[b]")
})

test_that("convert_non_code_special_alien_links", {
  expect_convert(convert_non_code_special_alien_links("\\link[a:b]{a::b}"), "[a::b]")
})

test_that("convert_non_code_package_alien_links", {
  expect_convert(convert_non_code_package_alien_links("\\link[c:d]{a::b}"), "[a::b][c::d]")
})

test_that("convert_non_code_alias_links", {
  expect_convert(convert_non_code_alias_links("\\link[=b]{a}"), "[a][b]")
})

test_that("convert_non_code_alien_links", {
  expect_convert(convert_non_code_alien_links("\\link[a]{b}"), "[b][a::b]")
})

test_that("convert_code", {
  expect_convert(convert_code("\\code{x}"), "`x`")
})

test_that("convert_emph", {
  expect_convert(convert_emph("\\emph{x}"), "*x*")
})

test_that("convert_bold", {
  expect_convert(convert_bold("\\bold{x}"), "**x**")
  expect_convert(convert_bold("\\strong{x}"), "**x**")
})

test_that("convert_href", {
  expect_convert(convert_href("\\href{x}{y}"), "[y](x)")
})

test_that("convert_url", {
  expect_convert(convert_url("\\url{x}"), "<x>")
})

test_that("remove_link", {
  expect_convert(remove_link("\\link{x}"), "x", "[x]")

  # This conversion is bad, use `scope = "unlink"` to detect
  expect_convert(remove_link("\\code{...\\link{x}...}"), "\\code{...x...}", "`...[x]...`")
})

test_that("indent_param_return", {
  expect_equal(indent_param_return("#' @param a b\n#' c"), "#' @param a b\n#'   c")
  expect_equal(indent_param_return("#' @return a b\n#' c\n#' d"), "#' @return a b\n#'   c\n#'   d")
})
