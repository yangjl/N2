### Jinliang Yang
### checking toton, mex and hmp2 SNP encoding 


source("lib/snp50k2plink.R")

### Totontepec
toton <- read.table("data/BennettSNPs_FINAL.txt", header=TRUE)
snp50k2plink(infiledf=toton, mapfile="data/snp50k.map", outfile="largedata/runplink/toton_snp50k", fid="toton")
###>>> Merged [ 37568 ] SNPs for [ 12 ] plants
###>>> write MAP file to [ largedata/runplink/toton_snp50k.map ]
###>>> write PED file to [ largedata/runplink/toton_snp50k.ped ]

### Mexicana
allmex <- read.table("data/Mexicana_TopStrand_FinalReport.txt", header=TRUE)
idx <- grep("^RIMME0033", names(allmex))
allop <- allmex[, c(1, idx)]
names(allop)[1] <- "snpid"
snp50k2plink(infiledf=allop, mapfile="data/snp50k.map", outfile="largedata/runplink/mex_snp50k", fid="mex")
###>>> Merged [ 37568 ] SNPs for [ 12 ] plants
###>>> write MAP file to [ largedata/runplink/mex_snp50k.map ]
###>>> write PED file to [ largedata/runplink/mex_snp50k.ped ]

### maize
hmp2 <- read.csv("largedata/SNP55_811_samples_top.csv", header=TRUE)
bkn <- read.csv("data/BKN_MR.csv")
bkn$MR <- as.character(bkn$MR)
bkn$MR <- gsub(" $", "", bkn$MR)
maize <- subset(hmp2, B73ref != "--" & B73ref != "AC" & B73ref != "AG")
maize <- maize[, c("SNP.NAME", as.character(bkn$MR))]
names(maize)[1] <- "snpid"
snp50k2plink(infiledf=maize, mapfile="data/snp50k.map", outfile="largedata/runplink/land_snp50k", fid="landrace")
###>>> Merged [ 37565 ] SNPs for [ 23 ] plants
###>>> write MAP file to [ largedata/runplink/land_snp50k.map ]
###>>> write PED file to [ largedata/runplink/land_snp50k.ped ]

#module load plink/1.90
#plink --file land_snp50k --missing-genotype N --make-bed --out land_snp50k
#plink --file mex_snp50k --missing-genotype N --make-bed --out mex_snp50k
#plink --file toton_snp50k --missing-genotype N --make-bed --out toton_snp50k


###
hmp2 <- di2ha(mex=hmp2[, c(1, 10:50)])
idx3 <- which(names(hmp2) == "Tr.9.1.1.6_1" )
hmpton <- merge(toton[, c(1, idx1:ncol(toton))], hmp2[, c(1, idx3:ncol(hmp2))], by.x="snpid", by.y="SNP.NAME")
tem2 <- frq(df=hmpton, cols=2:ncol(hmpton), trow=1000)
########################
di2ha <- function(mex=mex){
    for(i in 2:ncol(mex)){
        mex$a1 <- gsub(".$", "", mex[,i])
        names(mex)[ncol(mex)] <- paste(names(mex)[i], "1", sep="_")
        mex$a2 <- gsub("^.", "", mex[,i])
        names(mex)[ncol(mex)] <- paste(names(mex)[i], "2", sep="_")
    }
    return(mex)
}

#############
frq <- function(df=mexton, cols=2:ncol(mexton), trow=1000){
    outfile <- data.frame()
    for(i in 1:trow){
        tem <- data.frame(id=df[i, 1], snps=t(df[i, cols]))
        names(tem) <- c("id", "snps")
        tb <- table(tem$snps)
        if("-" %in% names(tb)){
            n <- tb["-"]
            idx <- which(names(tb) == "-")
            tb <- tb[-idx]
        }
        
        all <- paste(names(tb), collapse = '')
        out <- data.frame(id=df[i,1], alleles=all)
        outfile <- rbind(outfile, out)
        print(i)
    }
    outfile$alleles <- as.character(outfile$alleles)
    outfile$count <- nchar(outfile$alleles)
    return(outfile)
}





