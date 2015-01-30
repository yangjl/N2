### Jinliang Yang
### Jan 29th, 2015
### purpose: get assignment probility



### simulate 1000 SNP data
source("lib/getfpsnp.R")

snpfq <- read.table("largedata/assignprb/usgbs_tot50k_5619.snpfrq", header=TRUE)

assignp <- function(frqfile="tests/output.txt", nmarker=100, binsize=1000000, pcutoff=0.001, missingrate=0.5){
    
    ### read in the data
    snpfq <- read.table(frqfile, header=TRUE)
    
    snpfq$diff <- abs(snpfq$maf1 - snpfq$maf2)
    
    ### snp filtering based on missingrate
    snpfq <- subset(snpfq, missing1 <= missingrate & missing2 <= missingrate)
    
    ### snp filtering based on binsize
    snpfq$bin <- paste(snpfq$chr, round(snpfq$pos/binsize, 0), sep="_")
    snpfq <- snpfq[order(snpfq$diff, decreasing=TRUE),]
    snpfq <- snpfq[!duplicated(snpfq$bin),]
    
    ### select n markers
    if(nrow(snpfq) > nmarker){
        snpfq <- snpfq[1:nmarker, ]
    }else{
       message(sprintf("Non-duplicated markers [%s] less than selected [%s]", nrow(snpfq), nmarker))
    }
    
    ### start to assign probability for selected ind for each plant
    
}


####test
mygeno <- read.table("largedata/assignprb/usgbs_tot50k_5619.txt", header=TRUE)
mygeno <- geno[-1, c(1, 4403:4503)]

idx1 <- which(colnames(mygeno) == "P1_1")
idx2 <- which(colnames(mygeno) == "P12_2")
geno1 <- mygeno[, c(1, idx1:idx2)]
geno1$P1 <- paste0(geno1[, 2], geno1[, 3])
geno1 <- geno1[, c(1, 26)]


assignone <- function(geno=geno1){
    ###
    snpfq$a1 <- "N"
    snpfq$a2 <- "N"
    geno <- merge(snpfq, geno, by="snpid")
    
    
    for(i in 16:ncol(geno)){
        geno$a1 <- gsub(".$", "", geno[, i])
        geno$a2 <- gsub("^.", "", geno[, i])
        
        ###
        pop1.1 <- prod(subset(geno, minor == a1)$maf1)
        pop1.2 <- prod(subset(geno, minor == a2))
        
    }
    
    
    
    
}











test <- findSNP(frqfile="../tests/output.txt", binsize=100, pcutoff=0.001, missingrate=0.5 )
head(test)


