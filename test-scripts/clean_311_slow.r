#!/usr/bin/env Rscript

options <- commandArgs(trailingOnly = TRUE)
write_filename <- options[1]

string_to_vector <- function (string) {
  return(unlist(strsplit(string, '')))
}

process_line <- function (str_as_vector, number_of_pipes) {
  str_as_vector[which(str_as_vector == '|')[-(number_of_pipes:1)]] <- ';'
  return(paste(str_as_vector, collapse = ''))
}

number_of_pipes <- 0
file.create(write_filename)
f <- file("stdin", encoding = 'latin1')
open(f)
while(length(line <- readLines(f,n=1)) > 0) {
  row_as_vector <- string_to_vector(line)
  write_line <- line

  if (number_of_pipes == 0) {
    number_of_pipes <- sum(row_as_vector == '|')
  } else {
    write_line <- process_line(row_as_vector, number_of_pipes)
  }

  write(write_line, file = write_filename, append = TRUE)
}
