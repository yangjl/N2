### Jinliang Yang

di2ha <- function(mex=mex){
    for(i in 2:ncol(mex)){
        mex$a1 <- gsub(".$", "", mex[,i])
        names(mex)[ncol(mex)] <- paste(names(mex)[i], "1", sep="_")
        mex$a2 <- gsub("^.", "", mex[,i])
        names(mex)[ncol(mex)] <- paste(names(mex)[i], "2", sep="_")
    }
    return(mex)
}



toton <- read.csv("largedata/toton_translated.csv")

mex <- read.table("data/Mexicanna_RIMME0033_ref_alt.txt", header=TRUE)

mex <- di2ha(mex=mex)
idx1 <- which(names(toton) == "P1_1")
idx2 <- which(names(mex) == "RIMME0033.1_1")

mexton <- merge(toton[, c(11, idx1:ncol(toton))], mex[, c(1, idx2:ncol(mex))], by.x="names", by.y="id")


hmp2 <- read.table("data/Hapmapv2_landrace23.txt", header=TRUE)
hmp2 <- di2ha(mex=hmp2)
idx3 <- which(names(hmp2) == "BKN009.MZ_1" )
hmpton <- merge(toton[, c(11, idx1:ncol(toton))], hmp2[, c(1, idx3:ncol(hmp2))], by.x="names", by.y="id")

tem <- frq(df=hmpton, cols=2:ncol(hmpton), trow=1000)

#############
frq <- function(df=mexton, cols=2:ncol(mexton), trow=1000){
    outfile <- data.frame()
    for(i in 1:trow){
        tem <- data.frame(id=df[i, 1], snps=t(df[i, cols]))
        names(tem) <- c("id", "snps")
        tb <- table(tem$snps)
        if("N" %in% names(tb)){
            n <- tb["N"]
            idx <- which(names(tb) == "N")
            tb <- tb[-idx]
        }
        
        all <- paste(names(tb), collapse = '')
        out <- data.frame(id=df[i,1], alleles=all)
        outfile <- rbind(outfile, out)
        print(i)
    }
    outfile$alleles <- as.character(outfile$alleles)
    outfile$count <- nchar(outfile$alleles)
    return(outfile)
}





