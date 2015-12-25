corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
frame.valid <- complete(directory)

if (max(frame.valid$nobs) <= threshold) {
    as.numeric(c())
}

else {
    nobs.id <- frame.valid[,"nobs"] > threshold
    ID.valid <- frame.valid[,1][nobs.id]
    filelist <- paste(directory, "/", sprintf("%03d", ID.valid), ".csv", sep = "")
    combine.data <- lapply(filelist, read.csv)
    corlist <- NULL
    
    for (i in 1:length(ID.valid)) {
        sulfate <- na.omit(combine.data[[i]])$sulfate
        nitrate <- na.omit(combine.data[[i]])$nitrate
        corlist[i] <- cor(sulfate, nitrate)
        }
    
    corlist
    }
}