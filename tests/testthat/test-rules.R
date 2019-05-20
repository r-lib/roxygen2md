test_that("convert_special_alien_links", {
  expect_equal(convert_special_alien_links("\\code{\\link[a:b]{a::b()}}"), "[a::b()]")
  expect_equal(convert_special_alien_links("\\code{\\link[a:b]{a::b}()}"), "[a::b()]")
  expect_equal(convert_special_alien_links("\\code{\\link[a:b]{a::b}}"), "[a::b()]")
})
