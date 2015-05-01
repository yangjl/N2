### Jinliang Yang
### April 13th, 2015
### Prepare SeeD data for fpSNP

write_hmp_grp2 <- function(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1,
                          outfile="largedata/SeeDs/Toton_unimputed_mr6_ames.txt", mr=0.6){
    
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
    hd3 <- rbind(d3, subset(hd2, Toton == "1 1"), ameshd)
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

###############
write_hmp_grp2(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1,
              outfile="largedata/SeeDs/Toton_unimputed_mr6_ames.txt", mr=0.6)

#Read 557311 rows and 3329 (of 3329) columns from 3.470 GB file in 00:04:07
#Groups in the header:
    
#    N  1 1    3 
#    3   64 3324 
###>>> output header with [ 3391 ] columns
# Read 113082 rows and 4850 (of 4850) columns from 2.045 GB file in 00:01:14
###>>> SeeDs: Loaded [ 112975 ] SNPs, [ 72113 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 86408 ] SNPs, [ 50811 ] remaining for [ 3324 ] plants
###--- output [50811] snps and [ 3391 ] columns for chr [ 1 ]
# Read 88201 rows and 4850 (of 4850) columns from 1.595 GB file in 00:00:53
###>>> SeeDs: Loaded [ 88094 ] SNPs, [ 55448 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 67855 ] SNPs, [ 39324 ] remaining for [ 3324 ] plants
###--- output [39324] snps and [ 3391 ] columns for chr [ 2 ]
# Read 82902 rows and 4850 (of 4850) columns from 1.499 GB file in 00:00:55
###>>> SeeDs: Loaded [ 82810 ] SNPs, [ 52227 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 63838 ] SNPs, [ 37421 ] remaining for [ 3324 ] plants
###--- output [37421] snps and [ 3391 ] columns for chr [ 3 ]
# Read 72490 rows and 4850 (of 4850) columns from 1.311 GB file in 00:00:41
###>>> SeeDs: Loaded [ 72399 ] SNPs, [ 44592 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 53884 ] SNPs, [ 30603 ] remaining for [ 3324 ] plants
###--- output [30603] snps and [ 3391 ] columns for chr [ 4 ]
# Read 84033 rows and 4850 (of 4850) columns from 1.520 GB file in 00:00:55
###>>> SeeDs: Loaded [ 83953 ] SNPs, [ 54159 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 64337 ] SNPs, [ 38173 ] remaining for [ 3324 ] plants
###--- output [38173] snps and [ 3391 ] columns for chr [ 5 ]
# Read 58580 rows and 4850 (of 4850) columns from 1.059 GB file in 00:00:34
###>>> SeeDs: Loaded [ 58511 ] SNPs, [ 36593 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 44625 ] SNPs, [ 25806 ] remaining for [ 3324 ] plants
###--- output [25806] snps and [ 3391 ] columns for chr [ 6 ]
# Read 61635 rows and 4850 (of 4850) columns from 1.115 GB file in 00:00:41
###>>> SeeDs: Loaded [ 61570 ] SNPs, [ 38751 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 47118 ] SNPs, [ 27465 ] remaining for [ 3324 ] plants
###--- output [27465] snps and [ 3391 ] columns for chr [ 7 ]
# Read 62555 rows and 4850 (of 4850) columns from 1.131 GB file in 00:00:39
###>>> SeeDs: Loaded [ 62472 ] SNPs, [ 39221 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 47454 ] SNPs, [ 27503 ] remaining for [ 3324 ] plants
###--- output [27503] snps and [ 3391 ] columns for chr [ 8 ]
# Read 55160 rows and 4850 (of 4850) columns from 0.998 GB file in 00:00:32
###>>> SeeDs: Loaded [ 55111 ] SNPs, [ 34821 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 42241 ] SNPs, [ 24618 ] remaining for [ 3324 ] plants
###--- output [24618] snps and [ 3391 ] columns for chr [ 9 ]
# Read 51681 rows and 4850 (of 4850) columns from 0.935 GB file in 00:00:32
###>>> SeeDs: Loaded [ 51633 ] SNPs, [ 31840 ] remaining for [ 64 ] plants
###>>> SeeDs: Loaded [ 39289 ] SNPs, [ 22347 ] remaining for [ 3324 ] plants
###--- output [22347] snps and [ 3391 ] columns for chr [ 10 ]

