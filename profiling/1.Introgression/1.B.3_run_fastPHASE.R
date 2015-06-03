# Jinliang Yang
# 1.5.2014
# run slurm codes for fastPHASE

source("lib/setUpslurm.R")

getshell <- function(basestring="parv_130_chr"){
    mysh <- c()
    for(i in 1:10){
        myinp <- paste0("fastPHASE -o", basestring, i, " -S1234 largedata/fphase/", basestring, i)
        mysh <- c(mysh, myinp)
    }
    return(mysh)
}



##############################
sh1 <- getshell(basestring="mex_120_chr")
### hap phasing mexicana
setUpslurm(slurmsh="largedata/fphase/mex_fp_slurm.sh",
           oneline=TRUE,
           codesh= sh1,
           wd=NULL,
           sbatho="/home/jolyang/Documents/Github/N2/slurm-log/testout-%j.txt",
           sbathe="/home/jolyang/Documents/Github/N2/slurm-log/error-%j.txt",
           sbathJ="mex_fp_bychr")
#sbatch -p bigmemh largedata/fphase/mex_fp_slurm.sh

### hap phasing Parviglumis (N=130)
sh2 <- getshell(basestring="parv_130_chr")
setUpslurm(slurmsh="largedata/fphase/parv_fp_slurm.sh",
           oneline=TRUE,
           codesh=sh2,
           wd=NULL,
           sbatho="/home/jolyang/Documents/Github/N2/slurm-log/testout-%j.txt",
           sbathe="/home/jolyang/Documents/Github/N2/slurm-log/error-%j.txt",
           sbathJ="parv_fp_bychr")
#sbatch -p bigmemh largedata/fphase/parv_fp_slurm.sh

### hap phasing Landraces (N=94)
sh3 <- getshell(basestring="hmp2_land_23_chr")
setUpslurm(slurmsh="largedata/fphase/land_fp_slurm.sh",
           oneline=TRUE,
           codesh=sh3,
           wd=NULL,
           sbatho="/home/jolyang/Documents/Github/N2/slurm-log/testout-%j.txt",
           sbathe="/home/jolyang/Documents/Github/N2/slurm-log/error-%j.txt",
           sbathJ="hmp2_fp_bychr")
# sbatch -p bigmemh largedata/fphase/land_fp_slurm.sh

