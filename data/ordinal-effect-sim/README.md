# Ordinal Data and Effect Size Inflation: A Simulation

This repository contains R code for a simulation that demonstrates how treating **ordinal Likert-scale data** as if it were **interval-scaled** can lead to **inflated effect size estimates** when using **Cohen's *d***.

Specifically, the code compares the estimated effect size when:
- **Likert values (1–5)** are treated as **equally spaced interval values**, versus
- A **nonlinear psychological scale** is used to reflect more realistic spacing between categories (e.g., a jump from 4 to 5 is subjectively much larger than from 1 to 2).

---

## Background

Ordinal scales such as Likert items are commonly analyzed using methods that assume interval-level measurement. This includes calculating means, standard deviations, *t*-tests, and effect sizes like Cohen’s *d*. However, the **equal interval assumption** is often unjustified — particularly when the numeric labels mask unequal psychological distances between categories.

This simulation illustrates:
- How Cohen’s *d* can be **inflated** by this assumption,
- That the **shape of the underlying psychological scale** matters,
- Why **ordinal data requires careful treatment** in statistical analysis.

---

## Contents

- `ordinal_simulation.R` – Main script for the simulation study.
- `README.md` – This file.
- `ordinal_effect_sim_results.csv` – Data file of raw values obtained from the simulation (comma seperated values format).
- `ord_vs_int_effect.pdf` - Plot of generated distributions.

---

## How to Run

1. Make sure you have R (≥ 4.0.0) installed.
2. Install the required packages if you don’t already have them:

```r
install.packages(c("tidyverse", "effsize"))
```

3. Run the script:

```r
source("ordinal_simulation.R")
```
