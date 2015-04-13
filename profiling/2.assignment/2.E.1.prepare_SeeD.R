### Jinliang Yang
### April 13th, 2015
### Prepare SeeD data for fpSNP

readhmp <- function(){
    
    
    #### SeeD location information
    seedinfo <- read.csv("data/SeeD_idinfo.csv", row.names=NULL)
    
    
    
    
    
    #####
    frq <- data.frame()
    for(i in 1:10){
        frq1 <- read.table(paste0("~/dbcenter/seeds_data/chr", i, "_filetered_unimputed.frq"), header=TRUE)
        frq <- rbind(frq, frq1)
    }
    frq0 <- subset(frq, missing <= 0.6)
   
    #####
    for(i in 1:10){
        hmp1 <- read.delim(paste0("~/dbcenter/seeds_data/chr", i, "_filetered_unimputed.hmp"), header=TRUE)
        hmp1 <- subset(hmp1, snpid %in% frq0$snpid)
        hmp <- rbind(hmp, )
    }
    
    
    
}





