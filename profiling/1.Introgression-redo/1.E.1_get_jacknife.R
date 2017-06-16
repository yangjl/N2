### Jinliang Yang
### June 19th, 2015
### get jacknife results


getJack <- function(chr=10, hpout="HPOUT1610"){
    
    ind =1
    snpinfo <- read.table(paste0("largedata/hapmixjack/jn_l", ind, "_chr", chr, ".snpinfo"), header=FALSE)
    names(snpinfo) <- c("snpid", "chr", "genetic", "physical", "ref", "alt")
    
    #largedata/hapmixjack/HPOUT1610_1/TOTON.LOCALANC.0.1
    d1 <- read.table(paste0("largedata/hapmixjack/", hpout,"_", ind, "/MZJN.LOCALANC.0.", chr))
    d1$mex <- (2*d1$V1 + d1$V2)/2
    #d1$snpid <- snpinfo$snpid
    
    snpinfo <- cbind(snpinfo, d1[, 4])
    names(snpinfo)[ncol(snpinfo)] <- paste0("P", ind)
    
    for(ind in 2:23){
        info <- read.table(paste0("largedata/hapmixjack/jn_l", ind, "_chr", chr, ".snpinfo"), header=FALSE)
        names(info) <- c("snpid", "chr", "genetic", "physical", "ref", "alt")
        
        #largedata/hapmixjack/HPOUT1610_1/TOTON.LOCALANC.0.1
        d2 <- read.table(paste0("largedata/hapmixjack/", hpout,"_", ind, "/MZJN.LOCALANC.0.", chr))
        d2$mex <- (2*d2$V1 + d2$V2)/2
        #d1$snpid <- snpinfo$snpid
        
        info <- cbind(info, d2[, 4])
        names(info)[ncol(info)] <- paste0("P", ind)
        snpinfo <- merge(snpinfo, info[, c("snpid", paste0("P", ind))], by="snpid")
    }
    return(snpinfo)
}

#####
snpinfo <- data.frame()
for(i in 1:10){
    tem <- getJack(chr=i, hpout="HPOUT1610")
    snpinfo <- rbind(snpinfo, tem)
}
snpinfo <- snpinfo[order(snpinfo$chr, snpinfo$physical), ]
snpinfo$mex <- apply(snpinfo[, 7:29], 1, mean)
write.table(snpinfo, "cache/jacknife_fdr.csv", sep=",", row.names=FALSE, quote=FALSE)
