#' Cleans unemployment data for Luxembourg
#' @param unemp_data A data frame containing unemployment data for Luxembourg.
#' @param level A predicate condition indicating the regional level of interest. See details for more.
#' @param col_of_interest A column of the `unemp_data` data frame that you wish to select.
#' @importFrom janitor clean_names
#' @importFrom dplyr filter select
#' @importFrom rlang enquo `!!`
#' @return A data frame
#' @export
#' @details
#' This function allows the user to create a data frame for several regional levels. The first level
#' is the complete country. The second level are cantons, and the third level are neither cantons
#' nor the whole country, so the communes. Individual communes can be selected as well.
#' `level` must be predicate condition passed down to dplyr::filter. See the examples below
#' for its usage.
#' @examples
#' \dontrun{
#' # Filter on cantons
#' clean_unemp(unemp,
#'             grepl("Canton", commune),
#'             active_population)
#' # Filter on a specific commune
#' clean_unemp(unemp,
#'             grepl("Kayl", commune),
#'             active_population)
#'}
clean_unemp <- function(unemp_data, level, col_of_interest){

  level <- enquo(level)
  col_of_interest <- enquo(col_of_interest)

  unemp_data |>
    clean_names() |>
    filter((!!level)) |>
    select(year, commune, !!col_of_interest)
}
