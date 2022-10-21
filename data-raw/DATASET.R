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


# Elecciones 2019 (Regionales ---------------------------------------------

# RACCS

url <- "https://flo.uri.sh/visualisation/8656899/embed?auto=1"

fdata <- url %>%
    read_html() %>%
    html_text() %>%
    str_match_all("(?:_Flourish_data[_a-z]*?\\s=\\s)(.*?)(?:,\\n)") |>
    pluck(1)

col_names <- fdata[1, 2] %>%
    fromJSON() %>%
    pluck("data", "value")

raccs <- fdata[3, 2] %>%
    fromJSON() %>%
    pluck("data", "value") %>%
    map_dfr(~ purrr::set_names(.x, col_names)) %>%
    janitor::clean_names()

row_names <- fdata[3, 2] %>%
    fromJSON() %>%
    pluck("data", "label")

raccs <- raccs %>%
    mutate(
        partidos = row_names
    ) %>%
    select(partidos, everything()) %>%
    pivot_longer(-partidos, names_prefix = "x") %>%
    mutate(
        name = str_replace_all(name, "[:digit:]", "") %>% str_replace_all(., "_", " ") %>% str_trim(.) %>% str_to_title()
    ) %>%
    pivot_wider(names_from = partidos, values_from = value) %>%
    rename(circunscripcion = name) %>%
    janitor::clean_names() %>%
    mutate(
        region = "REGIÓN AUTÓNOMA COSTA CARIBE SUR"
    )

# RACCN

url <- "https://flo.uri.sh/visualisation/8656878/embed?auto=1"

fdata <- url %>%
    read_html() %>%
    html_text() %>%
    str_match_all("(?:_Flourish_data[_a-z]*?\\s=\\s)(.*?)(?:,\\n)") |>
    pluck(1)

col_names <- fdata[1, 2] %>%
    fromJSON() %>%
    pluck("data", "value")

raccn <- fdata[3, 2] %>%
    fromJSON() %>%
    pluck("data", "value") %>%
    map_dfr(~ purrr::set_names(.x, col_names)) %>%
    janitor::clean_names()

row_names <- fdata[3, 2] %>%
    fromJSON() %>%
    pluck("data", "label")

raccn <- raccn %>%
    mutate(
        partidos = row_names
    ) %>%
    select(partidos, everything()) %>%
    pivot_longer(-partidos, names_prefix = "x") %>%
    mutate(
        name = str_replace_all(name, "[:digit:]", "") %>% str_replace_all(., "_", " ") %>% str_trim(.) %>% str_to_title()
    ) %>%
    pivot_wider(names_from = partidos, values_from = value) %>%
    rename(circunscripcion = name) %>%
    janitor::clean_names() %>%
    mutate(
        region = "REGIÓN AUTÓNOMA COSTA CARIBE NORTE"
    )

regionales2019 <- bind_rows(raccn, raccs) %>%
    select(region, everything())

regionales2019 <- regionales2019 %>%
    mutate(
        across(
            everything(),
                ~ str_remove_all(.x, "N/P|NP")
        ),
        across(
            c(3:15),
        ~ as.numeric(str_remove_all(.x, ","))
        )
    )

usethis::use_data(regionales2019, overwrite = TRUE)

