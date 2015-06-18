# Jinliang Yang
# 1.21.2015
# purpose: format the output from fastPHASE to HAPMIX

source("lib/fp2HapMix.R")
####
convert()

###########################################################################################
convert <- function(){
    for(chri in 1:10){
        Land <- read_fastphase(fileName = paste0("largedata/fphase/land23_chr", chri, "_hapguess_switch.out"), chrnum= chri)
        
        res <- checking(frq=Land)
        if(nrow(res) > 0){
            message(sprintf("!!! ERROR !!!"))
        }else{
            out <- traslate2hapmix(fp = Land, startcol=8, outfile= paste0("largedata/hapmixrun/maizeland23_chr", chri, ".out"),
                                   outinfo= paste0("largedata/hapmixrun/snp_maize_chr", chri, ".info"))
        }
        
        Mex <- read_fastphase(fileName = paste0("largedata/fphase/mex12_chr", chri, "_hapguess_switch.out"), chrnum= chri)
        res2 <- checking(frq=Mex)
        if(nrow(res2) > 0){
            message(sprintf("!!! ERROR !!!"))
        }else{
            out2 <- traslate2hapmix(fp = Mex, startcol=8, outfile= paste0("largedata/hapmixrun/mex12_chr", chri, ".out"),
                                    outinfo= paste0("largedata/hapmixrun/snp_mex_chr", chri, ".info")) 
        }
    }
}


checking <- function(frq=Land){
    frq$genetic <- 0
    frq$genetic <- sapply(1:nrow(frq), 
                        function(i =1){
                            tab <- table(t(frq[i, 6:ncol(frq)]))
                            return(length(tab))
                        })
    return(subset(frq, genetic > 2) ) 
}


