test_that("installAMR validates package arguments", {
  # Valid packages should not error

  expect_no_error(
    match.arg(c("data", "ml"), c("data", "ml", "shiny"), several.ok = TRUE)
  )

  # Invalid package should error

  expect_error(
    match.arg("invalid", c("data", "ml", "shiny"), several.ok = TRUE)
  )
})

test_that("installAMR function exists and has correct signature", {
  expect_true(exists("installAMR"))
  expect_true(is.function(installAMR))

  # Check function has expected arguments
  args <- formals(installAMR)
  expect_true("packages" %in% names(args))
  expect_true("force" %in% names(args))
  expect_true("upgrade" %in% names(args))
  expect_true("quiet" %in% names(args))
})

test_that("installAMR has correct default arguments", {
  args <- formals(installAMR)

  # Check default values
  expect_equal(eval(args$packages), c("data", "ml", "shiny"))
  expect_false(eval(args$force))
  expect_equal(eval(args$upgrade), "default")
  expect_false(eval(args$quiet))
})
