# Jinliang Yang
# 6/5/2015
# develop a jackknife samples to rule out the possibility due to false positives

### Note the toton data have been fixed the top/bot issue in "2.assignment" folder.
getAA1 <- function(chrnum=3, snpinfofile="largedata/hapmixrun/snp_maize_jack_chr3.info",
                   outgeno="largedata/hapmixrun/toton_chr3.out",
                   outsnpinfo="largedata/hapmixrun/toton_chr3.snpinfo",
                   outind="largedata/hapmixrun/toton_chr3.ind",
                   outrate="largedata/hapmixrun/toton_chr3.rate"){
    
    #### get landrace file
    maize <- read.table("data/Hapmapv2_landrace23.txt", header=TRUE)
    snpinfo <- read.table(snpinfofile, header=FALSE)
    names(snpinfo) <- c("id", "chr", "genetic", "physical", "ref", "alt")
    maize <- merge(snpinfo, maize, by="id")    

    #### translate it into HAPMIX format
    nms <- names(maize)
    idx1 <- which(nms =="BKN009.MZ")
    idx2 <- which(nms =="BKN040.MZ")
    
    maize[, idx1:idx2] <- apply(maize[, idx1:idx2], 2, as.character)
    snpno1 <- nrow(maize)
    for(idxi in idx1:idx2){
        maize$P1 <- gsub(".$", "", maize[, idxi])
        maize$P2 <- gsub("^.", "", maize[, idxi])
        maize[maize[, "P1"] == "N" & maize[, "P2"] == "N", idxi] <- 9
        
        maize[maize[, "P1"] == maize[, "ref"] & maize[, "P2"] == maize[, "ref"], idxi] <- 2
        maize[maize[, "P1"] == maize[, "alt"] & maize[, "P2"] == maize[, "alt"], idxi] <- 0
        maize[maize[, "P1"] == maize[, "ref"] & maize[, "P2"] == maize[, "alt"], idxi] <- 1
        maize[maize[, "P1"] == maize[, "alt"] & maize[, "P2"] == maize[, "ref"], idxi] <- 1 
        maize <- maize[maize[, idxi] == 0 | maize[, idxi] ==1 | maize[, idxi] ==2 | maize[,idxi] ==9,]
    }
    message(sprintf("Input [ %s ] SNPs for CHR %i; remaining [ %s ]", snpno1, chrnum, nrow(maize)))
    #toton[toton[,12] != 0 & toton[,12] !=1 & toton[,12] !=2 & toton[,12] !=9,]
    ######
    subchr <- maize[order(maize$physical),]
    subchr$genetic <- format(subchr$gentic, digits=7)
     
    ### SNP file
    write.table(subchr[, c("id", "chr", "genetic", "physical", "ref", "alt")], outsnpinfo, sep="\t",
                row.names=FALSE, col.names=FALSE, quote=FALSE)
    #snpinfo <- snpinfo[order(snpinfo$V4), ]
    ### rate file: question, order and how to deal with subsetting
    cat(paste0(":sites:", nrow(subchr)),
        file = outrate, sep="\n", append=FALSE
    )
    cat(subchr$physical,
        "\n",
        file=outrate, sep=" ", append=TRUE
    )
    cat(format(subchr$genetic, digits=7),
        "\n",
        file=outrate, sep=" ", append=TRUE
    ) 
    
    ###>>> each plant with one genotype and one individual file
    count=1
    for(myind in idx1:idx2){
        ### Genotype file
        write.table(subchr[, myind], paste0(outgeno, "_ind", count, ".geno"), sep="", 
                    row.names=FALSE, col.names=FALSE, quote=FALSE)
        ### individual file
        ind <- data.frame(id = names(subchr)[myind], sex="F", Note="totonPop")
        write.table(ind, paste0(outind, "_ind", count, ".ind"), sep="\t", 
                    row.names=FALSE, col.names=FALSE, quote=FALSE)
        count <- count + 1
    }   
}


###>>> run it
for(chri in 1:10){
    getAA1(chrnum= chri,
           snpinfofile= paste0("largedata/hapmixrun/snp_maize_jack_chr", chri,".info" ),
           outgeno= paste0("largedata/hapmixrun/maize_jack_chr", chri),
           outsnpinfo= paste0("largedata/hapmixrun/maize_jack_chr", chri, ".snpinfo" ),
           outind= paste0("largedata/hapmixrun/maize_jack_chr", chri),
           outrate= paste0("largedata/hapmixrun/maize_jack_chr", chri, ".rate")  
    )
}
