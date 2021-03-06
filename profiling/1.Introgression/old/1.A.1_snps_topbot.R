### Jinliang Yang
### 1.14.2014
### purpose: get the command set of SNPs for all populations

#######
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


#####
get_topbot <- function(){
    map2 <- read.csv("data/MaizeSNP50_A.csv")
    #map3 <- read.delim("data/GPL17677-31783.txt", comment.char = "#", header=TRUE)
    ### change to TopGenomicSeq column rather than SourceSeq
    map2 <- map2[, c("Name", "Chr", "MapInfo", "TopGenomicSeq")]
    table(map2$Chr)
    map2$alleles <- gsub(".*\\[", "", map2$TopGenomicSeq)
    map2$alleles <- gsub("\\].*", "", map2$alleles)
    
    ### ref this one for http://www.illumina.com/documents/products/technotes/technote_topbot.pdf
    ### http://support.illumina.com/array/array_kits/maizesnp50_dna_analysis_kit/downloads.html
    map2 <- map2[, c("Name", "alleles")]
    names(map2)[2] <- "topbot"
    map2$topbot <- gsub("\\/", ",", map2$topbot)
    return(map2)
}

######
main <- function(){
    ### get the map info from matt's data
    map1 <- Get_SNP50k_Map()
    message(sprintf("###===> [ %s ] SNPs from Matt's data with map info!", nrow(map1)))
    
    ### get ref and alt allele info from illumina website
    map2 <- get_topbot()
    message(sprintf("###===> [ %s ] SNPs from illumina with TopBot allele info!", nrow(map2)))
    
    mapall <- merge(map1, map2, by.x="snpid", by.y="Name")
    mapall$chr <- paste0("chr", mapall$chr)
    message(sprintf("###===> In total, [ %s ] SNPs for both!", nrow(mapall)))
    return(mapall)
}

####
snpall <- main()
###===> [ 37568 ] SNPs from Matt's data with map info!
###===> [ 56110 ] SNPs from illumina with TopBot allele info!
###===> In total, [ 37568 ] SNPs for both!
write.table(snpall[, c("chr", "physical", "topbot")], "largedata/snp50k_topbot.txt", 
            sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)

####### Use top2ref.pl to do the transformation from top/bot to forward stand!!!!
#### 1.5.15_intorgression.pdf