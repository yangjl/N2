write_hmp_group <- function(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1, whichgroup="1 1",
                            outfile="largedata/SeeDs/SeeDs-toton_unimputed_mr6_ames.txt", mr=0.6){
    
    ### dist_cutoff: cutoff to determine the distance from totonpec location!
    
    #### SeeD location information
    seedinfo <- read.csv(idinfo)
    
    seedinfo$Toton <- 0
    seedinfo[seedinfo$dist <= dist_cutoff, ]$Toton <- "1 1" #64 <= toton lines
    seedinfo[seedinfo$dist > dist_cutoff, ]$Toton <- "2 2" #4063 <- non-toton lines
    seedinfo <- seedinfo[order(seedinfo$Toton, seedinfo$SampleID),]
    
    hmp0 <- read.delim("/group/jrigrp4/SeeData/chr10_filetered_unimputed.hmp", nrow=5, header=TRUE)
    hd <- data.frame(ID = names(hmp0), group= "N")
    hd2 <- merge(hd, seedinfo[, c("SampleID", "Toton")], by.x="ID", by.y="SampleID")
    hd2 <- hd2[order(hd2$Toton, hd2$ID), ]
    
    
    ###>>> Ames data info
    ### read in the AMES HMP data GBSv2.7
    library("data.table")
    message("###>>> loading ames GBSv2.7 ...")
    hmpames <- fread("/group/jrigrp4/AllZeaGBSv2.7impV5/ZeaGBSv27_Ames.bed5", sep="\t", header=TRUE)
    hmpames <- as.data.frame(hmpames)
    ameshd <- data.frame(ID = names(hmpames), group="N", Toton=3)[-1:-5,]
    ameshd$Toton <- as.character(ameshd$Toton)
    
    ###>>> determining groups
    d3 <- data.frame(ID = c("snpid", "chr", "pos"), group="N", Toton="N" )
    hd2 <- subset(hd2, Toton %in% whichgroup)
    hd2$Toton <- "1 1"
    hd3 <- rbind(d3, hd2, ameshd)
    #hd3$Toton <- "1 1"
    message("Groups in the header:")
    print(table(hd3$Toton))
    thd <- as.data.frame(t(hd3[, c(1,3)]))
    #### output header and group information
    write.table(thd, outfile, sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
    message(sprintf("###>>> output header with [ %s ] columns", ncol(thd)))
    
    
    
    #####
    for(i in 1:10){
        frq1 <- read.table(paste0("/group/jrigrp4/SeeData/chr", i, "_filetered_unimputed.frq"), header=TRUE)
        frq <- subset(frq1, missing <= mr)
        
        message(sprintf("###>>> loading SeeDs for [ chr %s ]", i))
        hmp1 <- fread(paste0("/group/jrigrp4/SeeData/chr", i, "_filetered_unimputed.hmp"), sep="\t", header=TRUE)
        hmp1 <- as.data.frame(hmp1)
        hmp1 <- subset(hmp1, snpid %in% frq$snpid)
        hmpout1 <- hmp1[, c("snpid", "chr", "end", as.character(subset(hd3, Toton == "1 1")$ID))]
        message(sprintf("###>>> SeeDs: Loaded [ %s ] SNPs, [ %s ] remaining for [ %s ] plants", 
                        nrow(frq1), nrow(hmp1), ncol(hmpout1) -3))
        
        #######>>>> ames
        ames1 <- subset(hmpames, snpid %in% frq$snpid)
        hmpout2 <- ames1[, c("snpid", as.character(subset(hd3, Toton == "3")$ID))]
        message(sprintf("###>>> Ames: Loaded [ %s ] SNPs, [ %s ] remaining for [ %s ] plants", 
                        nrow(subset(hmpames, chr %in% i)), nrow(ames1), ncol(hmpout2) -1))
        
        allp <- merge(hmpout1, hmpout2, by="snpid")
        allp <- allp[, c("snpid", "chr", "end", as.character(hd3$ID)[-1:-3])]
        
        write.table(allp, outfile, sep="\t", col.names=FALSE, row.names=FALSE, quote=FALSE, append=TRUE)
        message(sprintf("###--- output [%s] snps and [ %s ] columns for chr [ %s ]", nrow(allp), ncol(allp) , i))
    }
}
