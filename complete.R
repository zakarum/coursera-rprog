complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
filelist <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
combine.data <- lapply(filelist, read.csv)
nobs <- NULL

for (i in 1:length(combine.data)) {
      nobs[i] <- dim(na.omit(combine.data[[i]]))[1]
}

data.frame(id=id, nobs=nobs)
}