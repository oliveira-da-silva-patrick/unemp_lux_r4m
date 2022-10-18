my_function <- function(a, b){
    a + b
}

my_filter <- function(dataset, condition){
    dataset |>
        dplyr::filter({{condition}})
}

clean_unemp <- function(unemp_data, level, col_of_interest){

  unemp_data |>
    janitor::clean_names() |>
    dplyr::filter({{level}}) |>
    dplyr::select(year, commune, {{col_of_interest}})
}
