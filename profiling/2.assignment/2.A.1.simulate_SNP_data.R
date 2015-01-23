# Jinliang Yang
# 10/3/2014
# purpose: simulate a set of SNPs for fpSNP 

### you have to change to your own working directory
dsf <- read.table("data/merged_chrall_maf1miss6.dsf", nrow=1000, header=TRUE)


names(dsf)[2:3] <- c("chr", "pos")
dsf$chr <- gsub("_.*", "", dsf$snpid)
dsf$pos <- gsub(".*_", "", dsf$snpid)
dsf <- dsf[, -4:-5]

dsf <- apply(dsf, 2, as.character)

dsf[1, 1:3] <- "N"
dsf[1, 4:200] <- 1
dsf[1, 201:ncol(dsf)] <- 2

write.table(dsf, "data/simusnps.txt", sep="\t",
            row.names=FALSE, quote=FALSE)

