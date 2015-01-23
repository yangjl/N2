# Jinliang Yang
# date: 10/6/2014
# R code to get the population specific fingerprint SNPs

getoverall <- function(dsf=dsf){
  #### set up output subject
  out <- dsf[, 1:3]
  out$minor <- out$major <- "N"
  out$missing0 <- out$maf0 <- -9
  
  for(i in 2:nrow(dsf)){
    asnp <- t(dsf[i, 4:ncol(dsf)])
    asnptab <- as.data.frame(table(asnp));
    if(sum(asnptab$asnp %in% "N") ==1){
      numN <- asnptab[asnptab$asnp=="N", ]$Freq
      asnptab <- asnptab[asnptab$asnp != "N",];
    }else{
      numN <- 0;
    }
    
    if(nrow(asnptab) ==1){
      out$maf0[i] <- 0 ### locus with no polymorphsim
    }else if(nrow(asnptab) ==2){
      minidx <- which.min(asnptab$Freq)
      out$major[i] <- as.character(asnptab$asnp[-minidx])
      out$minor[i] <- as.character(asnptab$asnp[minidx])
      out$maf0[i] <- asnptab$Freq[minidx]/sum(asnptab$Freq)
      out$missing0[i] <- numN/(ncol(dsf)-3)
    }else{
      out$maf0[i] <- 3 ### locus with multiple alleles
    }
  }
  
  out$maf0 <- round(out$maf0, 5)
  out$missing0 <- round(out$missing0, 5)
  ####
  return(out)
}

############# get the population frq and missingness
getpop <- function(dsf=dsf, out=out, popidx = which(dsf[1,]==1) ){
  out$missingp <- out$mafp <- -9
 
  for(i in 2:nrow(dsf)){
    asnp <- t(dsf[i, popidx])
    asnptab <- as.data.frame(table(asnp));
    if(sum(asnptab$asnp %in% "N") ==1){
      numN <- asnptab[asnptab$asnp=="N", ]$Freq
      asnptab <- asnptab[asnptab$asnp != "N",];
    }else{
      numN <- 0;
    }
    
    #### filtering
    midx <- which(asnptab$asnp == out$minor[i])
    out$missingp[i] <- numN/length(popidx)
    if(sum(midx) == 0){
      out$mafp[i] <- 0
    }else{
      out$mafp[i] <- asnptab$Freq[midx]/sum(asnptab$Freq)
    } 
  }
  
  out$mafp <- round(out$mafp, 5)
  out$missingp <- round(out$missingp, 5)
  ####
  return(out)
}

##############
dsf <- read.table("data/simusnps.txt", header=TRUE)
out <- getoverall(dsf=dsf)
out1 <- getpop(dsf=dsf, out=out, popidx = which(dsf[1,]==1) )
names(out1)[8:9] <- c("maf1", "missing1") 
out2 <- getpop(dsf=dsf, out=out1, popidx = which(dsf[1,]==2) )
names(out2)[10:11] <- c("maf2", "missing2") 
output <- out2[-1,]
write.table(output, "tests/routput.txt", sep="\t", row.names=FALSE, quote=FALSE)
