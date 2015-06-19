### Jinliang Yang
### June 18th, 2015
### try all the generations and plot the likelihood


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

out <- getlikelihood()
par(mfrow=c(1,1))
plot(out$gen, out$loglike, type="l", xlab="Generation", ylab="Loglikelihood")

#out <- subset(out, gen > 90)
lo <- loess( out$loglike ~ out$gen)
plot(out$gen, out$loglike, xlab="Generation", ylab="Loglikelihood")
lines(predict(lo), col='red', lwd=2)

smoothingSpline = smooth.spline(x=out$gen, y=out$loglike, spar=0.35)
plot(x=out$gen,y=out$loglike)
lines(smoothingSpline)


