library(tidyverse)
skulls <- read_csv("https://raw.githubusercontent.com/statistical-grimoire/book/refs/heads/main/data/Egyptian-skulls/skull_cap_partial_wide.csv")
# write_tsv(skulls, "temp.tsv")

skulls

# Total amount of measurements
sum(!is.na(skulls[, 2:ncol(skulls)]))

mean(skulls$predynastic, na.rm = TRUE)

skulls[1:5, 3]

skulls_df <- read.csv("https://raw.githubusercontent.com/statistical-grimoire/book/refs/heads/main/data/Egyptian-skulls/skull_cap_partial_wide.csv")
skulls_df[1:5, 3]

mean(skulls[1:5, 3])

skulls[1:5, 3, drop = TRUE]
mean(skulls[1:5, 3, drop = TRUE])

skulls <- as.data.frame(skulls)
skulls

skulls <- as_tibble(skulls)
skulls

print(skulls, n = 20)

# options(pillar.print_min = 20)

# options(
#   pillar.print_min = 20,
#   pillar.width = Inf
# )

pi_df <- tibble(pie = rep(pi, 4))
pi_df

print(pi_df$pie[1], digits = 16)

# options(pillar.sigfig = 16)
pi_df

mean(skulls$c4800BC, na.rm = TRUE)

apply(skulls[, 2:11], MARGIN = 2, FUN = mean, na.rm = TRUE)

apply(skulls[, 2:11], MARGIN = 1, FUN = max, na.rm = TRUE)

skulls_tidy <- pivot_longer(skulls,
  cols = predynastic:c331BC,
  names_to = "period",
  values_to = "capacity"
)
skulls_tidy

skulls_tidy[5, ]

skulls_tidy <- drop_na(skulls_tidy, capacity)
skulls_tidy

mean(skulls_tidy$capacity)
skulls_tidy$capacity |> mean()


skulls_tidy$capacity |>
  mean() |>
  round(1)

filter(skulls_tidy, period == "predynastic")

skulls_tidy |> filter(period == "predynastic")

skulls_tidy |>
  filter(period == "predynastic") |>
  select(period, capacity)











skulls <- read_csv("https://raw.githubusercontent.com/statistical-grimoire/book/refs/heads/main/data/Egyptian-skulls/skull_cap_partial_wide.csv") |>
  pivot_longer(
    cols = predynastic:c331BC,
    names_to = "period",
    values_to = "capacity"
  ) |>
  drop_na(capacity)

skulls

skulls |>
  summarise(m = mean(capacity))

skulls |>
  group_by(period) |>
  summarise(
    m = mean(capacity),
    n = length(capacity)
  )

nrow(skulls)

skull_summary <- skulls |>
  group_by(period) |>
  summarise(
    m = mean(capacity),
    n = length(capacity),
    N = nrow(skulls),
    m_heq = m / 4800,
    med_heq = median(capacity) / 4800,
    min = min(capacity),
    max = max(capacity)
  )

skull_summary

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity") +
  labs(x = "Period", y = "Cranial Capacity (cm³)")

ggsave("bar_1.pdf", units = "cm", width = 20, height = 9)

skulls$period <- factor(skulls$period)
skulls

# skulls$period

levels(skulls$period)

skulls$period <- factor(skulls$period,
  levels = c(
    "predynastic", "c4800BC", "c4200BC", "c4000BC", "c3700BC",
    "c3500BC", "c2780BC", "c1590BC", "c378BC", "c331BC"
  )
)
levels(skulls$period)

skull_summary <- skulls |>
  group_by(period) |>
  summarise(
    m = mean(capacity),
    n = length(capacity),
    N = nrow(skulls),
    m_heq = m / 4800,
    med_heq = median(capacity) / 4800,
    min = min(capacity),
    max = max(capacity)
  )

skull_summary

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity") +
  labs(x = "Period", y = "Cranial Capacity (cm³)")

ggsave("bar_2.pdf", units = "cm", width = 20, height = 9)

levels(skull_summary$period) <- c(
  "Predynastic", "c.4800 BC", "c.4200 BC", "c.4000 BC", "c.3700 BC",
  "c.3500 BC", "c.2780 BC", "c.1590 BC", "c.378 BC", "c.331 BC"
)
skull_summary

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity") +
  labs(x = "Period", y = "Cranial Capacity (cm³)")

ggsave("bar_3.pdf", units = "cm", width = 20, height = 9)

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity") +
  labs(x = "Period", y = "Cranial Capacity (cm³)") +
  scale_x_discrete(
    labels = c(
      "Predynastic", "c.4800 BC", "c.4200 BC", "c.4000 BC", "c.3700 BC",
      "c.3500 BC", "c.2780 BC", "c.1590 BC", "c.378 BC", "c.331 BC"
      )
  )

skull_summary

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  labs(x = "Period", y = "Cranial Capacity (cm³)")

ggsave("bar_4.pdf", units = "cm", width = 20, height = 9)

length(levels(skulls$period))

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity", colour = "black", fill = "#CBA135") +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  labs(x = "Period", y = "Cranial Capacity (cm³)")

ggsave("bar_5.pdf", units = "cm", width = 20, height = 9)


egypt_pal <- hcl.colors(n = 10, palette = "Green-Brown")

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity", colour = "black", aes(fill = period)) +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  labs(x = "Period", y = "Cranial Capacity (cm³)") +
  scale_fill_manual(values = egypt_pal)

ggsave("bar_6.pdf", units = "cm", width = 20, height = 9)

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity", colour = "black", aes(fill = period)) +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  labs(x = "Period", y = "Cranial Capacity (cm³)") +
  scale_fill_manual(values = egypt_pal, guide = "none")

ggsave("bar_7.pdf", units = "cm", width = 20, height = 9)

#-------------------------------------------------------------------------------

# Load the tidyverse
library(tidyverse)

# Load the data
skulls <- read_csv("https://raw.githubusercontent.com/statistical-grimoire/book/refs/heads/main/data/Egyptian-skulls/skull_cap_partial_wide.csv") |>
  # Pivot to the tidy format
  pivot_longer(
    cols = predynastic:c331BC,
    names_to = "period",
    values_to = "capacity"
  ) |>
  # Remove NAs
  drop_na(capacity)

# Factor and order "period"
skulls$period <- factor(skulls$period,
  levels = c(
    "predynastic", "c4800BC", "c4200BC", "c4000BC", "c3700BC",
    "c3500BC",     "c2780BC", "c1590BC", "c378BC",  "c331BC"
  )
)

# Rename the levels
levels(skulls$period) <- c(
  "Predynastic", "c.4800 BC", "c.4200 BC", "c.4000 BC", "c.3700 BC",
  "c.3500 BC",   "c.2780 BC", "c.1590 BC", "c.378 BC",  "c.331 BC"
)

# Calculate stats for plot
skull_summary <- skulls |>
  group_by(period, sex) |> # Note the addition of a second factor to group by
  summarise(
    m = mean(capacity),
    min = min(capacity),
    max = max(capacity)
  )

skull_summary

# Store desired colours
egypt_pal <- hcl.colors(n = 10, palette = "Green-Brown")

# Plot data
ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  scale_fill_manual(values = egypt_pal, guide = "none") +
  labs(
    x = "Period",
    y = "Cranial Capacity (cm³)"
  ) +
  facet_wrap(~ sex, ncol = 1) # Note the use of facet_wrap
  #facet_wrap(~ period, ncol = 2)

ggsave("bar_8.pdf", units = "cm", width = 24, height = 14)


# Plot data
ggplot(skull_summary, aes(x = sex, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  scale_fill_manual(values = egypt_pal, guide = "none") +
  labs(
    x = "Sex",
    y = "Cranial Capacity (cm³)"
  ) +
  facet_wrap(~ period, ncol = 5)

ggsave("bar_9.pdf", units = "cm", width = 24, height = 13)
