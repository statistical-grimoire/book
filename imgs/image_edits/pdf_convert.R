library(magick)

# Read and convert in one pipeline
image_read_pdf("./imgs/image_edits/t_pennant.pdf", density = 600) |>
  image_write(path = "./imgs/plotting/t_pennant.png", format = "png")
