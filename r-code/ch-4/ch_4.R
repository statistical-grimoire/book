library(tidyverse)
skulls <- read_csv("https://raw.githubusercontent.com/statistical-grimoire/book/refs/heads/main/data/Egyptian-skulls/Thomson_Randall-MacIver_1905.csv")

library(knitr)
library(kableExtra)
options(knitr.kable.NA = '')

View(filter(skulls, table %in% c(1, 2)))

# Create and format LaTeX table
filter(skulls, table %in% c(1, 2)) |>
  kable("latex", booktabs = TRUE) |>
  kable_styling(latex_options = c("striped", "hold_position"))

#-------------------------------------------------------------------------------

library(tidyverse)
skulls <- read_csv("https://raw.githubusercontent.com/statistical-grimoire/book/refs/heads/main/data/Egyptian-skulls/Thomson_Randall-MacIver_1905.csv")

skulls <- skulls |> 
  select(table:sex, cc) |> # grab relevant columns
  drop_na(cc) # remove rows containing NAs

nrow(skulls)
