#' Easily filter unemployment data for Luxembourg
#' @param unemp_data A data frame containing unemployment data for Luxembourg.
#' @param year_of_interest Optional: The year that should be kept. Leave empty to select every year.
#' @param place_name_of_interest Optional: The name of the place of interest: leave empty to select every place in `level_of_interest`.
#' @param level_of_interest Optional: The level of interest: one of `Country`, `Canton`, `Commune`. Leave empty to select every level with the same place name.
#' @param col_of_interest A column of the `unemp` data frame that you wish to select.
#' @importFrom janitor clean_names
#' @importFrom dplyr filter select
#' @importFrom rlang quo `!!`
#' @return A data frame
#' @export
#' @details
#' Users can filter data on two variables: the name of the place of interest, and the level of interest.
#' By leaving the argument `place_name_of_interest` empty
#' @examples
#' # Filter on cantons
#' clean_unemp(unemp,
#'             level_of_interest = "Canton",
#'             col_of_interest = active_population)
#' # Filter on a specific commune
#' clean_unemp(unemp,
#'             place_name_of_interest = "Luxembourg",
#'             level_of_interest = "Commune",
#'             col_of_interest = active_population)
#' # Filter on every level called Luxembourg
#' clean_unemp(unemp,
#'             place_name_of_interest = "Luxembourg",
#'             col_of_interest = active_population)
clean_unemp <- function(unemp_data,
                        year_of_interest = NULL,
                        place_name_of_interest = NULL,
                        level_of_interest = NULL,
                        col_of_interest){
  
  if(is.null(year_of_interest)){
    
    year_of_interest <- quo(year)
    
  }
  
  if(is.null(place_name_of_interest)){
    
    place_name_of_interest <- quo(place_name)
    
  }
  
  if(is.null(level_of_interest)){
    
    level_of_interest <- quo(level)
    
  }
  
  result <- unemp_data |>
    janitor::clean_names() |>
    dplyr::filter(year %in% !!year_of_interest,
                  place_name %in% !!place_name_of_interest,
                  level %in% !!level_of_interest) |>
    dplyr::select(year, place_name, level, {{col_of_interest}})
  
  if(nrow(result) == 0) {
    warning("The returned data frame is empty. This is likely because the `place_name_of_interest` or `level_of_interest` argument supplied does not match any rows in the original data.")
  }
  result
}