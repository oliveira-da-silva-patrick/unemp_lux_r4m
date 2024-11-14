#' Unemployement in Luxembourg data
#'
#' A tidy dataset of unemployment data in Luxembourg.
#'
#' @format ## `who`
#' A data frame with 7,240 rows and 60 columns:
#' \describe{
#'   \item{year}{Year}
#'   \item{place_name}{Name of commune, canton or country}
#'   \item{level}{Country, Canton, or Commune}
#'   \item{total_employed_population}{Total employed population living in `place_name`}
#'   \item{of_which_wage_earners}{... of which are wage earners living in `place_name`}
#'   \item{of_which_non_wage_earners}{... of which are non-wage earners living in `place_name`}
#'   \item{unemployed}{Total unemployed population living in `place_name`}
#'   \item{active_population}{Total active population living in `place_name`}
#'   \item{unemployement_rate_in_percent}{Unemployement rate in `place_name`}
#'   ...
#' }
#' @source <https://is.gd/e6wKRk>
"unemp"