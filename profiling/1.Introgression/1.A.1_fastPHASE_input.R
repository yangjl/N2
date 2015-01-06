### Jinliang Yang
### 1.5.2014
### purpose: format SNP for fastPHASE input

df2fPHASE <- function(df=mex, outfile="largedata/test.out"){
    #inputdf: 1st: id; snps, note:missing data coded with ??
    df <- as.data.frame(df)
    cat(ncol(df)-1,
        nrow(df),
        #paste(df$id, sep=" "),
        file=outfile, sep="\n")
    #cat(as.character(df$id),
    #    "\n",
    #    file=outfile, append=TRUE, sep=" ")
    
    for(i in 2:ncol(df)){
        temp <- as.data.frame(df[, c(1,i)])
        temp$snp1 <- gsub(".$", "", temp[,2])
        temp$snp2 <- gsub("^.", "", temp[,2])
        cat(names(temp)[2],
            "\n",
            temp$snp1,
            "\n",
            temp$snp2,
            "\n",
            append=TRUE,file=outfile, sep="")
    }
    message(sprintf("fastPHASE file output to: [ %s ] ", outfile))
}

#######
#Mexicana N=120
mex <- read.table("data/Mexicana_TopStrand_FinalReport.txt", header=TRUE)
mex <- apply(mex, 2, as.character)
mex[mex=="--"] <- "??"

df2fPHASE(df=mex, outfile="largedata/fphase/mex_120.fp")

#Parviglumis N=130
parv <- read.table("data/Parviglumis_TopStrand_FinalReport.txt", header=TRUE)
parv <- apply(parv, 2, as.character)
parv[parv=="--"] <- "??"

df2fPHASE(df=parv, outfile="largedata/fphase/parv_130.fp")

#landraces N=94
land <- read.table("data/HighLowSNPs_Final.txt", header=TRUE)
land <- apply(land, 2, as.character)
land[land=="--"] <- "??"

df2fPHASE(df=land, outfile="largedata/fphase/land_94.fp")

