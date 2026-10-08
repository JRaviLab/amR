test_that("installAMR validates package arguments", {
  # Valid packages should not error

  expect_no_error(
    match.arg(c("data", "ml"), c("data", "ml", "viz"), several.ok = TRUE)
  )

  # Invalid package should error

  expect_error(
    match.arg("invalid", c("data", "ml", "viz"), several.ok = TRUE)
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
  expect_true("method" %in% names(args))
  expect_true("branch" %in% names(args))
})

test_that("installAMR has correct default arguments", {
  args <- formals(installAMR)

  # Check default values
  expect_equal(eval(args$packages), c("data", "ml", "viz"))
  expect_false(eval(args$force))
  expect_equal(eval(args$upgrade), "default")
  expect_false(eval(args$quiet))
})

test_that("installAMR defaults to devtools and the default branch", {
  args <- formals(installAMR)

  expect_equal(eval(args$method), c("devtools", "pak"))
  expect_null(args$branch)
})

test_that("installAMR validates method and branch", {
  expect_error(installAMR(method = "invalid"))
  expect_error(installAMR(branch = c("a", "b")), "single value or a named")
  expect_error(installAMR(branch = c(foo = "dev")), "Unknown package")
  expect_error(installAMR(branch = 1), "character")
})

test_that("installAMR passes branch to devtools::install_github", {
  skip_if_not_installed("mockery")
  stub <- mockery::mock(NULL, NULL)
  mockery::stub(installAMR, "devtools::install_github", stub)

  installAMR(packages = c("data", "ml"), branch = c(ml = "dev"), quiet = TRUE)

  expect_null(mockery::mock_args(stub)[[1]]$ref)
  expect_equal(mockery::mock_args(stub)[[2]]$ref, "dev")
})

test_that("installAMR passes branch to pak::pkg_install", {
  skip_if_not_installed("mockery")
  skip_if_not_installed("pak")
  stub <- mockery::mock(NULL)
  mockery::stub(installAMR, "pak::pkg_install", stub)

  installAMR(packages = "ml", method = "pak", branch = "dev", quiet = TRUE)

  expect_equal(mockery::mock_args(stub)[[1]][[1]], "JRaviLab/amRml@dev")
})
