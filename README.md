
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NewPackage

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/NewPackage)](https://CRAN.R-project.org/package=NewPackage)
[![R-CMD-check](https://github.com/JRaviLab/NewPackage/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/JRaviLab/NewPackage/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of NewPackage is to … \< *your awesome package description
here!* \>

## GitHub Setup

### Repository

Initial Repository Configuration:

- Enable Git: `usethis::use_git()`
- Configure Remote:
  `usethis::use_github(organisation = "JRaviLab", private = TRUE, protocol = "https")`
- Contributor Code of Conduct:
  `usethis::use_code_of_conduct(contact = "janani.ravi@cuanschutz.edu")`

### GitHub Actions

These functions will enable common package development GitHub Actions is
desired:

- R CMD Check (multiplatform):
  `usethis::use_github_action("check_standard")`
- Build Pkgdown: `use_github_action("pkgdown")`
- lint code: `use_github_action("lint")`
- style code: `use_github_action("style")`

Example GitHub Actions workflows have been incorporated into this
template. Modify workflows in `.github/workflows/` or delete if these
are not required.

## Development

- new function: `usethis::use_r("hello")`
- add package dependency: `usethis::use_package("rlang")`
- render documentation/update NAMESPACE: `devtools::document()`
- load changes without install: `devtools::load_all()`
- Local R CMD Check: `devtools::check()`

## Installation

You can install the development version of NewPackage like so:

``` r
# GitHub
devtools::install_github("JRaviLab/NewPackage", auth_token = "<PersonalAccessToken>")
# If Bioconductor Dependencies
BiocManager::install("JRaviLab/NewPackage", auth_token = "<PersonalAccessToken>")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(NewPackage)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

## Code of Conduct

Please note that the NewPackage project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
