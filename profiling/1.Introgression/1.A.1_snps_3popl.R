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

map1 <- Get_SNP50k_Map()

#####
map2 <- read.csv("data/MaizeSNP50_A.csv")
map2 <- map2[, c("Name", "Chr", "MapInfo")]
table(map2$Chr)

mapall <- merge(map1, map2, by.x="snpid", by.y="Name")
####