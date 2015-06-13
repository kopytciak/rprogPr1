setwd("/Users/kopyt/Coursera/lectures/Rprogramming/pr1")


complete <- function(directory, id = 1:332) {
 
#  spec data fullpath ( will it work with submit? )
  dirPath <- paste(getwd(),directory, sep="/")
#  get full path to all files in dir
  files <- dir(dirPath, pattern= '\\.csv', full.names = TRUE)
#  select specific monitors - save space
  monitors <- files[c(id)]
#  read all selected monitors to single table
  allTables <- lapply(monitors, read.csv)
#  combine all into a single table
  combined <- do.call(rbind, allTables)
#  calculate count of TRUE for both nitrate and sulfate
  x <- tapply(!is.na(combined$sulfate + combined$nitrate), combined$ID, sum, simplify = FALSE)
# print it the way they wanted it .... 
  result <- data.frame(id = names(x), nobs = x[seq_along(x)], row.names = seq_along(x))
  #result <- data.frame(id = id, nobs = x[id], row.names = seq_along(x))
  
}
