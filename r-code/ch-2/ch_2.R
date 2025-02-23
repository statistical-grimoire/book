library(tidyverse)
library(xtable)
library(patchwork)
options(pillar.print_min = 40,
        pillar.print_max = 40,
        pillar.print_width = Inf)
set.seed(666)
#-------------------------------------------------------------------------------

pdf("graphics/base_hist.pdf",
    width = 4, height = 3)
x <- rnorm(10000)
hist(x)
dev.off()

#-------------------------------------------------------------------------------

ggplot(data = msleep, aes(x = bodywt, y = sleep_total))

ggsave('graphics/ggEx_1.pdf', units = 'cm', width = 9.5, height = 7)

#-------------------------------------------------------------------------------

ggplot(data = msleep, aes(x = bodywt, y = sleep_total)) +
  geom_point()

ggsave('graphics/ggEx_2.pdf', units = 'cm', width = 9.5, height = 7)

#-------------------------------------------------------------------------------

msleep$bodywt_log10 <- log10(msleep$bodywt)

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point()

ggsave('graphics/ggEx_3.pdf', units = 'cm', width = 9.5, height = 7)

#-------------------------------------------------------------------------------

msleep$bodywt_log10 <- log10(msleep$bodywt)

ggplot(msleep, aes(x = bodywt, y = sleep_total)) +
  geom_point() +
  scale_x_continuous(trans = "log10")

ggsave('graphics/ggEx_4.pdf', units = 'cm', width = 9.5, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3,
    shape = 4,
    colour = "blue",
    stroke = 1.5
  )

ggsave('graphics/ggEx_5.pdf', units = 'cm', width = 9.5, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3,
    shape = 25,
    colour = "black",
    stroke = 1.5,
    fill = "red"
  )

ggsave('graphics/ggEx_6.pdf', units = 'cm', width = 9.5, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore))

ggsave('graphics/ggEx_7.pdf', units = 'cm',width = 11, height = 7)

#-------------------------------------------------------------------------------

is.na(msleep$vore)

msleep$vore <- ifelse(is.na(msleep$vore), "unknown", msleep$vore)

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore))


ggsave('graphics/ggEx_8.pdf', units = 'cm',width = 11, height = 7)
#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore, shape = vore))


ggsave('graphics/ggEx_9.pdf', units = 'cm', width = 11, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore, shape = vore)) +
  geom_smooth()

ggsave('graphics/ggEx_10.pdf', units = 'cm', width = 11, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore, shape = vore)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linetype = 2,
    linewidth = 0.5,
    colour = "black"
  )

ggsave('graphics/ggEx_11.pdf', units = 'cm', width = 11, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore, shape = vore)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    colour = "black",
    linewidth = 0.5,
    aes(group = vore)
  )

ggsave('graphics/ggEx_12.pdf', units = 'cm', width = 11, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore, shape = vore)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 0.5,
    aes(colour = vore,
        linetype = vore)
  )

ggsave('graphics/ggEx_13.pdf', units = 'cm', width = 11, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, aes(colour = vore, shape = vore)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 0.5,
    aes(colour = vore)
  ) +
  facet_wrap(~vore)

ggsave('graphics/ggEx_14.pdf', units = 'cm', width = 15, height = 10)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 0.5
  ) +
  facet_wrap(~vore, nrow = 1)

ggsave('graphics/ggEx_15.pdf', units = 'cm', width = 20, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 0.5
  ) +
  facet_wrap(~vore, nrow = 1) +
  xlab("Log10(Body Weight kg)") + 
  ylab("Sleep Total (hrs)") 

ggsave('graphics/ggEx_16.pdf', units = 'cm', width = 20, height = 7)

#ggsave('msleep_plot.png', dpi = 300, units = 'cm', width = 20, height = 7)
#ggsave('msleep_plot.svg', dpi = 300, units = 'cm', width = 20, height = 7)
#ggsave('msleep_plot.pdf', dpi = 300, units = 'cm', width = 20, height = 7)

#-------------------------------------------------------------------------------

mode(msleep$bodywt_log10)
mode(msleep$sleep_total)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 0.5
  ) +
  facet_wrap(~vore, nrow = 1) +
  xlab("Log10(Body Weight kg)") + 
  ylab("Sleep Total (hrs)") + 
  scale_x_continuous(breaks = c(1,2,3))

ggsave('graphics/ggEx_17.pdf', units = 'cm', width = 20, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 0.5
  ) +
  facet_wrap(~vore, nrow = 1) +
  xlab("Log10(Body Weight kg)") + 
  ylab("Sleep Total (hrs)") + 
  scale_x_continuous(breaks = seq(-2, 4, 1)) +
  scale_y_continuous(breaks = seq(0, 20, 2))

ggsave('graphics/ggEx_18.pdf', units = 'cm', width = 20, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 0.5
  ) +
  facet_wrap(~vore, nrow = 1) +
  xlab("Log10(Body Weight kg)") + 
  ylab("Sleep Total (hrs)") +
  scale_x_continuous(breaks = seq(-2, 4, 1)) +
  scale_y_continuous(breaks = seq(0, 20, 2)) +
  coord_cartesian(xlim = c(-2, 1), ylim = c(-5, 10))

ggsave('graphics/ggEx_19.pdf', units = 'cm', width = 20, height = 7)

#-------------------------------------------------------------------------------

# ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
#   geom_point(size = 3) +
#   geom_smooth(
#     method = "lm",
#     se = FALSE,
#     linewidth = 0.5
#   ) +
#   facet_wrap(~vore, nrow = 1) +
#   xlab("Log10(Body Weight kg)") + 
#   ylab("Sleep Total (hrs)") +
#   ylim(-2, 1)

#-------------------------------------------------------------------------------

library(RColorBrewer)

pdf("graphics/col_gradient.pdf", width = 10, height = 1.5)
par(mar = c(0, 0, 0, 0))
image(1:9,1,as.matrix(1:9),col=brewer.pal(9,"YlOrRd"))
dev.off()


pdf("graphics/col_discrete.pdf", width = 10, height = 1.5)
par(mar = c(0, 0, 0, 0))
image(1:9,1,as.matrix(1:9), col = brewer.pal(9,"Set1"))
dev.off()

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(size = 3, shape = 21, stroke = 2)

ggsave('graphics/ggEx_20.pdf', units = 'cm', width = 9.5, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 2,
    aes(colour = vore)
  )

ggsave('graphics/ggEx_21.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 2,
    aes(colour = vore)
  ) +
  scale_colour_discrete(type = c("red", "blue", "green", "purple", "orange"))
  #scale_colour_manual(values = c("red", "blue", "green", "purple", "orange"))

ggsave('graphics/ggEx_22.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

# Create a colour palette
palette <- c(
  "#000000", "#DF536B", "#61D04F", "#2297E6", "#28E2E5", "#CD0BBC", "#F5C710",
  "#9E9E9E"
)

# Use that palette in your plot
ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 2,
    aes(colour = vore)
  ) +
  scale_colour_discrete(type = palette)

ggsave('graphics/ggEx_23.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 1, colour = "black",
    aes(fill = vore)
  ) +
  scale_fill_discrete(type = palette)

ggsave('graphics/ggEx_24.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

library(extrafont)
fonts_installed <- fonts()
#font_import()


palette.pals()[1]
palette.colors(n = NULL, "Dark 2")

for(i in 1:16){
  print(palette.pals()[i])
  print(length(palette.colors(n = NULL, palette.pals()[i])))
}


pdf("graphics/palettes.pdf", width = 7, height = 7, family = "Courier")

par(mar = c(0, 3, 3, 0), mfrow = c(8, 2), oma = c(0, 0, 0, 3))

for(i in 1:16){

pal_name <- palette.pals()[i]
pal_hex <- palette.colors(n = NULL, pal_name)
pal_length <- length(pal_hex)
  
image(1:8,1, as.matrix(1:8), 
      col = pal_hex,
      main = paste(pal_name, ": ", pal_length, " colours", sep = ""),
      xaxt = "n", yaxt = "n", bty = "n", xlab = "", ylab = "",
      font.main = 1, cex.main = 1.5, adj = 0)
}

dev.off()


#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 1, colour = "black",
    aes(fill = vore)
  ) +
  scale_fill_discrete(type = palette.colors(n = NULL, "Dark2"))

ggsave('graphics/ggEx_25.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 1, colour = "black",
    aes(fill = log10(brainwt))
  )

ggsave('graphics/ggEx_26.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

filter(msleep, is.na(brainwt))$name

#-------------------------------------------------------------------------------

# scale_colour_gradient example

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 1, colour = "black",
    aes(fill = log10(brainwt))
  ) +
  scale_fill_gradient(
    low = "blue",
    high = "red",
    na.value = "green", 
    breaks = seq(-4, 1, 1)
  )

ggsave('graphics/ggEx_27.pdf', units = 'cm', width = 12, height = 7)


#-------------------------------------------------------------------------------

# scale_colour_gradient2 example

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 1, colour = "black",
    aes(fill = log10(brainwt))
  ) +
  scale_fill_gradient2(
    low = "blue",
    mid = "grey",
    high = "red",
    midpoint = -1.5,
    na.value = "green", 
    breaks = seq(-4, 1, 1)
  )

ggsave('graphics/ggEx_28.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

hcl.pals(type = "sequential")

hcl.pals(type = "diverging")

hcl.pals(type = "qualitative")

hcl.colors(n = 8, palette = "Inferno")

#-------------------------------------------------------------------------------

# Sequential Palettes

pdf("graphics/hcl_pals_seq.pdf", width = 8.5, height = 11, family = "Courier")
par(mar = c(0, 2, 2, 0), mfrow = c(24, 3), oma = c(0, 0, 0, 2))

for(i in 1:length(hcl.pals(type = "sequential"))){
  
  pal_name <- hcl.pals(type = "sequential")[i]
  pal_hex <- hcl.colors(n = 8, palette = pal_name)
  pal_length <- length(pal_hex)
  
  image(1:8,1, as.matrix(1:8), 
        col = pal_hex,
        main = pal_name,
        xaxt = "n", yaxt = "n", bty = "n", xlab = "", ylab = "",
        font.main = 1, cex.main = 1, adj = 0)
}

dev.off()

# Diverging Palettes

pdf("graphics/hcl_pals_div.pdf", width = 8.5, height = 11, family = "Courier")
par(mar = c(0, 2, 2, 0), mfrow = c(24, 3), oma = c(0, 0, 0, 2))

for(i in 1:length(hcl.pals(type = "diverging"))){
  
  pal_name <- hcl.pals(type = "diverging")[i]
  pal_hex <- hcl.colors(n = 11, palette = pal_name)
  pal_length <- length(pal_hex)
  
  image(1:11,1, as.matrix(1:11), 
        col = pal_hex,
        main = pal_name,
        xaxt = "n", yaxt = "n", bty = "n", xlab = "", ylab = "",
        font.main = 1, cex.main = 1, adj = 0)
}

dev.off()

# Qualitative Palettes

pdf("graphics/hcl_pals_qual.pdf", width = 8.5, height = 11, family = "Courier")
par(mar = c(0, 2, 2, 0), mfrow = c(24, 3), oma = c(0, 0, 0, 2))

for(i in 1:length(hcl.pals(type = "qualitative"))){
  
  pal_name <- hcl.pals(type = "qualitative")[i]
  pal_hex <- hcl.colors(n = 6, palette = pal_name)
  pal_length <- length(pal_hex)
  
  image(1:6,1, as.matrix(1:6), 
        col = pal_hex,
        main = pal_name,
        xaxt = "n", yaxt = "n", bty = "n", xlab = "", ylab = "",
        font.main = 1, cex.main = 1, adj = 0)
}

dev.off()

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, shape = 21, stroke = 1, colour = "black",
    aes(fill = log10(brainwt))
  ) +
  scale_fill_gradientn(
    colours = hcl.colors(n = 50, palette = "Inferno"),
    na.value = "grey", 
    breaks = seq(-4, 1, 1)
  )

ggsave('graphics/ggEx_29.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, stroke = 1, colour = "black",
    aes(fill = vore, shape = vore)
  ) +
  scale_shape_manual(values = c(21:24, 13)) +
  scale_fill_discrete(type = palette.colors(n = NULL, "R4"))

ggsave('graphics/ggEx_30.pdf', units = 'cm', width = 12, height = 7)


#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, stroke = 1, colour = "black",
    aes(fill = vore, shape = vore)
  ) +
  scale_shape_manual(values = c(21:24, 13), name = "Diet") +
  scale_fill_discrete(type = palette.colors(n = NULL, "R4"), name = "Diet")

ggsave('graphics/ggEx_31.pdf', units = 'cm', width = 12, height = 7)


#-------------------------------------------------------------------------------

ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, stroke = 1, colour = "black",
    aes(fill = vore, shape = vore)
  ) +
  scale_shape_manual(values = c(21:24, 13)) +
  scale_fill_discrete(type = palette.colors(n = NULL, "R4")) +
  labs(
    shape = "Diet",
    fill = "Diet"
  )

ggsave('graphics/ggEx_31.pdf', units = 'cm', width = 12, height = 7)


#-------------------------------------------------------------------------------

my_plot <- ggplot(msleep, aes(x = bodywt_log10, y = sleep_total)) +
  geom_point(
    size = 3, colour = "black",
    aes(fill = vore, shape = vore)
  ) +
  scale_shape_manual(values = c(21:24, 13)) +
  scale_fill_discrete(type = palette.colors(n = NULL, "R4")) +
  labs(
    shape = "Diet",
    fill = "Diet"
  ) +
  xlab("Log10(Body Weight kg)") + ylab("Sleep Total (hrs)")

ggsave('graphics/ggEx_32.pdf', plot = my_plot, units = 'cm', width = 12, height = 7)

theme_p1 <- my_plot + theme_grey() + ggtitle("theme_grey()")
theme_p2 <- my_plot + theme_bw() + ggtitle("theme_bw()")
theme_p3 <- my_plot + theme_linedraw() + ggtitle("theme_linedraw()")
theme_p4 <- my_plot + theme_light() + ggtitle("theme_light()")
theme_p5 <- my_plot + theme_dark() + ggtitle("theme_dark()")
theme_p6 <- my_plot + theme_minimal() + ggtitle("theme_minimal()")
theme_p7 <- my_plot + theme_classic() + ggtitle("theme_classic()")
theme_p8 <- my_plot + theme_void() + ggtitle("theme_void()")

(theme_p1 + theme_p2 + theme_p3 + theme_p4) /
  (theme_p5 + theme_p6 + theme_p7 + theme_p8) &
  theme(
    #axis.text = element_text(size = 12),
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    plot.title = element_text(
      size = 18,
      margin = margin(t = 0, r = 0, b = 0.5, l = 0, "cm"),
      family = "Courier New"
    )
  )

ggsave("graphics/ggEx_themes.pdf",
  units = "cm", width = 30, height = 35,
  device = cairo_pdf
)

#-------------------------------------------------------------------------------

my_plot + theme_bw() +
  theme(
    axis.text = element_text(size = 18, face = "bold", colour = "red", angle = 45)
  )

ggsave('graphics/ggEx_33.pdf', units = 'cm', width = 12, height = 7)

#-------------------------------------------------------------------------------

my_plot + theme_bw() +
  theme(
    axis.text.x = element_text(
      size = 18, face = "bold", colour = "red", angle = 45,
      margin = margin(t = 1, r = 0, b = 0, l = 0, unit = "cm")
    )
  )

ggsave('graphics/ggEx_34.pdf', units = 'cm', width = 12, height = 9)

#-------------------------------------------------------------------------------

my_plot + theme_bw() +
  theme(
    axis.text.x = element_text(
      size = 18, face = "bold", colour = "red", angle = 45,
      margin = margin(t = 1, r = 0, b = 0, l = 0, unit = "cm")
    ),
    axis.title.y = element_text(
      size = 18, face = "italic", colour = "deepskyblue3", angle = 90
    )
  )

ggsave('graphics/ggEx_35.pdf', units = 'cm', width = 12, height = 9)






