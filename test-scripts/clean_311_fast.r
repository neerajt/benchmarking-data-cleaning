#!/usr/bin/env Rscript

options <- commandArgs(trailingOnly = TRUE)
write_filename <- options[1]


number_of_pipes <- 0
file.create(write_filename)
f <- file("stdin")
open(f)
while(length(line <- readLines(f,n=1)) > 0) {
  write_line <- line


  write(write_line, file = write_filename, append = TRUE)
}