# Jinliang Yang
# 6/5/2015
# run the jacknife approach

source("lib/hapmixPar.R")
###### run in the linux
source("~/Documents/Github/zmSNPtools/Rcodes/setUpslurm.R")
run_jacknife <- function(gens=1:10, inds=1:23, pwd="largedata/hapmixrun", 
                         slurmsh_name="slurm-scripts/run_hapmix.sh"){
    outsh <- paste0("cd ", pwd)
    for(geni in gens){
        for(ind in inds){
            for(chri in 1:10){
                parfileid <- paste0("jnrun_","gen", geni,"_l",ind, "_chr", chri, ".par")
                jacknifePar(lambda=geni, jn=ind, parfile= parfileid, 
                          ref1geno= paste0("mex12_chr", chri, ".out"), ref2geno= paste0("land_l", ind, "_chr", chri, ".out"), 
                          ref1snp= paste0("snp_mex_chr", chri, ".info"), ref2snp= paste0("land_l", ind, "_chr", chri, ".info"),
                          admixsnp= paste0("jn_l", ind, "_chr", chri, ".snpinfo"), 
                          admixgeno= paste0("jn_l", ind, "_chr", chri, ".out"), 
                          admixind= paste0("jn_l", ind, "_chr", chri, ".ind"), 
                          ref1label="MEX", ref2label="MZ",
                          rates= paste0("jn_l", ind, "_chr", chri, ".rate"), admixlabel="MZJN", 
                          chr= chri, outdir= "HPOUT", pwd=pwd,
                          mode="LOCAL_ANC") 
                
                temsh <- paste0("perl bin/runHapmix.pl ", parfileid)
                outsh <- c(outsh, temsh)
            }
        }
        
    }
    #### setup the slurmsh
    jobid <- gsub(".*/", "", slurmsh_name)
    setUpslurm(slurmsh=slurmsh_name,
               codesh= outsh,
               wd=NULL, jobid=jobid, email="yangjl0930@gmail.com")
}

##########################################
run_jacknife(gens=1610, inds=2:23, pwd="largedata/hapmixjack", slurmsh_name="slurm-scripts/run_jacknife.sh")
###>>> In this path: cd /home/jolyang/Documents/Github/N2
###>>> [ note: --ntasks=INT, number of cup ]
###>>> [ note: --mem=16000, 16G memory ]
###>>> RUN: sbatch -p bigmemh --ntasks=1 slurm-scripts/run_hapmix.sh
