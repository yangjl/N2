# Jinliang Yang
# March 23rd, 2015
# Translate SNP50k matrix to HapMix format

### Note the toton data have been fixed the top/bot issue in "2.assignment" folder.
toton <- read.csv("largedata/toton_translated.csv")


nms <- names(toton)
idx1 <- which(nms =="P1")
idx2 <- which(nms =="P12_2")
idx3 <- which(nms == "P12")


toton[, idx1:idx2] <- apply(toton[, idx1:idx2], 2, as.character)
for(i in paste0("P", 1:12)){
    pn <- i
    pn1 <- paste(pn, "1", sep="_")
    pn2 <- paste(pn, "2", sep="_")
    toton[toton[, pn1] == "N" & toton[, pn2] == "N", pn] <- 9
    toton[toton[, pn1] == toton[, "ref"] & toton[, pn2] == toton[, "ref"], pn] <- 2
    toton[toton[, pn1] == toton[, "alt"] & toton[, pn2] == toton[, "alt"], pn] <- 0
    toton[toton[, pn1] == toton[, "ref"] & toton[, pn2] == toton[, "alt"], pn] <- 1
    toton[toton[, pn1] == toton[, "alt"] & toton[, pn2] == toton[, "ref"], pn] <- 1    
}


######
tchr10 <- subset(toton, chr %in% "chr10")
snpinfo <- read.table("largedata/snp_maize.info", header=FALSE)
subchr <- merge(tchr10, snpinfo, by.x="names", by.y="V1")
subchr <- subchr[order(subchr$V4),]
subchr$V3 <- format(subchr$V3, digits=7)

### Genotype file
write.table(subchr[, idx1:idx3], "largedata/toton_chr10.out", sep="", 
            row.names=FALSE, col.names=FALSE, quote=FALSE)
### SNP file
write.table(subchr[, c("names", "V2", "V3", "V4", "V5", "V6")], "largedata/toton_chr10.snpinfo", sep="\t",
            row.names=FALSE, col.names=FALSE, quote=FALSE)

### individual file
ind <- data.frame(id = names(subchr)[idx1:idx3], sex="F", Note="totonPop")
write.table(ind, "largedata/toton_chr10.ind", sep="\t", 
            row.names=FALSE, col.names=FALSE, quote=FALSE)

snpinfo <- snpinfo[order(snpinfo$V4), ]
### rate file: question, order and how to deal with subsetting
cat(paste0(":sites:", nrow(snpinfo)),
    file="largedata/toton_chr10.rate", sep="\n", append=FALSE
    )
cat(snpinfo$V4,
    "\n",
    file="largedata/toton_chr10.rate", sep=" ", append=TRUE
)
cat(format(snpinfo$V3, digits=7),
    "\n",
    file="largedata/toton_chr10.rate", sep=" ", append=TRUE
)

