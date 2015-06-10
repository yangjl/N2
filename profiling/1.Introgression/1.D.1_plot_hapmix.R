# Jinliang Yang

#pdf("~/Desktop/test.pdf", width=7, height=3.5)


getIntrogress <- function(chr=10, plotref1=TRUE, ...){
    snpinfo <- read.table(paste0("largedata/hapmixrun/snp_maize_chr", chr, ".info"), header=FALSE)
    names(snpinfo) <- c("snpid", "chr", "genetic", "physical", "ref", "alt")
     
    for(i in 0:11){
        d1 <- read.table(paste0("largedata/hapmixrun/HPOUT100/TOTON.LOCALANC.", i, ".", chr))
        if(plotref1){
            d1$mex <- (2*d1$V1 + d1$V2)/2
        }else{
            d1$mex <- 1-(2*d1$V1 + d1$V2)/2
        }
        
        
        d1$snpid <- snpinfo$snpid
        names(d1)[4] <- paste0("P", i)
        snpinfo <- merge(snpinfo, d1[, c(4,5)], by="snpid")
    }
    nms <- names(snpinfo)
    idx1 <- which(nms == "P0")
    idx2 <- which(nms == "P11")
    snpinfo$mex <- apply(snpinfo[, idx1:idx2], 1, mean)
    snpinfo <- snpinfo[order(snpinfo$genetic),]
    plot(x=snpinfo$physical, y=snpinfo$mex, xlab="Mb", ylab="", ylim=c(0,1), type="h", col="maroon", ...)
}

par(mfrow=c(2, 5))
for(i in c(1:2, 6:10)){
    getIntrogress(chr= i, plotref1 = TRUE, main=paste0("Chr", i), bg = "yellow") 
}
getIntrogress(chr= 1, plotref1 = TRUE, main=paste0("Chr", 1)) 


getInd <- function(chr=10, plotref1=TRUE, ...){
    snpinfo <- read.table(paste0("largedata/hapmixrun/snp_maize_chr", chr, ".info"), header=FALSE)
    names(snpinfo) <- c("snpid", "chr", "genetic", "physical", "ref", "alt")
    
    for(i in 0:11){
        d1 <- read.table(paste0("largedata/hapmixrun/HPOUT100/TOTON.LOCALANC.", i, ".", chr))
        if(plotref1){
            d1$mex <- (2*d1$V1 + d1$V2)/2
        }else{
            d1$mex <- 1-(2*d1$V1 + d1$V2)/2
        }
        
        
        d1$snpid <- snpinfo$snpid
        names(d1)[4] <- paste0("P", i)
        snpinfo <- merge(snpinfo, d1[, c(4,5)], by="snpid")
    }
    nms <- names(snpinfo)
    idx1 <- which(nms == "P0")
    idx2 <- which(nms == "P11")
    #snpinfo$mex <- apply(snpinfo[, idx1:idx2], 1, mean)
    snpinfo <- snpinfo[order(snpinfo$physical),]
    par(mfrow=c(2,6))
    for(idx in idx1:idx2){
        plot(x=snpinfo$physical, y=snpinfo[, idx], xlab="Mb", ylab="", ylim=c(0,1), type="h", col="maroon", ...)
    } 
}

getInd(chr=2, plotref1=TRUE)