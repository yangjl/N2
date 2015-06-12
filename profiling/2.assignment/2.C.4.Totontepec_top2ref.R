### Jinliang Yang
### Jan 28th, 2014
### translate Totontepec SNP50k to ref/alt SNP coding

############# mapped from v1 => v2
hmp2 <- read.csv("largedata/hmp2_AGPv2_37k.csv")

##### translation table
snptab <- read.csv("largedata/top2ref_snptab.csv")

#### toton
toton <- read.table("data/BennettSNPs_FINAL.txt", header=TRUE)
toton <- apply(toton, 2, as.character)
toton[toton=="--"] <- "NN"
toton <- as.data.frame(toton)
head(toton)

####
test <- merge(snptab, hmp2[, c("rsid", "B73.MZ")], by.x="snpid", by.y="rsid")
test$B73 <- gsub(".$", "", test$B73.MZ)
head(test)

############
nrow(test[test$ref != test$B73,])
head(test[test$ref != test$B73, c("snpid", "ref", "strand", "B73.MZ", "B73")], 10)

diff <- test[test$ref != test$B73, c("snpid", "ref", "strand", "B73.MZ", "B73")]

### traslation
test$B73t <- "N"
test[test$B73==test$top, ]$B73t <- test[test$B73==test$top, ]$fwdtop
test[test$B73==test$bot, ]$B73t <- test[test$B73==test$bot, ]$fwdbot






