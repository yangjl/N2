### Jinliang Yang
### 1.5.2015
### updated: 6/1/2015
### purpose: format SNP for fastPHASE input


map0 <- map_ref_alt()
write.table(map0[,1:7], "largedata/fphase/snp50k_061715_info.csv", sep=",", row.names=FALSE, quote=FALSE)


########################
source("lib/df2fp.R")
map <- fp_by_chr(mex.infile="data/Mexicanna_RIMME0033_top.txt",
                 land.infile="data/Hapmapv2_landrace23.txt",
                 mex.outbase="largedata/fphase/mex12",
                 land.outbase="largedata/fphase/land23")
## !!! the order of the SNP is critical !!!
map <- map[order(map$chr, map$physical), ]
write.table(map[,1:7], "largedata/fphase/snp50k_subset_info.csv", sep=",", row.names=FALSE, quote=FALSE)


#>>> [ 43694 ] snps for [ 12 ] Mexicanna plants
#>>> [ 51715 ] snps for [ 23 ] maize Landraces (hmp2) plants
#>>> outlist[[1]]: [ 41812 ] snps mex and land
###>>> fastPHASE for [ 6055 ] SNPs [ 12 ] plants to: [ largedata/fphase/mex12_chr1 ] 
###>>> fastPHASE for [ 6055 ] SNPs [ 23 ] plants to: [ largedata/fphase/land23_chr1 ]


###################################################################################################
map_ref_alt <- function(){
    ref <- read.csv("largedata/SNP55_811_samples_top.csv", header=TRUE)
    map <- read.csv("largedata/fphase/snp50k_info.csv", header=TRUE)
    #map <- map[order(map$chr, map$physical), ]
    
    map1 <- merge(map, ref[,c(1:2,7)], by.x="snpid", by.y="SNP.NAME", all.x=TRUE)
    map1$X <- gsub(".*\\[", "", map1$X)
    map1$X <- gsub("\\].*", "", map1$X)
    map1$A1 <- gsub("\\/.", "", map1$X)
    map1$A2 <- gsub(".\\/", "", map1$X)
    map1$B73ref <- as.character(map1$B73ref)
    map1$B73ref <- gsub(".$", "", map1$B73ref)
    
    map1$ref <- map1$B73ref
    map1$alt <- "N"
    map1[map1$ref == map1$A1, ]$alt <- map1[map1$ref == map1$A1, ]$A2
    map1[map1$ref == map1$A2, ]$alt <- map1[map1$ref == map1$A2, ]$A1
    map1 <- subset(map1, alt != "N")
    map1$alleles <- map1$X
    map1 <- map1[order(map1$chr, map1$physical), ]
    return(map1)    
}


fp_by_chr <- function(mex.infile="data/Mexicanna_RIMME0033_top.txt",
                      land.infile="data/Hapmapv2_landrace23.txt", iscsv=FALSE,
                      mex.outbase="largedata/fphase/mex_120",
                      land.outbase="largedata/fphase/mex_120"
                      ){
    
    ##### Mexicanna lines
    mex <- read.table(mex.infile, header=TRUE)
    message(sprintf("#>>> [ %s ] snps for [ %s ] Mexicanna plants", nrow(mex), ncol(mex)-1))
    
    ##### Landrace lines
    if(iscsv){
        maize <- read.csv(land.infile, header=TRUE)
    }else{
        maize <- read.table(land.infile, header=TRUE) 
    }
    
    message(sprintf("#>>> [ %s ] snps for [ %s ] maize Landraces (hmp2) plants", nrow(maize), ncol(maize)-1))
    
    olsnp <- merge(mex[,1:2], maize[, 1:2], by="id")
    
    ####### map file:
    map <- read.csv("largedata/fphase/snp50k_061715_info.csv", header=TRUE)
    map <- subset(map, snpid %in% olsnp$id)
    message(sprintf("#>>> IN TOTAL: [ %s ] snps mex and land", nrow(map) ))
    
    mex <- subset(mex, id %in% olsnp$id)
    mex2 <- merge(map, mex, by.x="snpid", by.y="id") 
    mex2 <- apply(mex2, 2, as.character)
    mex2[mex2=="--"] <- "??"
    mex2[mex2=="NN"] <- "??"
    
    mex2 <- as.data.frame(mex2)
    mex2$chr <- as.numeric(as.character(mex2$chr))
    mex2$physical <- as.numeric(as.character(mex2$physical))
    mex2 <- mex2[order(mex2$chr, mex2$physical), ]
    
    ####### landrace
    land <- subset(maize, id %in% olsnp$id)
    land2 <- merge(map, land, by.x="snpid", by.y="id") 
    land2 <- apply(land2, 2, as.character)
    land2[land2=="--"] <- "??"
    land2[land2=="NN"] <- "??"
    
    land2 <- as.data.frame(land2)
    land2$chr <- as.numeric(as.character(land2$chr))
    land2$physical <- as.numeric(as.character(land2$physical))
    land2 <- land2[order(land2$chr, land2$physical), ]
    
    for(chri in 1:10){
        mex3 <- subset(mex2, chr==chri)
        out <- paste0(mex.outbase, "_chr", chri)
        df2fp(df=mex3, outfile=out) 
        
        land3 <- subset(land2, chr==chri)
        out2 <- paste0(land.outbase, "_chr", chri)
        df2fp(df=land3, outfile=out2) 
    }
    return(map)
}



