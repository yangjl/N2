# Jinliang Yang
# 1.5.2014
# run slurm codes for fastPHASE


source("~/Documents/Github/zmSNPtools/Rcodes/setUpslurm.R")
run_fastPHASE <- function(basestring="parv_130_chr"){
    
    dir="largedata/fphase/"
    outsh <- c(paste("cd", dir))
    for(i in 1:10){
        myinp <- paste0("fastPHASE -o", basestring, i, " -S1234 ", basestring, i)
        outsh <- c(outsh, myinp)
    }
    
    setUpslurm(slurmsh= paste0("slurm-scripts/run_",basestring,".sh"),
               codesh= outsh,
               wd=NULL, jobid=basestring, email="yangjl0930@gmail.com")
}

##############################
run_fastPHASE(basestring="land23_chr")
###>>> In this path: cd /home/jolyang/Documents/Github/N2
###>>> [ note: --ntasks=INT, number of cup ]
###>>> [ note: --mem=16000, 16G memory ]
###>>> RUN: sbatch -p bigmemh --ntasks=1 slurm-scripts/run_land23_chr.sh

run_fastPHASE(basestring="mex12_chr")


