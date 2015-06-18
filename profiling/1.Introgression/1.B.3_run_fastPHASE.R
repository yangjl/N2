# Jinliang Yang
# 1.5.2014
# run slurm codes for fastPHASE


source("~/Documents/Github/zmSNPtools/Rcodes/setUpslurm.R")
run_fastPHASE <- function(basestring="parv_130_chr"){
    
    dir="largedata/fphase/"
    outsh <- c(paste("cd", dir))
    
    myinp <- paste0("fastPHASE -o", basestring, " -S1234 ", basestring)
    outsh <- c(outsh, myinp)

    setUpslurm(slurmsh= paste0("slurm-scripts/run_",basestring,".sh"),
               codesh= outsh,
               wd=NULL, jobid=basestring, email="yangjl0930@gmail.com")
}

##############################
for(i in 1:10){
    run_fastPHASE(basestring=paste0("land23_chr", i))
}

###>>> In this path: cd /home/jolyang/Documents/Github/N2
###>>> [ note: --ntasks=INT, number of cup ]
###>>> [ note: --mem=16000, 16G memory ]
###>>> RUN: sbatch -p serial slurm-scripts/run_land23_chr1.sh

for(i in 1:10){
    run_fastPHASE(basestring=paste0("mex12_chr", i))
}
###>>> In this path: cd /home/jolyang/Documents/Github/N2
###>>> [ note: --ntasks=INT, number of cup ]
###>>> [ note: --mem=16000, 16G memory ]
###>>> RUN: sbatch -p bigmemh slurm-scripts/run_mex12_chr1.sh


