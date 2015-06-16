

##### Mexicanna lines
allmex <- read.table("data/Mexicana_TopStrand_FinalReport.txt", header=TRUE)
idx <- grep("^RIMME0033", names(allmex))
allop <- allmex[, c(1, idx)]


names(mex)[1] <- "id"
write.table(mex[, c(1,12:23)], "data/Mexicanna_RIMME0033_ref_alt.txt", sep="\t", row.names=FALSE, quote=FALSE)


##### totontepec lines
toton <- read.table("data/BennettSNPs_FINAL.txt", header=TRUE)
toton <- apply(toton, 2, as.character)
toton[toton=="--"] <- "NN"
toton <- as.data.frame(toton)