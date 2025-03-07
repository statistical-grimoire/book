library(tidyverse)
skulls <- read_csv("Max_Breadth_TRM_1905.csv")

skulls

mean(skulls$c3300_BCE)

skulls <- read_delim("Max_Breadth_TRM_1905.csv", delim = ",")

skulls[1:5, 3]

skulls_df <- read.csv("Max_Breadth_TRM_1905.csv")
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

skulls

# options(
#   pillar.print_min = 20,
#   pillar.width = Inf
# )

skulls

pi_df <- tibble(pie = rep(pi, 4))
pi_df

print(pi_df$pie[1], digits = 16)

# options(pillar.sigfig = 16)
pi_df

mean(skulls$c4000_BCE)

apply(skulls, MARGIN = 2, FUN = mean)

apply(skulls[, 2:6], MARGIN = 1, FUN = sum)

skulls_tidy <- pivot_longer(skulls,
  cols = c4000_BCE:c150_CE,
  names_to = "period",
  values_to = "max_breadth"
)
skulls_tidy

mean(skulls_tidy$max_breadth)

skulls_tidy$max_breadth |>
  mean() |>
  round(2)

skulls_tidy |> 
  filter(period == "c1850_BCE") |> 
  select(period, max_breadth)

skulls <- read_csv("Max_Breadth_TRM_1905.csv") |>
  pivot_longer(
    cols = c4000_BCE:c150_CE,
    names_to = "period",
    values_to = "max_breadth"
  ) |>
  select(period, max_breadth)

skulls

skull_summary <- skulls |>
  group_by(period) |>
  summarise(
    m = mean(max_breadth),
    n = length(max_breadth),
    N = nrow(skulls),
    m_cm = m / 10,
    min = min(max_breadth),
    max = max(max_breadth)
  )

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(stat = "identity")

ggsave('bar_1.pdf', units = 'cm', width = 12, height = 9)

#------------------------------------------------------------------------------
egypt_pal <- c("#E3C9A8", "#0C2C84", "#D4AF37", "#20603D", "#A23E0E")

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_discrete(type = egypt_pal)

ggsave('bar_2.pdf', units = 'cm', width = 16, height = 9)

#------------------------------------------------------------------------------

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_discrete(type = egypt_pal) +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25)

ggsave('bar_3.pdf', units = 'cm', width = 16, height = 9)

#------------------------------------------------------------------------------

ggplot(skull_summary, aes(x = period, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = period)
  ) +
  scale_fill_discrete(type = egypt_pal, guide = "none") +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  scale_x_discrete(
    labels = c("c150 CE", "c1850 BCE", "c200 BCE", "c3300 BCE", "c4000 BCE")
  ) +
  xlab("Period") +
  ylab("Maximum Breadth (mm)")

ggsave("bar_4.pdf", units = "cm", width = 16, height = 9)

skulls_tidy$period <- factor(skulls_tidy$period)

levels(skulls_tidy$period)






























