### Jinliang Yang
### Jan. 26th, 2015
### change SNP50k AGPv1 to AGPv2

####
snp50k <- read.delim("largedata/Hapmapv2_lines_55Kdata.txt", header=TRUE)
### map to AGPv2
#snp50 map from Matt
Get_SNP50k_Map <- function(){
    map1 <- read.table("largedata/maize_snpfile.1", header=FALSE)
    map2 <- read.table("largedata/maize_snpfile.2", header=FALSE)
    map3 <- read.table("largedata/maize_snpfile.3", header=FALSE)
    map4 <- read.table("largedata/maize_snpfile.4", header=FALSE)
    map5 <- read.table("largedata/maize_snpfile.5", header=FALSE)
    map6 <- read.table("largedata/maize_snpfile.6", header=FALSE)
    map7 <- read.table("largedata/maize_snpfile.7", header=FALSE)
    map8 <- read.table("largedata/maize_snpfile.8", header=FALSE)
    map9 <- read.table("largedata/maize_snpfile.9", header=FALSE)
    map10 <- read.table("largedata/maize_snpfile.10", header=FALSE)
    map <- rbind(map1, map2, map3, map4, map5, map6, map7, map8, map9, map10)
    names(map) <- c("snpid", "chr", "genetic", "physical")
    return(map)
}
map <- Get_SNP50k_Map()

snp50k2 <- merge(map, snp50k, by.x="snpid", by.y="assayLSID")
snp50k2 <- snp50k2[, -7:-14]
### add rs id:
names(snp50k2)[5] <- "rsid"
snp50k2$rsid <- paste(snp50k2$chr, snp50k2$physical, sep="_")

### select only homologous B73
table(snp50k2$B73.MZ)
#AA   AC   AG   CC   CT   GG   GT   NN   TT 
#8842    0    0 9707    1 9771    0    2 9050
snp50k2 <- subset(snp50k2, B73.MZ %in% c("AA", "CC", "TT", "GG") )

write.table(snp50k2, "largedata/hmp2_AGPv2_37k.csv", sep=",", row.names=FALSE, quote=FALSE)


