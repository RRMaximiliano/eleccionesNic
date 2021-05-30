## code to prepare `DATASET` dataset goes here

library(readr)

nic_elecciones <- read_csv("inst/extdata/elecciones_presidenciales_1990-2006.csv")

usethis::use_data(nic_elecciones, overwrite = TRUE)
