### Jinliang Yang
### June 16th, 2015

##### Mexicanna lines
allmex <- read.table("data/Mexicana_TopStrand_FinalReport.txt", header=TRUE)
idx <- grep("^RIMME0033", names(allmex))
allop <- allmex[, c(1, idx)]

names(allop)[1] <- "id"
write.table(allop, "data/Mexicanna_RIMME0033_top.txt", sep="\t", row.names=FALSE, quote=FALSE)

#maize landrace 23
maize <- read.csv("largedata/SNP55_811_samples_top.csv", header=TRUE)
bkn <- read.csv("data/BKN_MR.csv")
bkn$MR <- as.character(bkn$MR)
bkn$MR <- gsub(" $", "", bkn$MR)

maize <- subset(maize, B73ref != "--" & B73ref != "AC" & B73ref != "AG")
maize <- maize[, c("SNP.NAME", as.character(bkn$MR))]
names(maize)[1] <- "id"
message(sprintf("#>>> [ %s ] snps for [ %s ] maize Landraces (hmp2) plants", nrow(maize), ncol(maize)-1))
write.table(maize, "data/Hapmapv2_landrace23.txt", row.names=FALSE, sep="\t", quote=FALSE)

##### totontepec lines
toton <- read.table("data/BennettSNPs_FINAL.txt", header=TRUE)
toton <- apply(toton, 2, as.character)
toton[toton=="--"] <- "NN"
toton <- as.data.frame(toton)


