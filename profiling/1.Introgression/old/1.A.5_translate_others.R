### Jinliang Yang
### translate the mex and hapmap2 SNP from top/bot to ref/alt format

source("lib/translate_top2ref.R")

allmex <- read.table("data/Mexicana_TopStrand_FinalReport.txt", header=TRUE)
idx <- grep("^RIMME0033", names(allmex))
allop <- allmex[, c(1, idx)]

mex <- translate_top2ref(infile = allop, ob=TRUE, mergeid="id", 
                         colfrom="RIMME0033.1", colto="RIMME0033.13")

names(mex)[1] <- "id"
write.table(mex[, c(1,12:23)], "data/Mexicanna_RIMME0033_ref_alt.txt", sep="\t", row.names=FALSE, quote=FALSE)

### Note: hmp2 is ref/alt coding
#hmp2 <- read.delim("data/Hapmapv2_lines_55Kdata.txt", header=TRUE)
#hmp2 <- translate_top2ref(infile = hmp2, ob=TRUE, mergeid="assayLSID", 
#                         colfrom="BKN009.MZ", colto="BKN040.MZ")


