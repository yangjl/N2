### Jinliang Yang
### Olivia bd
### purpose: create translation table from top/bot

get_snptab <- function(){
    snpmap <- read.table("largedata/snp50k_topbot.map", header=FALSE)
    names(snpmap) <- c("chr", "pos", "topbot", "strand", "ref", "snpid")
    
    snpfwd <- read.table("largedata/snp50k_topbot.fwd", header=FALSE)
    snpfwd$snpid <- paste(snpfwd$V1, snpfwd$V2, sep="_")
    
    snptab <- merge(snpmap, snpfwd[, 3:4], by="snpid")
    
    #################
    
    snptab$top <- gsub("\\,.", "", snptab$topbot)
    snptab$bot <- gsub(".\\,", "", snptab$topbot)
    snptab$fwdtop <- gsub(".$", "", snptab$V3)
    snptab$fwdbot <- gsub("^.", "", snptab$V3)
    
    snptab$alt <- "N"
    snptab[snptab$ref==snptab$fwdtop, ]$alt <- snptab[snptab$ref==snptab$fwdtop, ]$fwdbot
    snptab[snptab$ref!=snptab$fwdtop, ]$alt <- snptab[snptab$ref!=snptab$fwdtop, ]$fwdtop
    
    snptab <- snptab[, c("snpid", "chr", "pos", "strand", "top", "bot", "fwdtop", "fwdbot", "ref", "alt")]
    snptab <- snptab[order(snptab$chr, snptab$pos), ]
    snptab$snpid <- gsub("chr", "", snptab$snpid)
    return(snptab)
}


snptab <- get_snptab()
write.table(snptab, "largedata/top2ref_snptab.csv", sep=",", row.names=FALSE, quote=FALSE)

############# confirmed that the ref alleles extracted are correct!
bed <- snptab[, c("chr", "pos")]
bed$end <- bed$pos
names(bed)[2] <- "start"
bed$start <- bed$start -1
write.table(bed, "largedata/snp50k_bed.txt", sep="\t", row.names=FALSE, quote=FALSE, col.names=FALSE)

cd largedata
bedtools getfasta -tab -fi ~/dbcenter/AGP/AGPv2/ZmB73_RefGen_v2.fasta -bed snp50k_bed.txt -fo snp50k_ref.txt
#############

snpref <- read.table("largedata/snp50k_ref.txt", header=FALSE)
names(snpref) <- c("snpid", "bedref")
snpref$snpid <- gsub(":.*-", "_", snpref$snpid)
snpref$snpid <- gsub("chr", "", snpref$snpid)

snptab2 <- merge(snptab, snpref, by="snpid")

