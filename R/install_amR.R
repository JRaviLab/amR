#' Install amR package suite
#'
#' Installs all packages in the amR suite for antimicrobial resistance
#' prediction: amRdata, amRml, and amRviz.
#'
#' @param packages Character vector specifying which packages to install.
#'   Options are "data", "ml", and "viz". Default installs all three.
#' @param force Logical. If TRUE, forces reinstallation even if packages
#'   are already installed. Default is FALSE.
#' @param upgrade Character. Controls whether to upgrade dependencies.
#'   Options: "default", "ask", "always", "never". Default is "default".
#' @param quiet Logical. If TRUE, suppresses installation messages.
#'   Default is FALSE.
#' @param method Character. Installer backend: "devtools" (default, uses
#'   `devtools::install_github()`) or "pak" (uses `pak::pkg_install()`;
#'   requires the pak package). With "pak", `force = TRUE` is translated to
#'   `upgrade = TRUE`, since pak has no force option; `upgrade` is TRUE only
#'   for "always" (otherwise dependencies are not upgraded), and `quiet` has
#'   no effect on pak's own output.
#' @param branch Character. Git branch, tag, or commit to install from.
#'   Either a single unnamed value applied to every requested package, or a
#'   named vector keyed by package (e.g. `c(ml = "dev", viz = "main")`);
#'   packages not named use the repository's default branch. Default is
#'   NULL (default branch).
#'
#' @return Invisible NULL. Called for side effects (package installation).
#'
#' @importFrom devtools install_github
#' @export
#'
#' @examples
#' \dontrun{
#' # Install all packages
#' installAMR()
#'
#' # Install only amRml
#' installAMR(packages = "ml")
#'
#' # Force reinstall of all packages
#' installAMR(force = TRUE)
#'
#' # Install specific packages quietly
#' installAMR(packages = c("data", "ml"), quiet = TRUE)
#'
#' # Install using pak instead of devtools
#' installAMR(method = "pak")
#'
#' # Install every package from the "dev" branch
#' installAMR(branch = "dev")
#'
#' # Install amRml from "dev" and the rest from their default branches
#' installAMR(branch = c(ml = "dev"))
#' }
installAMR <- function(packages = c("data", "ml", "viz"),
                       force = FALSE,
                       upgrade = "default",
                       quiet = FALSE,
                       method = c("devtools", "pak"),
                       branch = NULL) {
  # Validate arguments

  valid_packages <- c("data", "ml", "viz")
  packages <- match.arg(packages, valid_packages, several.ok = TRUE)
  method <- match.arg(method)

  if (method == "pak" && !requireNamespace("pak", quietly = TRUE)) {
    stop(
      "Package 'pak' is required for method = \"pak\". ",
      "Install it with install.packages(\"pak\").",
      call. = FALSE
    )
  }

  # Resolve branch/ref per package (NULL = default branch)

  refs <- vector("list", length(packages))
  names(refs) <- packages
  if (!is.null(branch)) {
    if (!is.character(branch) || anyNA(branch) || length(branch) == 0) {
      stop("`branch` must be a character vector.", call. = FALSE)
    }
    if (is.null(names(branch))) {
      if (length(branch) != 1) {
        stop(
          "`branch` must be a single value or a named vector, ",
          "e.g. c(ml = \"dev\").",
          call. = FALSE
        )
      }
      refs[] <- list(branch)
    } else {
      unknown <- setdiff(names(branch), valid_packages)
      if (length(unknown) > 0) {
        stop(
          "Unknown package name(s) in `branch`: ",
          paste(unknown, collapse = ", "),
          call. = FALSE
        )
      }
      for (pkg in intersect(names(branch), packages)) {
        refs[[pkg]] <- branch[[pkg]]
      }
    }
  }

  # Map short names to full repo paths

  repo_map <- c(
    data = "JRaviLab/amRdata",
    ml = "JRaviLab/amRml",
    viz = "JRaviLab/amRviz"
  )

  # Install each requested package

  for (pkg in packages) {
    ref <- refs[[pkg]]
    if (!quiet) {
      message(
        "Installing ", repo_map[[pkg]],
        if (!is.null(ref)) paste0(" (", ref, ")"),
        " via ", method, "..."
      )
    }

    if (method == "pak") {
      pak::pkg_install(
        if (is.null(ref)) repo_map[[pkg]] else paste0(repo_map[[pkg]], "@", ref),
        upgrade = force || identical(upgrade, "always")
      )
    } else {
      devtools::install_github(
        repo = repo_map[[pkg]],
        ref = ref,
        force = force,
        upgrade = upgrade,
        quiet = quiet
      )
    }
  }

  if (!quiet) {
    message("Done! Installed: ", paste(packages, collapse = ", "))
  }

  invisible(NULL)
}
