### Jinliang Yang
### 1.5.2014
### purpose: format SNP for fastPHASE input

############
selectSNP <- function(){
    #Mexicana N=120
    mex <- read.table("data/Mexicana_TopStrand_FinalReport.txt", header=TRUE)
    mex <- as.data.frame(mex)
    message(sprintf("#>>> [ %s ] snps for [ %s ] Mexicanna plants", nrow(mex), ncol(mex)-1))
    #Parviglumis N=130
    parv <- read.table("data/Parviglumis_TopStrand_FinalReport.txt", header=TRUE)
    parv <- as.data.frame(parv)
    message(sprintf("#>>> [ %s ] snps for [ %s ] Parviglumis plants", nrow(parv), ncol(parv)-1))
    #landraces N=94
    land <- read.table("data/HighLowSNPs_Final.txt", header=TRUE)
    land <- as.data.frame(land)
    message(sprintf("#>>> [ %s ] snps for [ %s ] Landraces plants", nrow(land), ncol(land)-1))
    
    olsnp <- merge(mex[,1:2], land[, 1:2], by="id")
    ol2 <- merge(olsnp, parv[, 1:2], by="id")
    message(sprintf("#>>> outlist[[1]]: [ %s ] snps mex and land", nrow(olsnp) ))
    message(sprintf("#>>> outlist[[2]]: [ %s ] snps mex, parv and land", nrow(ol2) ))
    return(list(olsnp, ol2))
}

##################
fp_by_chr <- function(infile="data/Mexicana_TopStrand_FinalReport.txt", 
                      snps=snps[[2]], 
                      map=map,
                      outfile.base="largedata/fphase/mex_120"){
    
    mex <- read.table(infile, header=TRUE)
    mex <- subset(mex, id %in% snps$id)
    mex2 <- merge(map, mex, by.x="snpid", by.y="id") 
    mex2 <- apply(mex2, 2, as.character)
    mex2[mex2=="--"] <- "??"
    mex2 <- as.data.frame(mex2)
    mex2 <- mex2[order(mex2$chr, mex2$physical), ]
    
    mex2$chr <- as.numeric(as.character(mex2$chr))
    
    for(chri in 1:10){
        mex3 <- subset(mex2, chr==chri)
        out <- paste0(outfile.base, "_chr", chri)
        df2fp(df=mex3, outfile=out) 
    }
}

######################
main <- function(){
    map <- read.csv("largedata/fphase/snp50k_info.csv", header=TRUE)
    map <- map[order(map$chr, map$physical), ]
    
    # only select SNPs that present on all three populations
    snps <- selectSNP()
    #>>> [ 43694 ] snps for [ 120 ] Mexicanna plants
    #>>> [ 43701 ] snps for [ 130 ] Parviglumis plants
    #>>> [ 49284 ] snps for [ 94 ] Landraces plants
    #>>> outlist[[1]]: [ 41340 ] snps mex and land
    #>>> outlist[[2]]: [ 37621 ] snps mex, parv and land
    #library("lib/df2fp.R")
    fp_by_chr(infile="data/Mexicana_TopStrand_FinalReport.txt", 
              snps=snps[[2]],  map=map,
              outfile.base="largedata/fphase/mex_120")
    
    fp_by_chr(infile="data/Parviglumis_TopStrand_FinalReport.txt", 
              snps=snps[[2]],  map=map,
              outfile.base="largedata/fphase/parv_130")
    
    fp_by_chr(infile="data/HighLowSNPs_Final.txt", 
              snps=snps[[2]],  map=map,
              outfile.base="largedata/fphase/land_94")
    
    map <- subset(map, snpid %in% snps[[2]]$id)
    map <- map[order(map$chr, map$physical), ]
    return(map)
}

########################
library("lib/df2fp.R")
map <- main()
#>>> [ 43694 ] snps for [ 120 ] Mexicanna plants
#>>> [ 43701 ] snps for [ 130 ] Parviglumis plants
#>>> [ 49284 ] snps for [ 94 ] Landraces plants
#>>> outlist[[1]]: [ 41340 ] snps mex and land
#>>> outlist[[2]]: [ 37621 ] snps mex, parv and land

write.table(map, "largedata/fphase/snp50k_subset_info.csv", sep=",", row.names=FALSE, quote=FALSE)

