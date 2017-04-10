best <- function(state, outcome) {
        
        setwd("C:/Users/damjan/Desktop/Course Projects/dataH")
        x <- read.csv("outcome-of-care-measures.csv" , header =TRUE, stringsAsFactors=F)          
        outcomevector <- c("heart attack" , "heart failure" , "pneumonia")         
        if(!(state %in% unique(x$State))) stop("Invalid State")
        if(!(outcome %in% outcomevector)) stop("Invalid Outcome")
        
        X <- x[x$State== state,]
        names(X)[c(11, 17, 23)] <- outcomevector
        answer <- X[X[,outcome] == min(X[,outcome]), ][2]    
        FA <- answer[with(answer, order(Hospital.Name)), ]
        FA[1]   
}