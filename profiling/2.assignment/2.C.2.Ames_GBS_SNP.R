# Jinliang Yang
# 1/26/2015
# purpose: get commond SNPs of the GBS and SNP50k

library(data.table)
######### SNP50k data
snp50k2 <- read.csv("largedata/hmp2_AGPv2_37k.csv")
snp50k2$rsid <- paste("S", snp50k2$rsid, sep="")

######### GBS data
chr1 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr1.hmp.txt", sep="\t", header=TRUE)
chr2 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr2.hmp.txt", sep="\t", header=TRUE)
chr3 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr3.hmp.txt", sep="\t", header=TRUE)
chr4 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr4.hmp.txt", sep="\t", header=TRUE)
chr5 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr5.hmp.txt", sep="\t", header=TRUE)
chr6 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr6.hmp.txt", sep="\t", header=TRUE)
chr7 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr7.hmp.txt", sep="\t", header=TRUE)
chr8 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr8.hmp.txt", sep="\t", header=TRUE)
chr9 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr9.hmp.txt", sep="\t", header=TRUE)
chr10 <- fread("largedata/AmesGBS/AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr10.hmp.txt", sep="\t", header=TRUE)

sub1 <- chr1['rs#' == snp50k2$rsid, ]
sub2 <- chr2['rs#' == snp50k2$rsid, ]
sub3 <- chr3['rs#' == snp50k2$rsid, ]
sub4 <- chr4['rs#' == snp50k2$rsid, ]
sub5 <- chr5['rs#' == snp50k2$rsid, ]
sub6 <- chr6['rs#' == snp50k2$rsid, ]
sub7 <- chr7['rs#' == snp50k2$rsid, ]
sub8 <- chr8['rs#' == snp50k2$rsid, ]
sub9 <- chr9['rs#' == snp50k2$rsid, ]
sub10 <- chr10['rs#' == snp50k2$rsid, ]

##### rbind all the subset of SNP from 10 chromosomes
sub <- rbind(sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9, sub10)
setnames(sub, "rs#", "rsid")
sub <- as.data.frame(sub) #5619 4487


#### write to dsf format!
dsf <- sub[, c(1,3, 4, 12:ncol(sub))]
names(dsf)[1:3] <- c("snpid", "chr", "pos")
dsf$snpid <- gsub("S", "", dsf$snpid)

header <- dsf[1,]
header[1, 1:3] <- "N"
header[1, 4:ncol(header)] <- "1"

dsf <- rbind(header, dsf)
write.table(dsf, "largedata/AmesGBS/amesGBS_50k_4k.txt", sep="\t",
            row.names=FALSE, quote=FALSE)






