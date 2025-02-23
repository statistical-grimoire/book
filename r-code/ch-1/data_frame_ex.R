library(tidyverse)
library(knitr)
library(kableExtra)

df <- data.frame(
  Subject = 1:10,
  Group = c("Exp", "Cont", "Exp", "Cont", "Exp",
            "Exp","Cont", "Exp", "Cont", "Cont"),
  Value = c(-0.36, 0.28, 1.54, 0.51, -1.28,
            1.15, 6 - 2.22, -0.51, NA, -1.04)
  )

df

# Create and format LaTeX table
df |>
  kable("latex", booktabs = TRUE) |>
  kable_styling(latex_options = c("striped", "hold_position"))