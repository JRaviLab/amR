
<!-- README.md is generated from README.Rmd. Please edit that file -->

# amR: an R package suite for antimicrobial resistance prediction

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

**amR** is a metapackage that provides a single installation point for
the amR suite of packages for antimicrobial resistance (AMR) prediction
in bacterial pathogens.

## The amR suite

The amR suite consists of three packages that work together:

| Package | Description | Repository |
|----|----|----|
| **amRdata** | Data curation and feature extraction from bacterial genomes | [JRaviLab/amR_data](https://github.com/JRaviLab/amR_data) |
| **amRml** | Machine learning models for AMR prediction | [JRaviLab/amR_ml](https://github.com/JRaviLab/amR_ml) |
| **amRshiny** | Interactive dashboard for exploring results | [JRaviLab/amR_shiny](https://github.com/JRaviLab/amR_shiny) |

## Installation

### Install the entire suite

``` r
# Install amR metapackage
if (!requireNamespace("remotes", quietly = TRUE))
    install.packages("remotes")

remotes::install_github("JRaviLab/amR")

# Then install all packages in the suite
library(amR)
installAMR()
```

### Install individual packages

You can also install packages individually:

``` r
remotes::install_github("JRaviLab/amR_data")
remotes::install_github("JRaviLab/amR_ml")
remotes::install_github("JRaviLab/amR_shiny")
```

## Quick start

``` r
# Load all packages
library(amRdata)
library(amRml)
library(amRshiny)

# 1. Prepare data with amRdata
# features <- prepareFeatures(...)

# 2. Train ML models with amRml
# results <- runMLPipeline(...)

# 3. Explore results with amRshiny
# launchDashboard(...)
```

## Workflow overview

    ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
    │  amRdata    │ --> │   amRml     │ --> │  amRshiny   │
    │             │     │             │     │             │
    │ - Genomes   │     │ - Train LR  │     │ - Dashboard │
    │ - Features  │     │ - Evaluate  │     │ - Plots     │
    │ - Metadata  │     │ - Top feats │     │ - Export    │
    └─────────────┘     └─────────────┘     └─────────────┘

## Documentation

- [amRdata documentation](https://jravilab.github.io/amR_data)
- [amRml documentation](https://jravilab.github.io/amR_ml)
- [amRshiny documentation](https://jravilab.github.io/amR_shiny)

## Citation

If you use the amR suite in your research, please cite:

    Brenner EP^, Ghosh A^, Wolfe EP, Boyer EA, Vang CK, Lesiyon RL, Mayer DA, Ravi J. (2026).
    amR: An R package suite for antimicrobial resistance prediction in bacterial pathogens.
    https://github.com/JRaviLab/amR

Looking for a cool application of this amR prediction framework? Check
out our recent work on predicting AMR in ESKAPE pathogens: [Ghosh^,
Brenner^, Vang^, Wolfe^, *et al.,* *bioRxiv*
2025](https://doi.org/10.1101/2025.07.03.663053).

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md)
for guidelines.

## License

BSD 3-Clause License. See [LICENSE](LICENSE) for details.

## Contact

**Corresponding author**: Janani Ravi (<janani.ravi@cuanschutz.edu>)

**Lab website**: <https://jravilab.github.io>

## Code of Conduct

Please note that amR is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
