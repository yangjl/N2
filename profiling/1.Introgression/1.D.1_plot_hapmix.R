# Jinliang Yang

pdf("~/Desktop/test.pdf", width=7, height=3.5)
par(mfrow=c(1, 2))
for(i in 0:11){
    d1 <- read.table(paste0("largedata/hapmixrun/HPOUT/TOTON.LOCALANC.", i, ".10"))
    
    
    snpinfo <- read.table("largedata/hapmixrun/snp_maize_chr10.info", header=FALSE)
    names(snpinfo) <- c("snpid", "chr", "genetic", "physical", "ref", "alt")
    df <- cbind(snpinfo, d1)
    
    plot(x=df$genetic, y=df$V1, xlab="Mb", ylab="", ylim=c(0,1), type="h", col="maroon")
    plot(x=df$genetic, y=df$V2, xlab="Mb", ylab="", ylim=c(0,1), type="h", col="maroon")
    
    
}
dev.off()