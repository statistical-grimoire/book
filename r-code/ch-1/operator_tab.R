library(tidyverse)
library(knitr)
library(kableExtra)

operators <- tibble(
  Type = c(
    "Assignment", "Assignment", "Assignment", "Assignment", "Assignment",
    "Arithmetic", "Arithmetic", "Arithmetic", "Arithmetic", "Arithmetic", "Arithmetic", "Arithmetic",
    "Relational", "Relational", "Relational", "Relational", "Relational", "Relational"
  ),
  Operator = c(
    "x <- value", "value -> x", "x <<- value", "value ->> x", "x = value",
    "x + y", "x - y", "x * y", "x / y", "x ^ y", "x %% y", "x %/% y",
    "x < y", "x > y", "x <= y", "x >= y", "x == y", "x != y"
  ),
  Description = c(
    "Assign a value to a name.", "Assign a value to a name.",
    "(see Appendix A)", "(see Appendix A)", "Assign a value to a name.",
    "Adds values of objects", "Subtracts values of objects",
    "Multiplies the value of objects", "Divides the value of objects",
    "Raises the value of one object to another", "Returns the quotient of objects",
    "Returns the remainder of objects",
    "Checks if x is less than y", "Checks if x is greater than y",
    "Checks if x is less than or equal to y", "Checks if x is greater than or equal to y",
    "Checks if x is equal to y", "Checks if x is not equal to y"
  )
)

operators

# Create and format LaTeX table
operators |>
  kable("latex", booktabs = TRUE) |>
  kable_styling(latex_options = c("striped", "hold_position"))