### Jinliang Yang
### Olivia's 1-year-old birthday
### purpose: prepare the 50k SNP into dsf

library(data.table)
snp50k2 <- read.csv("largedata/hmp2_AGPv2_37k.csv")
snp50k2$rsid <- paste("S", snp50k2$rsid, sep="")

toton <- read.table("data/BennettSNPs_FINAL.txt", header=TRUE)
toton <- apply(toton, 2, as.character)
toton[toton=="--"] <- "NN"
toton <- as.data.frame(toton)

for(i in 2:13){
    nm <- names(toton)[i]
    toton$hap1 <- gsub(".$", "", toton[,i])
    names(toton)[ncol(toton)] <- paste0(nm, "_1")
    toton$hap2 <- gsub("^.", "", toton[,i])
    names(toton)[ncol(toton)] <- paste0(nm, "_2")
}




toton <- subset(toton, snpid %in% snp50k2$snpid)








