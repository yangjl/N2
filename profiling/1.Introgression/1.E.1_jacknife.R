# Jinliang Yang
# 6/5/2015
# develop a jackknife samples to rule out the possibility due to false positives


jacknife(dir="largedata/hapmixjack/")


source("lib/fp2HapMix.R")
#### leave one maize out!
jacknife <- function(dir="largedata/hapmixjack/"){
    for(chri in 1:10){
        fp <- read_fastphase(fileName = paste0("largedata/fphase/land23_chr", chri, "_hapguess_switch.out"), 
                             chrnum= chri)
        
        for(l in 1:23){
            idx <- c((l - 1)*2 + 8, (l - 1)*2 + 9)
            fptmp <- fp[, -idx] 
            
            ### get the reference panel:
            out <- traslate2hapmix(fp = fptmp, startcol=8, 
                                   outfile= paste0(dir, "land_l", l, "_chr", chri, ".out"),
                                   outinfo= paste0(dir, "land_l", l, "_chr", chri, ".info") 
            )
            ### get the admix files:
            
            outgeno <- paste0(dir, "jn_l", l, "_chr", chri, ".out")
            outsnpinfo <- paste0(dir, "jn_l", l, "_chr", chri, ".snpinfo")
            outind <- paste0(dir, "jn_l", l, "_chr", chri, ".ind")
            outrate <- paste0(dir, "jn_l", l, "_chr", chri, ".rate")
            
            jack <- fp[, c(1:7, idx)]
            jack$mn <- "N"
            jack[jack[, 8] == "N" & jack[, 9] == "N", "mn"] <- 9
            
            jack[jack[, 8] == jack[, "ref"] & jack[, 9] == jack[, "ref"], "mn"] <- 2
            jack[jack[, 8] == jack[, "alt"] & jack[, 9] == jack[, "alt"], "mn"] <- 0
            jack[jack[, 8] == jack[, "ref"] & jack[, 9] == jack[, "alt"], "mn"] <- 1
            jack[jack[, 8] == jack[, "alt"] & jack[, 9] == jack[, "ref"], "mn"] <- 1 
            jack <- subset(jack, mn==0 | mn ==1 | mn==2 | mn ==9)
            
            jack <- jack[order(jack$physical),]
            
            ### Genotype file
            write.table(jack[, 10], outgeno, sep="", 
                        row.names=FALSE, col.names=FALSE, quote=FALSE)
            ### SNP file
            write.table(jack[, c("snpid", "chr", "genetic", "physical", "ref", "alt")], outsnpinfo, sep="\t",
                        row.names=FALSE, col.names=FALSE, quote=FALSE)
            
            ### individual file
            ind <- data.frame(id = names(jack)[8], sex="F", Note="totonPop")
            write.table(ind, outind, sep="\t", 
                        row.names=FALSE, col.names=FALSE, quote=FALSE)
            
            #snpinfo <- snpinfo[order(snpinfo$V4), ]
            ### rate file: question, order and how to deal with subsetting
            cat(paste0(":sites:", nrow(jack)),
                file = outrate, sep="\n", append=FALSE)
            cat(jack$physical,
                "\n",
                file=outrate, sep=" ", append=TRUE)
            cat(format(jack$genetic, digits=7),
                "\n",
                file=outrate, sep=" ", append=TRUE)  
            message(sprintf("###>>> input [ %s ] and output [ %s ] SNPs", nrow(fp), nrow(jack)))
        }   
    }    
}







