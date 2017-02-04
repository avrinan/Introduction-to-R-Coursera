pollutantmean <- function(directory, pollutant, id = 1:332) {
    cwd <- getwd()
    setwd(directory)
    filenames <- sprintf("%03d.csv", id)
    
    accrued_pollut <- c()
    for (csvfile in filenames) {
        data <- read.csv(csvfile)
        current_pollut <- data[!is.na(data[pollutant]), pollutant]
        accrued_pollut <- c(accrued_pollut, current_pollut)
    }
    setwd(cwd)
    mean(accrued_pollut)
}