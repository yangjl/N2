### Jinliang Yang
### April 13th, 2015
### Prepare Toton geno for assignment probabilities

gettoton <- function(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1,
                     outfile="largedata/SeeDs/Toton_geno_only.txt", mr=0.6){
    
    ### dist_cutoff: cutoff to determine the distance from totonpec location!
    library("data.table")
    #### SeeD location information
    seedinfo <- read.csv(idinfo)
    
    seedinfo$Toton <- 0
    seedinfo[seedinfo$dist <= dist_cutoff, ]$Toton <- "1 1" #64 <= toton lines
    seedinfo[seedinfo$dist > dist_cutoff, ]$Toton <- "2 2" #4063 <- non-toton lines
    seedinfo <- seedinfo[order(seedinfo$Toton, seedinfo$SampleID),]
    
    tot <- subset(seedinfo, Toton %in% "1 1")
    tot <- tot[order(tot$SampleID),]
    tot <- tot[, c("SampleID", "colldate", "number")]
    names(tot) <- c("ID", "group", "Toton")
    
    ###>>> determining groups
    d1 <- data.frame(ID = c("snpid", "chr", "pos"), group="N", Toton="N" )
    d2 <- d3 <- tot
    d2$ID <- paste(tot$ID, "a", sep="")
    d3$ID <- paste(tot$ID, "b", sep="")
    d4 <- rbind(d2, d3)
    d4 <- d4[order(d4$ID), ]
    d5 <- rbind(d1, d4)
    
    thd <- as.data.frame(t(d5[, c(1,3)]))
    #### output header and group information
    write.table(thd[-2, ], outfile, sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
    message(sprintf("###>>> output header with [ %s ] columns", ncol(thd)))
    
    #####
    for(i in 1:10){
        frq1 <- read.table(paste0("/group/jrigrp4/SeeData/chr", i, "_filetered_unimputed.frq"), header=TRUE)
        frq <- subset(frq1, missing <= mr)
        
        message(sprintf("###>>> loading SeeDs for [ chr %s ]", i))
        hmp1 <- fread(paste0("/group/jrigrp4/SeeData/chr", i, "_filetered_unimputed.hmp"), sep="\t", header=TRUE)
        hmp1 <- as.data.frame(hmp1)
        hmp1 <- subset(hmp1, snpid %in% frq$snpid)
        hmpout1 <- hmp1[, c("snpid", "chr", "end", as.character(tot$ID))]
       
        write.table(hmpout1, outfile, sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE, append=TRUE)
        message(sprintf("###--- output [%s] snps and [ %s ] columns for chr [ %s ]", nrow(hmpout1), ncol(hmpout1) , i))
    }
}

###############
gettoton(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1,
         outfile="largedata/SeeDs/Toton_geno_only.txt", mr=0.6)

library(data.table)
seeds <- fread("largedata/SeeDs/SeeDs-toton_unimputed_mr6_ames.txt", sep="\t")

