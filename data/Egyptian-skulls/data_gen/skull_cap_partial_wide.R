library(tidyverse)
data <- read_csv("../Thomson_Randall-MacIver_1905.csv") |> 
  select(start_date, dynasty, location, sex, cc) |> 
  drop_na(cc) |> 
  mutate(start_date = case_when(
    start_date == -4800 ~ "c4800BC",
    start_date == -4200 ~ "c4200BC",
    start_date == -4000 ~ "c4000BC",
    start_date == -3500 ~ "c3500BC",
    start_date == -2780 ~ "c2780BC",
    start_date == -1590 ~ "c1590BC",
    start_date == -378 ~  "c378BC",
    start_date == -331 ~  "c331BC",
    start_date == -3700 ~ "c3700BC",
    is.na(start_date) ~ "predynastic"
    )
  )

data <- data |> 
  group_by(start_date, sex) |> 
  mutate(id = row_number())

data <- data |> 
  select(-c(dynasty, location)) |> 
  pivot_wider(names_from = start_date, values_from = cc) |> 
  select(-c(id)) |> 
  select(sex, predynastic, c4800BC, c4200BC, c4000BC, 
         c3700BC, c3500BC, c2780BC, c1590BC, c378BC, c331BC)

write_csv(data, "../skull_cap_partial_wide.csv", na = "")

