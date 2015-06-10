# Jinliang Yang
# 1.21.2015
# purpose: format the output from fastPHASE to HAPMIX

source("lib/fp2HapMix.R")
####


for(chri in 1:10){
    fp <- read_fastphase(fileName = paste0("largedata/fphase/hmp2_land_23_chr", chri, "_hapguess_switch.out"), chrnum= chri)
    out <- traslate2hapmix(fp = fp, startcol=8, outfile= paste0("largedata/hapmixrun/maizeland23_chr", chri, ".out"),
                           outinfo= paste0("largedata/hapmixrun/snp_maize_chr", chri, ".info"))
    
    
    Mex <- read_fastphase(fileName = paste0("largedata/fphase/mex_120_chr", chri, "_hapguess_switch.out"), chrnum= chri)
    out2 <- traslate2hapmix(fp = Mex, startcol=8, outfile= paste0("largedata/hapmixrun/mex120_chr", chri, ".out"),
                            outinfo= paste0("largedata/hapmixrun/snp_mex_chr", chri, ".info"))
    
    
}


snp1 <- read.table("largedata/snp_maize.info", header=FALSE)
snp2 <- read.table("largedata/snp_mex.info", header=FALSE)


