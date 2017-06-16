# Jinliang Yang
# March 23rd, 2015
# Translate SNP50k matrix to HapMix format


for(chri in 1:10){
    getToton(chrnum= chri,
             snpinfofile= paste0("largedata/hapmixrun/snp_maize_chr", chri,".info" ),
             outgeno= paste0("largedata/hapmixrun/toton_chr", chri, ".out" ),
             outsnpinfo= paste0("largedata/hapmixrun/toton_chr", chri, ".snpinfo" ),
             outind= paste0("largedata/hapmixrun/toton_chr", chri, ".ind"),
             outrate= paste0("largedata/hapmixrun/toton_chr", chri, ".rate")
    )
}

########################################################################################################################
di2ha <- function(mex=mex){
    for(i in 2:ncol(mex)){
        mex$a1 <- gsub(".$", "", mex[,i])
        names(mex)[ncol(mex)] <- paste(names(mex)[i], "1", sep="_")
        mex$a2 <- gsub("^.", "", mex[,i])
        names(mex)[ncol(mex)] <- paste(names(mex)[i], "2", sep="_")
    }
    return(mex)
}


### Note the toton data have been fixed the top/bot issue in "2.assignment" folder.
getToton <- function(chrnum=3,
                     snpinfofile="largedata/hapmixrun/snp_maize_chr3.info",
                     outgeno="largedata/hapmixrun/toton_chr3.out",
                     outsnpinfo="largedata/hapmixrun/toton_chr3.snpinfo",
                     outind="largedata/hapmixrun/toton_chr3.ind",
                     outrate="largedata/hapmixrun/toton_chr3.rate"
                         ){
    
    #### get totontepec file
    toton <- read.csv("data/BennettSNP50k_35samples_final.csv", header=TRUE)
    toton <- apply(toton, 2, as.character)
    toton[toton=="--"] <- "NN"
    toton <- as.data.frame(toton)
    toton <- di2ha(mex=toton)
    
    info <- read.csv("largedata/fphase/snp50k_subset_info.csv")
    toton <- merge(info, toton, by="snpid")
    
    #### translate it into HAPMIX format
    nms <- names(toton)
    idx1 <- which(nms =="RIMMA0763.1")
    idx2 <- which(nms =="RIMMA0787.1_2")
    idx3 <- which(nms == "RIMMA0787.1")
    
    toton[, idx1:idx2] <- apply(toton[, idx1:idx2], 2, as.character)
    for(i in idx1:idx3){
        pn <- nms[i]
        pn1 <- paste(pn, "1", sep="_")
        pn2 <- paste(pn, "2", sep="_")
        toton[toton[, pn1] == "N" & toton[, pn2] == "N", pn] <- 9
        
        toton[toton[, pn1] == toton[, "ref"] & toton[, pn2] == toton[, "ref"], pn] <- 2
        toton[toton[, pn1] == toton[, "alt"] & toton[, pn2] == toton[, "alt"], pn] <- 0
        toton[toton[, pn1] == toton[, "ref"] & toton[, pn2] == toton[, "alt"], pn] <- 1
        toton[toton[, pn1] == toton[, "alt"] & toton[, pn2] == toton[, "ref"], pn] <- 1 
        toton <- toton[toton[,pn] == 0 | toton[,pn] ==1 | toton[,pn] ==2 | toton[,pn] ==9,]
    }
    
    #toton[toton[,12] != 0 & toton[,12] !=1 & toton[,12] !=2 & toton[,12] !=9,]
    ######
    tchr10 <- subset(toton, chr == chrnum)
    snpinfo <- read.table(snpinfofile, header=FALSE)
    subchr <- merge(tchr10, snpinfo, by.x="snpid", by.y="V1")
    subchr <- subchr[order(subchr$V4),]
    subchr$V3 <- format(subchr$V3, digits=7)
    
    outsubchr <- subchr[, idx1:idx3]
    #outsubchr[outsubchr != 0 & outsubchr !=1 & outsubchr !=2 & outsubchr !=9] <- 9
    
    ### Genotype file
    write.table(outsubchr, outgeno, sep="", 
                row.names=FALSE, col.names=FALSE, quote=FALSE)
    ### SNP file
    write.table(subchr[, c("snpid", "V2", "V3", "V4", "V5", "V6")], outsnpinfo, sep="\t",
                row.names=FALSE, col.names=FALSE, quote=FALSE)
    
    ### individual file
    ind <- data.frame(id = names(subchr)[idx1:idx3], sex="F", Note="totonPop")
    write.table(ind, outind, sep="\t", 
                row.names=FALSE, col.names=FALSE, quote=FALSE)
    
    #snpinfo <- snpinfo[order(snpinfo$V4), ]
    ### rate file: question, order and how to deal with subsetting
    cat(paste0(":sites:", nrow(subchr)),
        file = outrate, sep="\n", append=FALSE
    )
    cat(subchr$V4,
        "\n",
        file=outrate, sep=" ", append=TRUE
    )
    cat(format(subchr$V3, digits=7),
        "\n",
        file=outrate, sep=" ", append=TRUE
    )  
}


