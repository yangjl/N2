### Jinliang Yang
### March 25th, 2015
### purpose: convert fastphase format to HapMix format

read_fastphase <- function(fileName = "largedata/fphase/land_94_chr10_hapguess_switch.out", chrnum=10){
    
    ########
    map <- read.csv("largedata/fphase/snp50k_subset_info.csv", header=TRUE)
    map <- subset(map, chr == chrnum)
    
    
    conn <- file(fileName, open="r")
    linn <- readLines(conn, warn=FALSE)
    nline <- -9
    res <- map
    close(conn) 
    
    idx1 <- grep("^BEGIN GENOTYPES", linn)
    idx2 <- grep("^END GENOTYPES", linn)
    
    nline <- 0
    for (i in (idx1+1):(idx2-1)){
        if(nline %% 3 ==0){
            nm <- linn[i]
            nline <- nline + 1
        }else if(nline >= 0 & nline %% 3 ==1){ 
            geno1 <- unlist(strsplit(linn[i], split=" "))
            nline <- nline + 1
        }else if(nline >= 0 & nline %% 3 ==2){
            geno2 <- unlist(strsplit(linn[i], split=" "))
            oneplant <- data.frame(mygeno1=geno1, mygeno2=geno2)
            names(oneplant) <- c(paste0(nm, "_A1"), paste0(nm, "_A2"))
            res <- cbind(res, oneplant)
            
            nline <- nline + 1
        }   
    }
    
    print(sprintf("###>>> reading [ %s ] plants for [ %s ] SNPs for Chr [%s]", nline %/% 3, length(geno2), chrnum))
    return(res)
}



traslate2hapmix <- function(fp = df, startcol=8, outfile="largedata/test.out",
                            outinfo="largedata/snp.info"){
    
    fp <- fp[order(fp$chr, fp$physical),]
    fp[, (startcol-2):ncol(fp)] <- apply(fp[, (startcol-2):ncol(fp)], 2, as.character)
    
    subfp <- fp[, startcol:ncol(fp)]
    if(sum(subfp == "N") > 0){
        stop("No missing data allowed for traslation!")
    }
    for(i in startcol:ncol(fp)){
        fp[fp[, i] != fp[, "ref"], i] <- 0
        fp[fp[, i] == fp[, "ref"], i] <- 1
        
    }
    
    write.table(fp[, startcol:ncol(fp)], outfile, sep="", 
                row.names=FALSE, col.names=FALSE, quote=FALSE)
    
    snpinfo <- fp[, c(1:4,6:7)]
    snpinfo$genetic <- format(snpinfo$genetic, digits=7)
    write.table(snpinfo, outinfo, sep="\t", col.names=FALSE,
                row.names=FALSE, quote=FALSE)
    
}



