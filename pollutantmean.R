pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

  ## Generate relative file path
filename <- sprintf("%03d", id)  
filelist <- paste(directory, "/", filename, ".csv", sep = "")
combine.data <- lapply(filelist, read.csv)

for (i in length(combine.data)) {
    na.id <- is.na(combine.data[[i]][,pollutant])
    pollutant.valid <- combine.data[[i]][,pollutant][!na.id]
    mean.i <- mean(pollutant.valid)
} 

mean(mean.i)

}