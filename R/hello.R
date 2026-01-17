# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'
#   Insert Roxygen:            'Cmd + Shift + Option + R'

#' Hello
#'
#' @description
#' A basic function, with defined imports, returns, and examples.
#'
#' @importFrom glue glue_col
#' @importFrom rlang inform
#'
#' @return 42, but also prints a message using rlang::inform()
#' @export
#'
#' @examples
#' \dontrun{
#' hello()
#' }
hello <- function() {
  rlang::inform(glue::glue_col("{blue Hello}, {yellow world!}"))
  return(invisible(42))
}
