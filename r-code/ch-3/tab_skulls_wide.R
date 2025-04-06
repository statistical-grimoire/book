library(tidyverse)
library(knitr)
library(kableExtra)

skulls <- read_csv("skull_cap_partial_wide.csv")

# Create and format LaTeX table
skulls[1:10, ] |>
  kable("latex", booktabs = TRUE) |>
  kable_styling(latex_options = c("striped", "hold_position"))