### Jinliang Yang
### get the assignment probability to populations for given individuals


####test
geno <- read.table("largedata/assignprb/usgbs_tot50k_5619.txt", header=TRUE)
mygeno <- geno[-1, c(1, 4403:4503)]



### test the 12 totontepec lines
idx1 <- which(colnames(mygeno) == "P1_1")
idx2 <- which(colnames(mygeno) == "P12_2")
geno1 <- mygeno[, c(1, idx1:idx2)]

geno1$P1 <- paste0(geno1[, 2], geno1[, 3])
geno1$P2 <- paste0(geno1[, 4], geno1[, 5])
geno1$P3 <- paste0(geno1[, 6], geno1[, 7])
geno1$P4 <- paste0(geno1[, 8], geno1[, 9])
geno1$P5 <- paste0(geno1[, 10], geno1[, 11])
geno1$P6 <- paste0(geno1[, 12], geno1[, 13])
geno1$P7 <- paste0(geno1[, 14], geno1[, 15])
geno1$P8 <- paste0(geno1[, 16], geno1[, 17])
geno1$P9 <- paste0(geno1[, 18], geno1[, 19])
geno1$P10 <- paste0(geno1[, 20], geno1[, 21])
geno1$P11 <- paste0(geno1[, 22], geno1[, 23])
geno1$P12 <- paste0(geno1[, 24], geno1[, 25])
geno12 <- geno1[, c(1, 26:37)]

source("lib/assignment.R")

myres <- myres2 <- data.frame()
for(n in 5:50){
    for(i in 2:ncol(geno12)){
        mygeno <- geno12[, c(1, i)]
        res <- assignp(frqfile="largedata/assignprb/usgbs_tot50k_5619.snpfrq", 
                       geno=mygeno, nmarker=n, binsize=1000000, missingrate=0.5)
        myres <- rbind(myres, res)
        
    }
}


myres <- subset(myres, P2 != 0)
ps <- paste0("P", 1:12)
plant1 <- subset(myres, plant %in% "P1")
plot(plant1$nSNP, plant1$P1/plant1$P2, type="o", lwd=2, xlim=c(0, 50), ylim=c(0, 1000),
     xlab="Number of SNPs", ylab="Odd Ratio (L1/L2)", cex.lab=1.3)
for(ind in 2:10){
    ps2 <- ps[ind]
    plant2 <- subset(myres, plant %in% ps2)
    lines(plant2$nSNP, plant2$P1/plant2$P2, type="o", lwd=2)
}


#######
snpfrq <- read.table("largedata/assignprb/usgbs_tot50k_5619.snpfrq", header=TRUE)
snpfrq$diff <- abs(snpfrq$maf1 - snpfrq$maf2)
snpfrq <- snpfrq[order(snpfrq$diff, decreasing=TRUE),]

hist(snpfrq$diff, breaks=100, xlab="allele frequency difference", main="US maize vs. Totontepec", col="grey",
     cex.lab = 1.3)
abline(v=0.5, col="red", lwd=3, lty=2)
nrow(subset(snpfrq, diff > 0.5))


