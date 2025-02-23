library(tidyverse)
library(knitr)
library(kableExtra)

# Create the data frame
shortcuts <- tibble(
  Description = c(
    "Run current line/section",
    "Clear Console",
    "Move to the beginning of a line",
    "Move to the end of a line",
    "Move the cursor one word/block at a time",
    "Highlight all",
    "Highlight sections",
    "Move cursor to script window",
    "Move cursor to console window",
    "Type the <- operator"
  ),
  Windows = c(
    "Ctrl + Enter",
    "Ctrl + L",
    "Home",
    "End",
    "Ctrl + Left or Right",
    "Ctrl + A",
    "Shift + Up, Down, Left, or Right",
    "Ctrl + 1",
    "Ctrl + 2",
    "Alt + - (minus)"
  ),
  Macintosh = c(
    "Cmd + Return",
    "Ctrl + L",
    "Cmd + Left",
    "Cmd + Right",
    "Option + Left or Right",
    "Cmd + A",
    "Shift + Up, Down, Left, or Right",
    "Ctrl + 1",
    "Ctrl + 2",
    "Option + - (minus)"
  )
)

shortcuts

# Create and format LaTeX table
shortcuts |>
  kable("latex", booktabs = TRUE) |>
  kable_styling(latex_options = c("striped", "hold_position"))




