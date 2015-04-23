### Jinliang Yang
### April 13th, 2015
### Prepare SeeD data for fpSNP

write_hmp_grp <- function(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1,
                          outfile="largedata/SeeDs/seeds_unimputed_mr6.txt", mr=0.6){
    
    
    #### SeeD location information
    seedinfo <- read.csv(idinfo)
    
    seedinfo$Toton <- 0
    seedinfo[seedinfo$dist <= dist_cutoff, ]$Toton <- "1 1" #64
    seedinfo[seedinfo$dist > dist_cutoff, ]$Toton <- "2 2" #4063
    seedinfo <- seedinfo[order(seedinfo$Toton, seedinfo$SampleID),]
    
    hmp0 <- read.delim("/group/jrigrp4/SeeData/chr10_filetered_unimputed.hmp", nrow=5, header=TRUE)
    hd <- data.frame(ID = names(hmp0), group= "N")
    hd2 <- merge(hd, seedinfo[, c("SampleID", "Toton")], by.x="ID", by.y="SampleID")
    hd2 <- hd2[order(hd2$Toton, hd2$ID), ]
    
    d3 <- data.frame(ID = c("snpid", "chr", "pos"), group="N", Toton="N" )
    hd3 <- rbind(d3, hd2)
    thd <- as.data.frame(t(hd3[, c(1,3)]))
    #### output header and group information
    write.table(thd, outfile, sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
    message(sprintf("###>>> output header with [ %s ] columns", ncol(thd)))
    
    #####
    for(i in 1:10){
        frq1 <- read.table(paste0("/group/jrigrp4/SeeData/chr", i, "_filetered_unimputed.frq"), header=TRUE)
        frq <- subset(frq1, missing <= mr)
        
        hmp1 <- read.delim(paste0("/group/jrigrp4/SeeData/chr", i, "_filetered_unimputed.hmp"), header=TRUE)
        hmp1 <- subset(hmp1, snpid %in% frq$snpid)
        message(sprintf("###>>> Loaded in [ %s ] SNPs and [ %s ] remaining ", nrow(frq1), nrow(hmp1)))
        hmpout <- hmp1[, c("snpid", "chr", "end", as.character(hd2$ID))]
        write.table(hmpout, outfile, sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE, append=TRUE)
        message(sprintf("###--- output [ %s ] columns for chr [ %s ]", ncol(hmpout) , i))
    }
}

###############
write_hmp_grp(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1,
              outfile="largedata/SeeDs/seeds_unimputed_mr6.txt", mr=0.6)


