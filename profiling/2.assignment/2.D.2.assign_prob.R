### Jinliang Yang
### get the assignment probability to populations for given individuals


####test
mygeno <- read.table("largedata/assignprb/usgbs_tot50k_5619.txt", header=TRUE)
mygeno <- geno[-1, c(1, 4403:4503)]

idx1 <- which(colnames(mygeno) == "P1_1")
idx2 <- which(colnames(mygeno) == "P12_2")
geno1 <- mygeno[, c(1, idx1:idx2)]
geno1$P1 <- paste0(geno1[, 2], geno1[, 3])
geno1 <- geno1[, c(1, 26)]


res <- assignp(frqfile="largedata/assignprb/usgbs_tot50k_5619.snpfrq", 
               geno=geno1, nmarker=100, binsize=1000000, missingrate=0.5)


