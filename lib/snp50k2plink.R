


### test
### module load plink/1.90 
plink --file snp50k --missing-genotype N --make-bed --out snp50k
convert_bim_allele.pl snp50k.bim MaizeSNP50_A.snptable -intype top -outtype forward -outfile test.bim

snp50k2plink(infile="data/BennettSNPs_FINAL.txt", mapfile="data/snp50k.map", 
             outfile="largedata/runplink/snp50k", fid="Mex")

snp50k2plink <- function(infile="data/BennettSNPs_FINAL.txt",
                         mapfile="data/snp50k.map",
                         outfile="largedata/runplink/snp50k",
                         fid="Mex"){
    
    ### note: infile matrix, snpid and SNPs
    toton <- read.table(infile, header=TRUE)
    toton <- apply(toton, 2, as.character)
    toton[toton=="--"] <- "NN"
    toton <- as.data.frame(toton)
    myiid <- names(toton)[-1]
    
    ### convert from "AA" => "A A"
    for(i in 2:ncol(toton)){
        toton$a1 <- gsub(".$", "", toton[,i])
        toton$a2 <- gsub("^.", "", toton[,i])
        toton[, i] <- paste(toton$a1, toton$a2)
    }
    idx <- ncol(toton)
    toton <- toton[, 1:(idx-2)]
    
    ### read map file
    map <- read.table(mapfile, header=TRUE)
    df <- merge(map, toton, by="snpid")
    df <- df[order(df$chr, df$physical),]
    message(sprintf("###>>> Merged [ %s ] SNPs for [ %s ] plants", nrow(df), length(myiid) ))
    
    #### PLINK MAP
    plinkmap <- df[, c("chr", "snpid", "genetic", "physical")] 
    write.table(plinkmap, paste(outfile, "map", sep="."), sep="\t", 
                row.names=FALSE, col.names=FALSE, quote=FALSE)
    message(sprintf("###>>> write MAP file to [ %s ]", paste(outfile, "map", sep=".")))
    
    #### PLINK PED
    ped <- data.frame(fid=fid, iid=myiid, pid=0, mid=0, sex=0, pheno=0)
    pedout <- paste(outfile, "ped", sep=".")
    cat("", file=pedout, append=FALSE)
    for(i in 1:nrow(ped)){
        cat(t(ped[i,]), 
            df[, i+4],
            "\n",
            sep="\t", file=pedout, append=TRUE)
    }
    message(sprintf("###>>> write PED file to [ %s ]", pedout))
    
}











    