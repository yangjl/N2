# Jinliang Yang
# 1.21.2015
# purpose: format the output from fastPHASE to HAPMIX

source("lib/fp2HapMix.R")
####
fp <- read_fastphase(fileName = "largedata/fphase/land_94_chr10_hapguess_switch.out", chrnum=10)
out <- traslate2hapmix(fp = fp, startcol=8, outfile="largedata/maizeland94.out",
                       outinfo="largedata/snp_maize.info")


Mex <- read_fastphase(fileName = "largedata/fphase/mex_120_chr10_hapguess_switch.out", chrnum=10)
out2 <- traslate2hapmix(fp = Mex, startcol=8, outfile="largedata/mex120.out",
                       outinfo="largedata/snp_mex.info")


snp1 <- read.table("largedata/snp_maize.info", header=FALSE)
snp2 <- read.table("largedata/snp_mex.info", header=FALSE)


