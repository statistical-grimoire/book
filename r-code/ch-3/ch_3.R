library(tidyverse)
library(xtable)
set.seed(666)

#-------------------------------------------------------------------------------

mm_tab <- read_csv("../../data/ch-3/MM-candy/MM_Madison_wide.csv")

mm_tab <- mm_tab %>% mutate_at(
  c("year", "blue", "brown", "green", "orange", "red", "yellow"),
  as.integer
)

xtable(mm_tab[1:6,])

write_tsv(mm_tab[1:6,], "temp.tsv")
file.remove("temp.tsv")

#-------------------------------------------------------------------------------

mm_df <- read_csv("../../data/ch-3/MM-candy/MM_Madison_wide.csv")
mm_df

mean(mm_df$green)

#-------------------------------------------------------------------------------

mm_df <- read_delim("../../data/ch-3/MM-candy/MM_Madison_wide.csv", delim = ",")
mm_df

#-------------------------------------------------------------------------------

df <- tibble(
  Subject = 1:10,
  Group = c("Exp", "Cont", "Exp", "Cont", "Exp", "Exp",
            "Cont", "Exp", "Cont", "Cont"),
  Value = c(-0.36,  0.28,  1.54,  0.51, -1.28,  1.15,
            -2.22, -0.51,  NA, -1.04)
)

df

#-------------------------------------------------------------------------------

df <- as.data.frame(df)
df

#-------------------------------------------------------------------------------

df <- as_tibble(df)
df

#-------------------------------------------------------------------------------

mm_df
print(mm_df, n = 20)

#-------------------------------------------------------------------------------

options(
  pillar.print_min = 30,
  pillar.print_max = 30
)

mm_df

options(
  pillar.print_min = Inf
)

mm_df

options(
  pillar.print_min = 30,
  pillar.print_max = 30,
  pillar.width = Inf
)

mm_df

print(mm_df, n = 30, width = Inf)

#-------------------------------------------------------------------------------

pi

pi_df <- tibble(pie = rep(pi, 4))
pi_df

pi_df$pie[1]

options(pillar.sigfig = 16)
pi_df

#-------------------------------------------------------------------------------


mean(mm_df$red)

apply(mm_df, MARGIN = 2, FUN = mean)

apply(mm_df[, 4:9], MARGIN = 1, FUN = sum)

#-------------------------------------------------------------------------------

options(
  pillar.print_min = 12,
  pillar.print_max = 12
)

mm_tidy <- pivot_longer(mm_df,
  cols = blue:yellow,
  names_to = "type", values_to = "amount"
)

mm_tidy

#-------------------------------------------------------------------------------

options(
  pillar.print_min = 10,
  pillar.print_max = 10
)

mean(mm_tidy$amount)

mm_tidy$amount |> mean()

filter(mm_tidy, type == "red")

mm_tidy |> filter(type == "red")

mm_tidy |> 
  filter(type == "red") |>
  select(pkg, type, amount)

#-------------------------------------------------------------------------------
options(pillar.sigfig = 3)

mm_data <- read_csv("../../data/ch-3/MM-candy/MM_Madison_wide.csv") |>
  pivot_longer(cols = blue:yellow, names_to = "type", values_to = "amount") |>
  select(pkg, type, amount)

mm_data

mm_data |> 
  summarise(m = mean(amount))

mm_data |> 
  group_by(type) |>
  summarise(m = mean(amount))

mm_data |>
  group_by(type) |>
  summarise(
    m = mean(amount),
    tot_type = sum(amount)
  )

sum(mm_data$amount)

mm_data |>
  group_by(type) |>
  summarise(
    m = mean(amount),
    tot_type = sum(amount),
    tot_overall = sum(mm_data$amount)
  )

mm_data |>
  group_by(type) |>
  summarise(
    m = mean(amount),
    tot_type = sum(amount),
    tot_overall = sum(mm_data$amount),
    percent = tot_type / tot_overall * 100
  )

mm_summary <- mm_data |>
  group_by(type) |>
  summarise(
    m = mean(amount),
    tot_type = sum(amount),
    tot_overall = sum(mm_data$amount),
    percent = tot_type / tot_overall * 100,
    min = min(amount),
    max = max(amount)
  )

mm_summary

#-------------------------------------------------------------------------------

ggplot(mm_summary, aes(x = type, y = m)) +
  geom_bar(stat = "identity")

ggsave('graphics/bar_1.pdf', units = 'cm', width = 12, height = 9)

#-------------------------------------------------------------------------------

mm_palette <- c("#2f9fd7", "#603a34", "#31ac55", "#f26f22", "#b11224", "#fff200")

ggplot(mm_summary, aes(x = type, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = type)
  ) +
  scale_fill_discrete(type = mm_palette)

ggsave('graphics/bar_2.pdf', units = 'cm', width = 12, height = 9)


#-------------------------------------------------------------------------------

ggplot(mm_summary, aes(x = type, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = type)
  ) +
  scale_fill_discrete(type = mm_palette) +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25)

ggsave('graphics/bar_3.pdf', units = 'cm', width = 12, height = 9)


#-------------------------------------------------------------------------------

ggplot(mm_summary, aes(x = type, y = m)) +
  geom_bar(
    stat = "identity",
    colour = "black",
    aes(fill = type)
  ) +
  scale_fill_discrete(type = mm_palette, guide = "none") +
  geom_errorbar(aes(ymin = min, ymax = max), width = 0.25) +
  scale_x_discrete(
    labels = c("Blue", "Brown", "Green", "Orange", "Red", "Yellow")
    ) +
  xlab("M&M Colour") + ylab("M&M Amount")

ggsave('graphics/bar_4.pdf', units = 'cm', width = 12, height = 9)


#-------------------------------------------------------------------------------

mm_data$type <- factor(mm_data$type)

mm_data

mm_data$type

levels(mm_data$type)

#-------------------------------------------------------------------------------

mm_data$type <- factor(mm_data$type,
  levels = c("red", "orange", "yellow", "green", "blue", "brown")
)

levels(mm_data$type)

#-------------------------------------------------------------------------------

mm_summary <- mm_data |>
  group_by(type) |>
  summarise(
    m = mean(amount),
    tot_type = sum(amount),
    tot_overall = sum(mm_data$amount),
    percent = tot_type / tot_overall * 100,
    min = min(amount),
    max = max(amount)
  )

mm_summary

#-------------------------------------------------------------------------------

ggplot(mm_summary, aes(x = type, y = m)) +
  geom_bar(stat = "identity")

ggsave('graphics/bar_5.pdf', units = 'cm', width = 12, height = 9)


#-------------------------------------------------------------------------------

levels(mm_summary$type) <- c("Red", "Orange", "Yellow", "Green", "Blue", "Brown")

mm_summary








