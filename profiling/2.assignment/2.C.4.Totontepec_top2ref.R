### Jinliang Yang
### Jan 28th, 2014
### translate Totontepec SNP50k to ref/alt SNP coding

#############
hmp2 <- read.csv("largedata/hmp2_AGPv2_37k.csv")

test <- merge(snptab, hmp2[, c("rsid", "B73.MZ")], by.x="snpid", by.y="rsid")
test$B73 <- gsub(".$", "", test$B73.MZ)

head(test[test$ref != test$B73,])

### traslation
test$B73t <- "N"
test[test$B73==test$top, ]$B73t <- test[test$B73==test$top, ]$fwdtop
test[test$B73==test$bot, ]$B73t <- test[test$B73==test$bot, ]$fwdbot






