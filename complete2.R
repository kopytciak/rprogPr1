#Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
#across a specified list of monitors. The function 'pollutantmean' takes three arguments:
#'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean'
#reads that monitors' particulate matter data from the directory specified in the 
#'directory' argument and returns the mean of the pollutant across all of the monitors,
#ignoring any missing values coded as NA.

setwd("/Users/kopyt/Coursera/lectures/Rprogramming/pr1")

# was trying to do it this way and really liked the tapply here, just was too tired
# to figure out how to turn that array into the the data.frame they wanted.

#complete <- function(directory, id = 1:332) {
# 
#  #spec data fullpath ( will it work with submit? )
#  dirPath <- paste(getwd(),directory, sep="/")
#  #get full path to all files in dir
#  files <- dir(dirPath, pattern= '\\.csv', full.names = TRUE)
#  #select specific monitors - save space
#  monitors <- files[c(id)]
#  #read all selected monitors to single table
#  allTables <- lapply(monitors, read.csv)
#  #combine all into a single table
#  combined <- do.call(rbind, allTables)
#  #calculate count of TRUE for both nitrate and sulfate
#  tapply(!is.na(combined$sulfate + combined$nitrate), combined$ID, sum, simplify = FALSE)  
#  
#}

#I used this one instead! 
complete2 <- function(directory, id = 1:332) {
  
  # get the length of id vector
  id_len <- length(id)
  complete_data <- rep(0, id_len)
  # find all files in the specdata folder
  dirPath <- paste(getwd(),directory, sep="/")
  #get full path to all files in dir
  files <- dir(dirPath, pattern= '\\.csv', full.names = TRUE)

  j <- 1 
  for (i in id) {
    current_file <- read.csv(files[i], header=T, sep=",")
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j + 1
  }
  
  #result <- data.frame(id = id, nobs = complete_data)
  #return(result)
  return(complete_data)
} 