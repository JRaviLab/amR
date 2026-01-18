#' Install amR package suite
#'
#' Installs all packages in the amR suite for antimicrobial resistance
#' prediction: amRdata, amRml, and amRshiny.
#'
#' @param packages Character vector specifying which packages to install.
#'   Options are "data", "ml", and "shiny". Default installs all three.
#' @param force Logical. If TRUE, forces reinstallation even if packages
#'   are already installed. Default is FALSE.
#' @param upgrade Character. Controls whether to upgrade dependencies.
#'   Options: "default", "ask", "always", "never". Default is "default".
#' @param quiet Logical. If TRUE, suppresses installation messages.
#'   Default is FALSE.
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
#' }
installAMR <- function(packages = c("data", "ml", "shiny"),
                       force = FALSE,
                       upgrade = "default",
                       quiet = FALSE) {
  # Validate packages argument

  valid_packages <- c("data", "ml", "shiny")
  packages <- match.arg(packages, valid_packages, several.ok = TRUE)


  # Map short names to full repo paths

  repo_map <- c(
    data = "JRaviLab/amR_data",
    ml = "JRaviLab/amR_ml",
    shiny = "JRaviLab/amR_shiny"
  )

  # Install each requested package

  for (pkg in packages) {
    if (!quiet) {
      message("Installing ", repo_map[pkg], "...")
    }
    devtools::install_github(
      repo = repo_map[pkg],
      force = force,
      upgrade = upgrade,
      quiet = quiet
    )
  }

  if (!quiet) {
    message("Done! Installed: ", paste(packages, collapse = ", "))
  }

  invisible(NULL)
}
