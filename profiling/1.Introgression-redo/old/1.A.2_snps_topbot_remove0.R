### Jinliang Yang
### Olivia's bd
### purpose: flip the snps top

snpmap <- read.table("largedata/snp50k_topbot.map", header=FALSE)
table(snpmap$V4)
snpmap <- subset(snpmap, V4 != 0)
snpmap$snpid <- paste(snpmap$V1, snpmap$V2, sep="_")

snptop <- read.table("largedata/snp50k_topbot.txt", header=FALSE)
snptop$snpid <- paste(snptop$V1, snptop$V2, sep="_")

snptop <- subset(snptop, snpid %in% snpmap$snpid)
snptop$V3 <- gsub("\\,", "", snptop$V3)

write.table(snpmap, "largedata/snp50k_topbot.map", sep="\t", row.names=FALSE, quote=FALSE, col.names=FALSE)
write.table(snptop, "largedata/snp50k_topbot.txt", sep="\t", row.names=FALSE, quote=FALSE, col.names=FALSE)
