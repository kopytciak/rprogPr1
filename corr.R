setwd("/Users/kopyt/Coursera/lectures/Rprogramming/pr1")

corr <- function(directory, threshold = 0) {

  #get all monitors above treshold
  complete_nobs <- complete("specdata", 1:332)
  nobs <- complete_nobs$nobs
  ids <- complete_nobs$id[nobs > threshold]

  # get the length of ids vector
  id_len <- length(ids)
  corr_vector <- rep(0, id_len)
  
  #get full path to all files in dir
  dirPath <- paste(getwd(),directory, sep="/")
  files <- dir(dirPath, pattern= '\\.csv', full.names = TRUE)
  
  
  j <- 1
  for(i in ids) {
    current_file <- read.csv(files[i], header=T, sep=",")
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)   
}