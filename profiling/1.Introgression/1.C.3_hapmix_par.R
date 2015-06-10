### Jinliang Yang
### March 31, 2015
### Run HAPMIX

source("lib/hapmixPar.R")
###### run in the linux
source("~/Documents/Github/zmSNPtools/Rcodes/setUpslurm.R")
run_hapmix <- function(gen=1:10, slurmsh_name="slurm-scripts/run_hapmix.sh"){
    outsh <- "cd largedata/hapmixrun"
    for(geni in gen){
        
        for(chri in 1:10){
            parfileid <- paste0("hprun_","gen", geni, "_chr", chri, ".par")
            hapmixPar(lambda=geni, parfile= parfileid, 
                      ref1geno= paste0("mex120_chr", chri, ".out"), ref2geno= paste0("maizeland23_chr", chri, ".out"), 
                      ref1snp= paste0("snp_mex_chr", chri, ".info"), ref2snp= paste0("snp_maize_chr", chri, ".info"),
                      admixsnp= paste0("toton_chr", chri, ".snpinfo"), admixgeno= paste0("toton_chr", chri, ".out"), 
                      admixind= paste0("toton_chr", chri, ".ind"), 
                      ref1label="MEX", ref2label="MZ",
                      rates= paste0("toton_chr", chri, ".rate"), admixlabel="TOTON", 
                      chr= chri, outdir= "HPOUT", pwd="largedata/hapmixrun",
                      mode="LOCAL_ANC") 
            
            temsh <- paste0("perl bin/runHapmix.pl ", parfileid)
            outsh <- c(outsh, temsh)
        }
    }
    #### setup the slurmsh
    jobid <- gsub(".*/", "", slurmsh_name)
    setUpslurm(slurmsh=slurmsh_name,
               codesh= outsh,
               wd=NULL, jobid=jobid, email="yangjl0930@gmail.com")
}

#perl bin/runHapmix.pl hprun1_chr10.par
generation <- 100
run_hapmix(gen=generation, slurmsh_name="slurm-scripts/run_hapmix.sh")
###>>> In this path: cd /home/jolyang/Documents/Github/N2
###>>> [ note: --ntasks=INT, number of cup ]
###>>> [ note: --mem=16000, 16G memory ]
###>>> RUN: sbatch -p bigmemh --ntasks=1 slurm-scripts/run_hapmix.sh


#perl bin/runHapmix.pl hprun1_chr10.par
generation <- seq(100, 5000, by=100)
run_hapmix(gen=generation[c(10, 2:9, 11:25)], slurmsh_name="slurm-scripts/run_hapmix100-2500.sh")
run_hapmix(gen=generation[26:50], slurmsh_name="slurm-scripts/run_hapmix2500-5000.sh")

###>>> In this path: cd /home/jolyang/Documents/Github/N2
###>>> [ note: --ntasks=INT, number of cup ]
###>>> [ note: --mem=16000, 16G memory ]
###>>> RUN: sbatch -p bigmemh --ntasks=2 slurm-scripts/run_hapmix.sh
gen2 <- seq(2, 99, by=2)
run_hapmix(gen=gen2[c(5, 1:4, 6:25)], slurmsh_name="slurm-scripts/run_hapmix2-50.sh")
run_hapmix(gen=gen2[26:49], slurmsh_name="slurm-scripts/run_hapmix52-98.sh")
###>>> RUN: sbatch -p bigmemh --ntasks=1 slurm-scripts/run_hapmix2-50.sh
###>>> RUN: sbatch -p bigmemh --ntasks=1 slurm-scripts/run_hapmix52-98.sh




