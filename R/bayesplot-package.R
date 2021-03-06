#' Plots for Bayesian Models
#'
#' @docType package
#' @name bayesplot-package
#' @aliases bayesplot
#'
#' @import ggplot2 stats rlang
#'
#' @description
#' \if{html}{
#'    \figure{stanlogo.png}{options: width="50px" alt="mc-stan.org"}
#'    \emph{Stan Development Team}
#' }
#'
#' The \pkg{bayesplot} package provides a variety of \pkg{ggplot2}-based
#' plotting functions for use after fitting Bayesian models (typically, though
#' not exclusively, via Markov chain Monte Carlo). The package is designed not
#' only to provide convenient functionality for users, but also a common set of
#' functions that can be easily used by developers working on a variety of
#' packages for Bayesian modeling, particularly (but not necessarily) packages
#' powered by \pkg{\link[rstan]{rstan}}. Examples of packages that will soon (or
#' already are) using \pkg{bayesplot} are \pkg{rstan} itself, as well as the
#' \pkg{rstan}-dependent \pkg{rstanarm} and \pkg{brms} packages for applied
#' regression modeling.
#'
#' @section Plotting functionality:
#'  \if{html}{
#'    \figure{bayesplot1.png}{options: width="30\%" alt="mcmc_areas"}
#'    \figure{bayesplot2.png}{options: width="30\%" alt="ppc_hist"}
#'    \figure{bayesplot3.png}{options: width="30\%" alt="ppc_dens_overlay"}
#'  }
#'
#' The plotting functions in \pkg{bayesplot} are organized into several modules:
#' \itemize{
#'   \item \strong{\link[=MCMC-overview]{MCMC}}: Visualizations of Markov chain
#'   Monte Carlo (MCMC) simulations generated by \emph{any} MCMC algorithm.
#'   There are also additional functions specifically for use with models fit
#'   using the \link[=NUTS]{No-U-Turn Sampler (NUTS)}.
#'   \item \strong{\link[=PPC-overview]{PPC}}:
#'   Graphical posterior predictive checks (PPCs).
#'   \item \strong{Coming soon}:
#'   In future releases modules will be added specifically for
#'   forecasting/out-of-sample prediction and other inference-related tasks.
#' }
#'
#' @section Questions, feature requests, bug reports:
#' \itemize{
#'  \item{\strong{Bug reports and feature requests}:}{
#'  If you'd like to request a new feature or if you've noticed a bug that needs
#'  to be fixed please let us know at the \pkg{bayesplot} issue tracker on
#'  GitHub:
#'
#'  \url{https://github.com/stan-dev/bayesplot/issues/}.
#'  }
#'  \item{\strong{General questions and help}:}{
#'  To ask a question about \pkg{bayesplot} on the Stan-users
#'  forum please visit
#'
#'  \url{http://discourse.mc-stan.org}.
#' }
#' }
#'
#' @template seealso-theme
#' @template seealso-colors
#' @seealso \code{\link[ggplot2]{ggsave}} in \pkg{ggplot2} for saving plots.
#'
#' @examples
#' # A few quick examples (all of the functions have many examples
#' # on their individual help pages)
#'
#' # MCMC plots
#' x <- example_mcmc_draws(params = 5)
#' mcmc_intervals(x, prob = 0.5)
#' mcmc_intervals(x, regex_pars = "beta")
#'
#' color_scheme_set("purple")
#' mcmc_areas(x, regex_pars = "beta", prob = 0.8)
#'
#' color_scheme_set("mix-blue-red")
#' mcmc_trace(x, pars = c("alpha", "sigma"),
#'            facet_args = list(nrow = 2))
#'
#' color_scheme_set("brightblue")
#' mcmc_scatter(x, pars = c("beta[1]", "sigma"),
#'              transformations = list(sigma = "log"))
#'
#'
#' # Graphical PPCs
#' y <- example_y_data()
#' yrep <- example_yrep_draws()
#' ppc_dens_overlay(y, yrep[1:50, ])
#' \donttest{
#' color_scheme_set("pink")
#' ppc_stat(y, yrep, stat = "median") + grid_lines()
#' ppc_hist(y, yrep[1:8, ])
#' }
#'
NULL
