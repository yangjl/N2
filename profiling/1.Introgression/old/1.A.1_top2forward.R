### Jinliang Yang
### June. 11th, 2015
### purpose: using new approach for SNP conversion

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

map <- Get_SNP50k_Map()
write.table(map, "data/snp50k.map", sep="\t", row.names=FALSE, quote=FALSE)



#####
get_topbot <- function(){
    map2 <- read.csv("data/MaizeSNP50_A.csv")
    ### change to TopGenomicSeq column rather than SourceSeq
    map2 <- map2[, c("Name", "SNP", "IlmnStrand", "SourceStrand")]
    write.table(map2, "data/MaizeSNP50_A.snptable", sep="\t", row.names=FALSE, quote=FALSE)
    #return(map2)
}
get_topbot()




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
