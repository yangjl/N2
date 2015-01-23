### Jinliang Yang
### to find fingerprint SNPs

findSNP <- function(frqfile="tests/output.txt", binsize=10, pcutoff=0.001, missingrate=0.5 ){
  
  ### read in snp frq file
  pout <- read.table(frqfile, header=TRUE)
  pout$diff <- abs(pout$maf2 - pout$maf1)
  
  ### snp filtering based on missingrate
  pout <- subset(pout, missing1 <= missingrate & missing2 <= missingrate)
  
  ### snp filtering based on binsize
  pout$bin <- paste(pout$chr, round(pout$pos/binsize, 0), sep="_")
  pout <- pout[order(pout$diff, decreasing=TRUE),]
  pout <- pout[!duplicated(pout$bin),]
  
  for(i in 2:nrow(pout)){
    pval <- t.test(pout$maf1[1:i], pout$maf2[1:i], paired = TRUE)$p.value
    if(pval <= pcutoff){
      outi <- i
      break
    }
  }
  message(sprintf("###>>> With the allele frequencies of [ %s ] selected SNPs, only [ %s ] \
                  possbility that the two populations are the same!", outi, pval))
  return(pout[1:outi, ])
}

#test <- findSNP(frqfile="tests/output.txt", binsize=100, pcutoff=0.001, missingrate=0.5 )
