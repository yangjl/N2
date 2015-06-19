### Jinliang Yang
### June 18th, 2015
### try all the generations and plot the likelihood


getlikelihood <- function(){
    out <- data.frame()
    
    for(i in 1:10){
        pwd <- paste0("largedata/hapmixrun", i)
        
        dirs <- list.dirs(path = pwd, full.names = TRUE, recursive = FALSE)
        dirs <- dirs[grep("HPOUT", dirs)]
        
        for(k in 1:length(dirs)){
            files <- list.files(path=dirs[k], pattern="loglhood")
            logl <- data.frame()
            for(j in 1:length(files)){
                temlog <- try(read.table(paste(dirs[k], files[j], sep="/"), header=FALSE))
                logl <- rbind(logl, temlog)
            }
            if(nrow(logl) > 1){
                logmean <- mean(logl$V2)
                logout <- data.frame(gen=dirs[k], loglike=logmean)
                out <- rbind(out, logout)
            }  
        }
        
    }    
    return(out)
}

out <- getlikelihood()
out$gen <- gsub(".*OUT", "", out$gen)
out$gen <- as.numeric(as.character(out$gen))
out <- out[order(out$gen),]

pdf("graphs/gen_likehood.pdf", width=7, height=7)
par(mfrow=c(1,1))
plot(out$gen, out$loglike, type="l", xlab="Generations", ylab="Loglikelihood", lwd=3)
idx <- which.max(out$loglike)
abline(h=out$loglike[idx], lty=2)
abline(v=out$gen[idx], col="red")
dev.off()


#out <- subset(out, gen > 90)
lo <- loess( out$loglike ~ out$gen)
plot(out$gen, out$loglike, xlab="Generation", ylab="Loglikelihood")
lines(predict(lo), col='red', lwd=2)

smoothingSpline = smooth.spline(x=out$gen, y=out$loglike, spar=0.35)
plot(x=out$gen,y=out$loglike)
lines(smoothingSpline)


