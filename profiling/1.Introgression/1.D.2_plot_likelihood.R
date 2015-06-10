


getlikelihood <- function(){
    out <- data.frame()
    for(i in c(seq(2, 99, by=2), seq(100, 5000, by=100)) ){
        pwd <- paste0("largedata/hapmixrun/HPOUT", i)
        files <- list.files(path=pwd, pattern="loglhood")
        
        logl <- data.frame()
        for(j in 1:length(files)){
            temlog <- try(read.table(paste(pwd, files[j], sep="/"), header=FALSE))
            logl <- rbind(temlog)
        }
        if(nrow(logl) > 1){
            logmean <- mean(logl$V2)
            logout <- data.frame(gen=i, loglike=logmean)
            out <- rbind(out, logout)
        }  
    }
    
    return(out)
}


plot(out$gen, out$loglike, type="l")