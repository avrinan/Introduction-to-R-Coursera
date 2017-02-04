best <- function(state, outcome) {
    ## Read outcome data
    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if (sum(outcomes$State==state) == 0) {
        stop("invalid state")
    }
    
    if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
        stop("invalid outcome")
    }
    outcomes[,11] = as.numeric(outcomes[,11])
    outcomes[,17] = as.numeric(outcomes[,17])
    outcomes[,23] = as.numeric(outcomes[,23])
    
    state_outcomes <- outcomes[outcomes$State == state,]
    if (outcome == "heart attack") {
        state_outcome <- state_outcomes[,11]
    } else if (outcome == "heart failure") {
        state_outcome <- state_outcomes[,17]
    } else {
        state_outcome <- state_outcomes[,23]
    }
    
    min_result <- min(state_outcome, na.rm = TRUE)
    index <- which(state_outcomes == min_result)
    name <- state_outcomes[index, 2]
    name
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}