## code to prepare `DATASET` dataset goes here


# Elecciones 1990 - 2006 --------------------------------------------------

library(readr)

nic_elecciones <- read_csv("inst/extdata/elecciones_presidenciales_1990-2006.csv")

usethis::use_data(nic_elecciones, overwrite = TRUE)



# Elecciones 2021 ---------------------------------------------------------

library(rvest)
library(tidyverse)
library(jsonlite)

url <- "https://flo.uri.sh/visualisation/7664211/embed?auto=1"

fdata <- url %>%
    read_html() %>%
    html_text() %>%
    str_match_all("(?:_Flourish_data[_a-z]*?\\s=\\s)(.*?)(?:,\\n)") |>
    pluck(1)

col_names <- fdata[1, 2] %>%
    fromJSON() %>%
    pluck("rows", "columns")

elecciones2021 <- fdata[3, 2] %>%
    fromJSON() %>%
    pluck("rows", "columns") %>%
    map_dfr(~ purrr::set_names(.x, col_names)) %>%
    janitor::clean_names()

elecciones2021 <- elecciones2021 %>%
    mutate(
      across(
        c(4:9),
        ~ as.numeric(str_remove_all(.x, ","))
      )
    )

usethis::use_data(elecciones2021, overwrite = TRUE)
