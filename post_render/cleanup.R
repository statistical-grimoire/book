if (file.exists("temp_dir")) {
  result <- unlink("temp_dir", recursive = TRUE)
  if (result == 1) {
    warning("Some './temp_dir' files may not have been deleted")
  } else {
    message("./temp_dir deleted\n")
  }
}
