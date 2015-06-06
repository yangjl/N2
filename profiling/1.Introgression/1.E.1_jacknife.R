# Jinliang Yang
# 6/5/2015
# develop a jackknife samples to rule out the possibility due to false positives

source("lib/fp2HapMix.R")
#### leave one maize out!
for(chri in 1:10){
    fp <- read_fastphase(fileName = paste0("largedata/fphase/hmp2_land_23_chr", chri, "_hapguess_switch.out"), chrnum= chri)
    
    for(l in 1:23){
        idx <- c((l - 1)*2 + 8, (l - 1)*2 + 9)
        fptmp <- fp[, -idx] 
        out <- traslate2hapmix(fp = fptmp, startcol=8, 
                               outfile= paste0("largedata/hapmixrun/maizeland_l", l, "_chr", chri, ".out"),
                               outinfo= paste0("largedata/hapmixrun/snp_maize_jack_chr", chri, ".info") 
                               )
    }
}
