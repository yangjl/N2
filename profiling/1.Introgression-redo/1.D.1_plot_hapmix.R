## Jinliang Yang
## updated: June 16th, 2015
#pdf("~/Desktop/test.pdf", width=7, height=3.5)


getIntrogress <- function(chr=10, hpout="HPOUT100", plotref1=TRUE, ...){
    snpinfo <- try(read.table(paste0("largedata/hapmixrun/snp_maize_chr", chr, ".info"), header=FALSE))
    
    names(snpinfo) <- c("snpid", "chr", "genetic", "physical", "ref", "alt")
     
    for(i in 0:11){
        d1 <- try(read.table(paste0("largedata/hapmixrun/", hpout, "/TOTON.LOCALANC.", i, ".", chr)))
        if( exists("d1") ){
            if(plotref1){
                d1$mex <- (2*d1$V1 + d1$V2)/2
            }else{
                d1$mex <- 1-(2*d1$V1 + d1$V2)/2
            }
            #d1$snpid <- snpinfo$snpid
            
            snpinfo <- cbind(snpinfo, d1[, 4])
            names(snpinfo)[ncol(snpinfo)] <- paste0("P", i)
        }  
    }
    nms <- names(snpinfo)
    idx1 <- which(nms == "P0")
    idx2 <- which(nms == "P11")
    snpinfo$mex <- apply(snpinfo[, idx1:idx2], 1, mean)
    snpinfo <- snpinfo[order(snpinfo$physical),]
    
    snpinfo$maize <- 1-snpinfo$mex
    #badsnp <- read.table(paste("largedata/hapmixrun/badsnps", chr, sep="."))
    #snpinfo <- subset(snpinfo, !(snpid %in% badsnp$V1) )
    
    tab <- t(snpinfo[, c("mex", "maize")])
    barplot(tab, xlab="", xaxt="n", col=c("maroon","gold"), border=NA, space = 0, ...)
    #plot(x=snpinfo$genetic, y=snpinfo$mex, xlab="Mb", ylab="", ylim=c(0,1), type="h", col="maroon", ...)
    return(snpinfo)
}

#############
pdf("graphs/introgression.pdf", height=3, width=10)
par(mfrow=c(1, 1))
snpinfo <- data.frame()
for(i in 1:10){
    tem <- getIntrogress(chr= i, hpout="HPOUT1610", plotref1 = TRUE, main=paste0("Chr", i))
    snpinfo <- rbind(snpinfo, tem)
}
dev.off()


###########
jn <- read.csv("data/jacknife_fdr.csv")
info2 <- merge(snpinfo, jn[, c("snpid", "mex")], by="snpid")
info2$mex <- info2$mex.x - info2$mex.y
info2[info2$mex <0, ]$mex <- 0
info2$maize <- 1 - info2$mex
info2 <- info2[order(info2$chr, info2$physical),]

pdf("graphs/intro_jacknife.pdf", height=3, width=10)
par(mfrow=c(1, 1))
for(i in 1:10){
    tem <- subset(info2, chr == i)
    tab <- t(tem[, c("mex", "maize")])
    #barplot()
    barplot(tab, xlab="", xaxt="n", col=c("maroon","gold"), border=NA, space = 0)
}
dev.off()





################################################
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
###
getInd(chr=2, plotref1=TRUE)

getInd(chr=5, plotref1=TRUE)

