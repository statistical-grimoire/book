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

pi_df$pie[1]

#options(pillar.sigfig = 16)
pi_df

mean(skulls$c4000_BCE)

apply(skulls, MARGIN = 2, FUN = mean)

apply(skulls[, 2:6], MARGIN = 1, FUN = sum)







