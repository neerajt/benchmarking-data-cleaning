#!/usr/bin/env Rscript

options <- commandArgs(trailingOnly = TRUE)
write_filename <- options[1]

process_line <- function (line, pipe_positions, number_of_pipes) {
  line[pipe_positions[-(number_of_pipes:1)]] <- ';'
  return(paste(line, collapse = ''))
}

number_of_pipes <- 0
file.create(write_filename)
f <- file("stdin")
open(f)
while(length(line <- readLines(f,n=1)) > 0) {
  write_line <- line
  pipe_positions <- unlist(gregexpr('|', line))

  if (number_of_pipes == 0) {
    number_of_pipes <- length(pipe_positions)
  } else {
    write_line <- process_line(line, pipe_positions, number_of_pipes)
  }

  write(write_line, file = write_filename, append = TRUE)
}
