# Jinliang Yang
# March 23rd, 2015
# Translate SNP50k matrix to HapMix format

### Note the toton data have been fixed the top/bot issue in 2.assignment folder.
toton <- read.csv("largedata/toton_translated.csv")


nms <- names(toton)
idx1 <- which(nms =="P1")
idx2 <- which(nms =="P12_2")



toton[, idx1:idx2] <- apply(toton[, idx1:idx2], 2, as.character)
for(i in paste0("P", 1:12)){
    pn <- i
    pn1 <- paste(pn, "1", sep="_")
    pn2 <- paste(pn, "2", sep="_")
    toton[toton[, pn1] == "N" & toton[, pn2] == "N", pn] <- 9
    toton[toton[, pn1] == toton[, "ref"] & toton[, pn2] == toton[, "ref"], pn] <- 2
    toton[toton[, pn1] == toton[, "alt"] & toton[, pn2] == toton[, "alt"], pn] <- 0
    toton[toton[, pn1] == toton[, "ref"] & toton[, pn2] == toton[, "alt"], pn] <- 1
    toton[toton[, pn1] == toton[, "alt"] & toton[, pn2] == toton[, "ref"], pn] <- 1    
}



