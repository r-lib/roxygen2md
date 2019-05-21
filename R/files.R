find_r_files <- function() {
  dir(path = "R", pattern = "[.][rR]$", recursive = TRUE, full.names = TRUE)
}
