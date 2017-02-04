complete <- function(directory, id = 1:332) {
    cwd <- getwd()
    setwd(directory)
    filenames <- sprintf("%03d.csv", id)
    
    nobs <- c()
    for (csvfile in filenames) {
        csvdata <- read.csv(csvfile)
        nobs <- c(nobs,nrow(csvdata[complete.cases(csvdata),]))
    }
    setwd(cwd)
    data.frame(id, nobs)
}