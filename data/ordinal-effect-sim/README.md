# Ordinal Data and Effect Size Inflation: A Simulation

This repository contains R code for a simulation study that demonstrates how treating **ordinal Likert-scale data** as if it were **interval-scaled** can lead to **inflated effect size estimates** when using **Cohen's *d***.

The simulation compares estimated effect sizes under two assumptions:
- When **Likert values (1–5)** are treated as **equally spaced interval values**, and
- When values are mapped onto a **nonlinear psychological scale** that reflects more realistic spacing between categories (e.g., a jump from 4 to 5 may feel larger than from 1 to 2).

---

## Background

Ordinal scales—such as those based on Likert items—are often analyzed using methods that assume interval-level measurement. This includes calculating means, standard deviations, *t*-tests, and Cohen’s *d*. However, the assumption of equal spacing between values is often unjustified, especially when numeric labels mask unequal psychological distances.

This simulation illustrates:
- How Cohen’s *d* can be **inflated** by misapplying interval assumptions,
- Why the **underlying structure of the response scale** matters,
- The importance of **choosing effect size measures appropriate for the level of measurement**.

---

## Repository Contents

- `ordinal_simulation.R` – Main script to run the simulation.
- `ordinal_effect_sim_results.csv` – Output from the simulation in comma-separated format.
- `ord_vs_int_effect.pdf` – Plot comparing the distributions of Cohen’s *d* under ordinal and interval assumptions.
- `README.md` – This file.

---

## How to Run the Simulation

1. Ensure you have R (≥ 4.0.0) installed.
2. Install the required packages if you don’t already have them:

```r
install.packages(c("tidyverse", "effsize"))

```

3. Run the script:

```r
source("ordinal_simulation.R")
```

The script simulates 10,000 experiments, compares group-level differences using both interval and ordinal assumptions, and produces a histogram showing the distribution of effect sizes.

---

## Citation

If you use this code, dataset, or plot in your research, teaching, or publications, please cite the repository as follows:

### APA-style citation:

> Pisklak, J. (2025). *Ordinal Data and Effect Size Inflation: A Simulation* (Version 1.0) [Computer software]. https://github.com/statistical-grimoire/book/tree/main/data/ordinal-effect-sim

### BibTeX

```
@misc{ordinal_sim,
  author       = {Pisklak, Jeffrey M.},
  title        = {Ordinal Data and Effect Size Inflation: A Simulation Study},
  year         = {2024},
  url          = {https://github.com/statistical-grimoire/book/tree/main/data/ordinal-effect-sim},
  note         = {Version 1.0}
}
```
