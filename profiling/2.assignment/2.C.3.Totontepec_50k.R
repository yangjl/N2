### Jinliang Yang
### Olivia's 1-year-old birthday
### purpose: prepare the 50k SNP into dsf

get_toton50k <- function(){
    #### get info of snpid
    snp50k2 <- read.csv("largedata/hmp2_AGPv2_37k.csv")
    snp50k2$rsid <- paste("S", snp50k2$rsid, sep="")
    snpid <- snp50k2[, c("snpid", "rsid")]
    
    toton <- read.table("data/BennettSNPs_FINAL.txt", header=TRUE)
    toton <- apply(toton, 2, as.character)
    toton[toton=="--"] <- "NN"
    toton <- as.data.frame(toton)
    
    for(i in 2:13){
        nm <- names(toton)[i]
        toton$hap1 <- gsub(".$", "", toton[,i])
        names(toton)[ncol(toton)] <- paste0(nm, "_1")
        toton$hap2 <- gsub("^.", "", toton[,i])
        names(toton)[ncol(toton)] <- paste0(nm, "_2")
    }
    
    toton <- merge(snpid,toton, by="snpid")
    names(toton)[1] <- "names"
    return(toton)
}

#### start to translate
translate_toton <- function(toton = toton){
    snptab <- read.csv("largedata/top2ref_snptab.csv", header=TRUE)
    snptab$snpid <- paste0("S", snptab$snpid)
    
    tot <- merge(snptab, toton, by.x="snpid", by.y="rsid")
    tot$fwdtop <- as.character(tot$fwdtop)
    tot$fwdbot <- as.character(tot$fwdbot)
    
    ### idxing the cols for translation
    idx1 <- which(colnames(tot)=="P1_1")
    idx2 <- which(colnames(tot)=="P12_2")
    for(i in idx1:idx2){
        num <- nrow(tot[tot[,i] != tot$top & tot[,i] != tot$bot & tot[,i] != "N",])
        message(sprintf("###>>> [ %s ] have [ %s ] unknow snp types", colnames(tot)[i], num ))
        
        ### start translation
        tot[tot[,i] == tot$top & tot[, i] != "N", i] <- tot[tot[,i] == tot$top & tot[, i] != "N", ]$fwdtop
        tot[tot[,i] == tot$bot & tot[, i] != "N", i] <- tot[tot[,i] == tot$bot & tot[, i] != "N", ]$fwdbot   
    }
    
    return(tot)
}


### main 
toton <- get_toton50k()
tot <- translate_toton(toton = toton)
write.table(tot, "largedata/toton_translated.csv", sep=",", row.names=FALSE, quote=FALSE)

