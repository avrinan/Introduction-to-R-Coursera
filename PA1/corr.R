corr <- function(directory, threshold = 0) {
    completecases <- complete(directory)
    cases <- completecases[completecases$nobs > threshold,]
    
    cwd <- getwd()
    setwd(directory)
    filenames <- sprintf("%03d.csv", cases$id)
    
    correlations <- c()
    for (csvfile in filenames) {
        csvdata <- read.csv(csvfile)
        csvdata <- csvdata[complete.cases(csvdata),]
        correlations <- c(correlations, cor(csvdata$sulfate, csvdata$nitrate))
    }
    setwd(cwd)
    correlations
}