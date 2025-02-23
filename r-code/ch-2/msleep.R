library(tidyverse)
library(knitr)
library(kableExtra)

# Create and format LaTeX table
msleep[1:10, ] |>
  kable("latex", booktabs = TRUE) |>
  kable_styling(latex_options = c("striped", "hold_position"))