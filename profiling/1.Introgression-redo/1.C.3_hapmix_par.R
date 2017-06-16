### Jinliang Yang
### March 31, 2015
### Run HAPMIX

source("lib/hapmixPar.R")
###### run in the linux
source("~/Documents/Github/zmSNPtools/Rcodes/setUpslurm.R")
run_hapmix <- function(gen=1:10, pwd="largedata/hapmixrun", slurmsh_name="slurm-scripts/run_hapmix.sh"){
    outsh <- paste0("cd ", pwd)
    for(geni in gen){
        
        for(chri in 1:10){
            parfileid <- paste0("hprun_","gen", geni, "_chr", chri, ".par")
            hapmixPar(lambda=geni, parfile= parfileid, 
                      ref1geno= paste0("mex12_chr", chri, ".out"), ref2geno= paste0("maizeland23_chr", chri, ".out"), 
                      ref1snp= paste0("snp_mex_chr", chri, ".info"), ref2snp= paste0("snp_maize_chr", chri, ".info"),
                      admixsnp= paste0("toton_chr", chri, ".snpinfo"), admixgeno= paste0("toton_chr", chri, ".out"), 
                      admixind= paste0("toton_chr", chri, ".ind"), 
                      ref1label="MEX", ref2label="MZ",
                      rates= paste0("toton_chr", chri, ".rate"), admixlabel="TOTON", 
                      chr= chri, outdir= "HPOUT", pwd=pwd,
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

##########################################
run_hapmix(gen=1610, pwd="largedata/hapmixrun", slurmsh_name="slurm-scripts/run_hapmix.sh")
###>>> In this path: cd /home/jolyang/Documents/Github/N2
###>>> [ note: --ntasks=INT, number of cup ]
###>>> [ note: --mem=16000, 16G memory ]
###>>> RUN: sbatch -p bigmemh --ntasks=1 slurm-scripts/run_hapmix.sh


#perl bin/runHapmix.pl hprun1_chr10.par
gen <- seq(10, 5000, by=10)
run_hapmix(gen=gen[1:50], pwd="largedata/hapmixrun1", slurmsh_name="slurm-scripts/run_hapmix1.sh")
run_hapmix(gen=gen[51:100], pwd="largedata/hapmixrun2", slurmsh_name="slurm-scripts/run_hapmix2.sh")
run_hapmix(gen=gen[101:150], pwd="largedata/hapmixrun3", slurmsh_name="slurm-scripts/run_hapmix3.sh")
run_hapmix(gen=gen[151:200], pwd="largedata/hapmixrun4", slurmsh_name="slurm-scripts/run_hapmix4.sh")
run_hapmix(gen=gen[201:250], pwd="largedata/hapmixrun5", slurmsh_name="slurm-scripts/run_hapmix5.sh")
run_hapmix(gen=gen[251:300], pwd="largedata/hapmixrun6", slurmsh_name="slurm-scripts/run_hapmix6.sh")
run_hapmix(gen=gen[301:350], pwd="largedata/hapmixrun7", slurmsh_name="slurm-scripts/run_hapmix7.sh")
run_hapmix(gen=gen[351:400], pwd="largedata/hapmixrun8", slurmsh_name="slurm-scripts/run_hapmix8.sh")
run_hapmix(gen=gen[401:450], pwd="largedata/hapmixrun9", slurmsh_name="slurm-scripts/run_hapmix9.sh")
run_hapmix(gen=gen[451:500], pwd="largedata/hapmixrun10", slurmsh_name="slurm-scripts/run_hapmix10.sh")

