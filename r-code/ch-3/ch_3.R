library(tidyverse)
skulls <- read_csv("skull_cap_partial_wide.csv")
# write_tsv(skulls, "temp.tsv")

skulls

# Total amount of measurements
sum(!is.na(skulls[, 2:ncol(skulls)]))

mean(skulls$predynastic, na.rm = TRUE)

skulls[1:5, 3]

skulls_df <- read.csv("skull_cap_partial_wide.csv")
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

skulls <- read_csv("skull_cap_partial_wide.csv") |>
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
  geom_bar(stat = "identity")

ggsave("bar_1.pdf", units = "cm", width = 20, height = 9)

#------------------------------------------------------------------------------
# egypt_pal <- c(
#   "predynastic" = "#7E6A58",
#   "c4800BC" = "#C2B280",
#   "c4200BC" = "#6A8347",
#   "c4000BC" = "#A23E2A",
#   "c3700BC" = "#B04E0F",
#   "c3500BC" = "#2E8B8B",
#   "c2780BC" = "#264653",
#   "c1590BC" = "#D4AF37",
#   "c378BC"  = "#8B8589",
#   "c331BC"  = "#C9C9C9"
# )

egypt_pal <- c(
  "#7E6A58", "#C2B280", "#6A8347", "#A23E2A", "#B04E0F",
  "#2E8B8B", "#264653", "#D4AF37", "#8B8589", "#C9C9C9"
)

egypt_pal["c2780BC"]

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_manual(values = egypt_pal)

ggsave("bar_2.pdf", units = "cm", width = 24, height = 9)

#------------------------------------------------------------------------------

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_manual(values = egypt_pal, guide = "none")

ggsave("bar_3.pdf", units = "cm", width = 24, height = 9)

#------------------------------------------------------------------------------

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_manual(values = egypt_pal, guide = "none") +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25)


ggsave("bar_4.pdf", units = "cm", width = 24, height = 9)

#------------------------------------------------------------------------------

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_manual(values = egypt_pal, guide = "none") +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  scale_x_discrete(
    labels = c(
      "c.1590 BC", "c.2780 BC", "c.331 BC", "c.3500 BC", "c.3700 BC",
      "c.378 BC", "c.4000 BC", "c.4200 BC", "c.4800 BC", "Predynastic"
    )
  ) +
  labs(
    x = "Period",
    y = "Cranial Capacity (cm³)"
  )

ggsave("bar_5.pdf", units = "cm", width = 24, height = 9)

#------------------------------------------------------------------------------

skulls$period <- factor(skulls$period)
skulls
skulls$period

levels(skulls$period)

skulls$period <- factor(skulls$period,
  levels = c(
    "predynastic", "c4800BC", "c4200BC", "c4000BC", "c3700BC",
    "c3500BC", "c2780BC", "c1590BC", "c378BC", "c331BC"
  )
)

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
  geom_bar(stat = "identity")

ggsave("bar_6.pdf", units = "cm", width = 24, height = 9)

levels(skull_summary$period) <- c(
  "Predynastic", "c.4800 BC", "c.4200 BC", "c.4000 BC", "c.3700 BC",
  "c.3500 BC", "c.2780 BC", "c.1590 BC", "c.378 BC", "c.331 BC"
)

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_manual(values = egypt_pal, guide = "none") +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  labs(
    x = "Period",
    y = "Cranial Capacity (cm³)"
  )

ggsave("bar_7.pdf", units = "cm", width = 24, height = 9)
