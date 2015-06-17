### Jinliang Yang
### format df into fastPHASE's input

df2fp <- function(df=mex, outfile="largedata/test.out"){
    #inputdf: 1st: id; snps, note:missing data coded with ??
    df <- as.data.frame(df)
    cat(ncol(df)-7,
        nrow(df),
        #paste(df$id, sep=" "),
        file=outfile, sep="\n")
    #cat(as.character(df$id),
    #    "\n",
    #    file=outfile, append=TRUE, sep=" ")
    
    for(i in 8:ncol(df)){
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
    message(sprintf("###>>> fastPHASE for [ %s ] SNPs [ %s ] plants to: [ %s ] ",  
                    nrow(df), ncol(df)-7, outfile))
}