### Jinliang Yang
### translate the mex and hapmap2 SNP from top/bot to ref/alt format

source("lib/translate_top2ref.R")

mex <- translate_top2ref(infile = "data/Mexicana_TopStrand_FinalReport.txt", ob=FALSE, mergeid="id", 
                         colfrom="RIMME0021.C1.1.1", colto="RIMME0029.14")

names(mex)[1] <- "id"
write.table(mex[, c(1,12:131)], "data/Mexicanna_ref_alt.txt", sep="\t", row.names=FALSE, quote=FALSE)

### Note: hmp2 is ref/alt coding
#hmp2 <- read.delim("data/Hapmapv2_lines_55Kdata.txt", header=TRUE)
#hmp2 <- translate_top2ref(infile = hmp2, ob=TRUE, mergeid="assayLSID", 
#                         colfrom="BKN009.MZ", colto="BKN040.MZ")


