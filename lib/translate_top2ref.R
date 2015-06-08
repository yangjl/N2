
#### start to translate
translate_top2ref <- function(infile = "data/Mexicana_TopStrand_FinalReport.txt", ob=FALSE, mergeid="id", 
                              colfrom="RIMME0021.C1.1.1", colto="P12_2"){
    ### df: input data.frame, must col: snpid, 
    
    #### got id of the SNP file:
    snptab <- read.csv("largedata/top2ref_snptab.csv", header=TRUE)
    snptab$snpid <- paste0("S", snptab$snpid)
    #### get info of snpid
    snp50k2 <- read.csv("largedata/hmp2_AGPv2_37k.csv")
    snp50k2$rsid <- paste("S", snp50k2$rsid, sep="")
    snpid <- snp50k2[, c("snpid", "rsid")]
    snptab <- merge(snpid, snptab, by.x="rsid", by.y="snpid")
    
    if(ob){
        df <- infile
    }else{
        df <- read.table(infile, header=TRUE)
    }
    tot <- merge(snptab, df, by.x="snpid", by.y=mergeid)
    
    tot$fwdtop <- as.character(tot$fwdtop)
    tot$fwdbot <- as.character(tot$fwdbot)
    tot$top <- as.character(tot$top)
    tot$bot <- as.character(tot$bot)
    
    ### idxing the cols for translation
    idx1 <- which(colnames(tot)==colfrom)
    idx2 <- which(colnames(tot)==colto)
    for(i in idx1:idx2){
        tot[, i] <- as.character(tot[,i])
        
        tot$A1 <- gsub(".$", "", tot[, i])
        tot$A2 <- gsub("^.", "", tot[, i])
        
        ### start translation
        num1 <- nrow(tot[tot$A1 != tot$top & tot$A1 != tot$bot & tot$A1 != "-", ])
        tot[tot$A1 != tot$top & tot$A1 != tot$bot, ]$A1 <- "N"
        tot[tot$A1 == tot$top, ]$A1 <- tot[tot$A1 == tot$top, ]$fwdtop
        tot[tot$A1 == tot$bot, ]$A1 <- tot[tot$A1 == tot$bot, ]$fwdbot
        
        num2 <- nrow(tot[tot$A2 != tot$top & tot$A2 != tot$bot & tot$A2 != "-", ])
        tot[tot$A2 != tot$top & tot$A2 != tot$bot, ]$A2 <- "N"
        tot[tot$A2 == tot$top, ]$A2 <- tot[tot$A2 == tot$top, ]$fwdtop
        tot[tot$A2 == tot$bot, ]$A2 <- tot[tot$A2 == tot$bot, ]$fwdbot
        tot[,i] <- paste0(tot$A1, tot$A2)
        
        idx <- grep("N", tot[,i])
        tot[idx, i] <- "NN"
        #head(tot[idx, c("top", "bot", "fwdtop", "fwdbot", colfrom, "A1", "A2")], 10)
        if(num1 + num2 > 0){
            message(sprintf("col [ %s ] contain [ %s ] unknwon genotype", names(tot)[i], num1 + num2))
        }
    }
    
    return(tot)
}
