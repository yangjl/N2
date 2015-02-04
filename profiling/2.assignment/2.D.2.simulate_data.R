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
toton <- geno12

### test 10 maize lines
maize <- geno[-1, c(1, 4:15)]
for(i in 2:ncol(maize)){
    maize[, i] <- paste0(maize[,i], maize[,i])
}

save(file="cache/simulate_data.RData", list=c("maize", "toton"))

