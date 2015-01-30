### JInliang Yang
### Jan 28th, 2014
### purpose: combining US GBS data with Totontepec SNP50k data

### reformat to DSF with group info
reformat2dsf <- function(){
    
    tot <- read.csv("largedata/toton_translated.csv", header=TRUE)
    tot$snpid <- gsub("S", "", tot$snpid)
    
    idx1 <- which(colnames(tot)=="P1_1")
    idx2 <- which(colnames(tot)=="P12_2")
    tot <- tot[, c(1, idx1:idx2)]
    
    tot <- rbind(tot[1,], tot)
    
    ### add group info
    tot[1, 1] <- "N"
    tot <- apply(tot, 2, as.character)
    tot[1, 2:ncol(tot)] <- "2"
    
    return(as.data.frame(tot))
}

####
combine2df <- function(tot = tot){
    ### loading US maize with GBS data
    usgbs <- read.table("largedata/AmesGBS/amesGBS_50k_4k.txt", header=TRUE)
    message(sprintf("###>>> loading [ %s ] US lines with [ %s ] GBS SNP data!", ncol(usgbs)-3, nrow(usgbs)-1))
    h <- usgbs[1, -1:-3]
    snps <- usgbs[-1, -1:-3]
    snps[snps !="A" & snps !="T" & snps != "C" & snps != "G" & snps != "N"] <- "N"
    hsnps <- rbind(h, snps)
    usgbs <- cbind(usgbs[, 1:3], hsnps)
    
    twosets <- merge(usgbs, tot, by="snpid")
    message(sprintf("###>>> after combining: [ %s ] lines with [ %s ] SNP!", ncol(twosets)-3, nrow(twosets)-1))
    
    t1 <- subset(twosets, snpid=="N")
    t2 <- subset(twosets, snpid!="N")
    t2 <- t2[order(t2$chr, t2$pos), ]
    return(rbind(t1, t2)) 
}



### main program
tot <- reformat2dsf()   
twosets <- combine2df(tot = tot)

write.table(twosets, "largedata/assignprb/usgbs_tot50k_5619.txt", sep="\t", row.names=FALSE, quote=FALSE)




