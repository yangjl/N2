### Jinliang Yang
### June 17th, 2015


library("snpStats")

###################################################
### code chunk number 9: plinkselect
###################################################
pop3 <- read.plink(bed="largedata/runplink/all3_snp50k.bed", bim="largedata/runplink/all3_snp50k.bim", 
                     fam="largedata/runplink/all3_snp50k.fam")
subset$genotypes
col.summary(subset$genotypes)$MAF
subset$map


xxmat <- xxt(pop3$genotypes, correct.for.missing=FALSE)
evv <- eigen(xxmat, symmetric=TRUE)
pcs <- evv$vectors[,1:5]
evals <- evv$values[1:5]
evals

###################################################
### code chunk number 4: pc-one
###################################################
pop <- subject.support[controls,"stratum"]
par(mfrow=c(1,2))
boxplot(pcs[,1]~pop)
boxplot(pcs[,2]~pop)