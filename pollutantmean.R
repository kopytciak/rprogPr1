#Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
#across a specified list of monitors. The function 'pollutantmean' takes three arguments:
#'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean'
#reads that monitors' particulate matter data from the directory specified in the 
#'directory' argument and returns the mean of the pollutant across all of the monitors,
#ignoring any missing values coded as NA.

setwd("/Users/kopyt/Coursera/lectures/Rprogramming/pr1")

pollutantmean <- function(directory, pollutant, id = 1:332) {
 
  #spec data fullpath ( will it work with submit? )
  dirPath <- paste(getwd(),directory, sep="/")
  
  #get full path to all files in dir
  files <- dir(dirPath, pattern= '\\.csv', full.names = TRUE)
  
  #select specific monitors - save space
  monitors <- files[c(id)]
  
  #read all selected monitors to single table
  allTables <- lapply(monitors, read.csv)
  
  #rbind to a single data frame 
  combined <- do.call(rbind, allTables)
  
  #get the pollutant
  pollutant <- combined[[pollutant]]
  
  #calculate mean  
  mean(pollutant, na.rm = TRUE)

}