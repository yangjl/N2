# Jinliang Yang
# 1.5.2014
# run slurm codes for fastPHASE

source("lib/setUpslurm.R")

### hap phasing mexicana
setUpslurm(slurmsh="largedata/fphase/mex_fp_slurm.sh",
           oneline=TRUE,
           codesh="fastPHASE -oMex -S1234 largedata/fphase/mex_120.fp",
           wd=NULL,
           sbatho="/home/jolyang/Documents/Github/Introgression/slurm-log/testout-%j.txt",
           sbathe="/home/jolyang/Documents/Github/Introgression/slurm-log/error-%j.txt",
           sbathJ="mex_fp")

### hap phasing Parviglumis (N=130)
setUpslurm(slurmsh="largedata/fphase/parv_fp_slurm.sh",
           oneline=TRUE,
           codesh="fastPHASE -oParv -S1234 largedata/fphase/parv_130.fp",
           wd=NULL,
           sbatho="/home/jolyang/Documents/Github/Introgression/slurm-log/testout-%j.txt",
           sbathe="/home/jolyang/Documents/Github/Introgression/slurm-log/error-%j.txt",
           sbathJ="parv_fp")

### hap phasing Landraces (N=94)
setUpslurm(slurmsh="largedata/fphase/land_fp_slurm.sh",
           oneline=TRUE,
           codesh="fastPHASE -oLand -S1234 largedata/fphase/land_94.fp",
           wd=NULL,
           sbatho="/home/jolyang/Documents/Github/Introgression/slurm-log/testout-%j.txt",
           sbathe="/home/jolyang/Documents/Github/Introgression/slurm-log/error-%j.txt",
           sbathJ="land_fp")


