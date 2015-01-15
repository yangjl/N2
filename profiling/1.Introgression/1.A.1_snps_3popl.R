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

map <- Get_SNP50k_Map()

#####
map <- read.csv("data/MaizeSNP50_A.csv")
map <- map2[, c("Name", "Chr", "MapInfo")]
table(map2$Chr)

#Mexicana N=120
mex <- read.table("data/Mexicana_TopStrand_FinalReport.txt", header=TRUE)
mex <- apply(mex, 2, as.character)
mex[mex=="--"] <- "??"


test <- merge(map2, mex[, 1:2], by.x="Name", by.y="id")



df2fPHASE(df=mex, outfile="largedata/fphase/mex_120.fp")

#Parviglumis N=130
parv <- read.table("data/Parviglumis_TopStrand_FinalReport.txt", header=TRUE)
parv <- apply(parv, 2, as.character)
parv[parv=="--"] <- "??"

df2fPHASE(df=parv, outfile="largedata/fphase/parv_130.fp")

#landraces N=94
land <- read.table("data/HighLowSNPs_Final.txt", header=TRUE)
land <- apply(land, 2, as.character)
land[land=="--"] <- "??"

df2fPHASE(df=land, outfile="largedata/fphase/land_94.fp")






