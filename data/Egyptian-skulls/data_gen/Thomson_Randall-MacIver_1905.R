library(tidyverse)

# File Path
appendix_path <- "../appendix_csvs"

# File names
fn <- list.files(path = appendix_path, pattern = "\\.csv$", full.names = TRUE)

data <- fn |>
  # Merge CSV files
  map_dfr(~ read_csv(.x, col_types = cols(.default = col_character()))) |>
  mutate(
    # Remove "?" from cells
    across(everything(), ~ str_remove_all(., fixed("?"))),
    # Coerce columns to numeric
    across(
      c(
        Table,
        `Glabello-Occipital Length`:`Gnathic Angle`,
        `Estimated Cranial Capacity`
      ),
      as.numeric
    )
  ) |> 
  # Sort by table order
  arrange(Table) |>
  # Rename columns
  rename(
    table = Table,
    start_date = `Start Date`,
    end_date = `End Date`,
    start_era = `Start Era`,
    end_era = `End Era`,
    dynasty = Dynasty,
    location = Location,
    sex = Sex,
    gol = `Glabello-Occipital Length`,
    ool = `Ophryo-Occipital Length`,
    bbh = `Basi-Bregmatic Height`,
    mb = `Maximum Breadth`,
    biaurb = `Biauricular Breadth`,
    bizygb = `Bizygomatic Breadth`,
    bnl = `Basi-Nasal Length`,
    bal = `Basi-Aveolar Length`,
    nah = `Nasi-Alveolar Height`,
    nh = `Nasal Height`,
    nw = `Nasal Width`,
    fai = `Flower’s Alveolar Index`,
    ga = `Gnathic Angle`,
    po = `Prognathism or Orthognathism`,
    cc = `Estimated Cranial Capacity`
  )

length(unique(data$table))

nrow(data)
ncol(data)

write_csv(data, "../Thomson_Randall-MacIver_1905.csv", na = "")
