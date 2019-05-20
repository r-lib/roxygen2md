expect_convert <- function(transform, input, output) {
  expect_equal(transform(input), output)
  expect_equal(markdownify(input), output)
}

test_that("convert_local_links", {
  expect_convert(convert_local_links, "\\code{\\link{b}}", "[b()]")
  expect_convert(convert_local_links, "\\code{\\link{b}()}", "[b()]")
})

test_that("convert_special_alien_links", {
  expect_convert(convert_special_alien_links, "\\code{\\link[a:b]{a::b()}}", "[a::b()]")
  expect_convert(convert_special_alien_links, "\\code{\\link[a:b]{a::b}()}", "[a::b()]")
  expect_convert(convert_special_alien_links, "\\code{\\link[a:b]{a::b}}", "[a::b()]")
})

test_that("convert_alien_links", {
  expect_convert(convert_alien_links, "\\code{\\link[a]{b}}", "[a::b()]")
  expect_convert(convert_alien_links, "\\code{\\link[a]{b}()}", "[a::b()]")
})

test_that("convert_S4_code_links", {
  expect_convert(convert_S4_code_links, "\\code{\\linkS4class{b}}", "[b-class]")
})

test_that("convert_S4_links", {
  expect_convert(convert_S4_links, "\\linkS4class{b}", "[b-class]")
})

test_that("convert_non_code_links", {
  expect_convert(convert_non_code_links, "\\link{b}", "[b]")
})

test_that("convert_non_code_special_alien_links", {
  expect_convert(convert_non_code_special_alien_links, "\\link[a:b]{a::b}", "[a::b]")
})

test_that("convert_non_code_alien_links", {
  expect_convert(convert_non_code_alien_links, "\\link[=a]{b}", "[a][b]")
})

test_that("convert_code", {
  expect_convert(convert_code, "\\code{x}", "`x`")
})

test_that("convert_emph", {
  expect_convert(convert_emph, "\\emph{x}", "*x*")
})

test_that("convert_bold", {
  expect_convert(convert_bold, "\\bold{x}", "**x**")
})

test_that("convert_url", {
  expect_convert(convert_url, "\\url{x}", "<x>")
})
