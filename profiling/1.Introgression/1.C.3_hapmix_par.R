### Jinliang Yang
### March 31, 2015
### Run HAPMIX

source("lib/hapmixPar.R")

for(chri in 1:10){
    hapmixPar(parfile= paste0("hprun1_chr", chri, ".par"), 
              ref1geno= paste0("mex120_chr", chri, ".out"), ref2geno= paste0("maizeland94_chr", chri, ".out"), 
              ref1snp= paste0("snp_mex_chr", chri, ".info"), ref2snp= paste0("snp_maize_chr", chri, ".info"),
              admixsnp= paste0("toton_chr", chri, ".snpinfo"), admixgeno= paste0("toton_chr", chri, ".out"), 
              admixind= paste0("toton_chr", chri, ".ind"), 
              ref1label="MEX", ref2label="MZ",
              rates= paste0("toton_chr", chri, ".rate"), admixlabel="TOTON", 
              chr= chri, outdir="HPOUT", pwd="largedata/hapmixrun",
              mode="LOCAL_ANC") 
}


#perl bin/runHapmix.pl hprun1_chr10.par
perl bin/runHapmix.pl hprun1_chr1.par
perl bin/runHapmix.pl hprun1_chr2.par
perl bin/runHapmix.pl hprun1_chr3.par
perl bin/runHapmix.pl hprun1_chr4.par
perl bin/runHapmix.pl hprun1_chr5.par
perl bin/runHapmix.pl hprun1_chr6.par
perl bin/runHapmix.pl hprun1_chr7.par
perl bin/runHapmix.pl hprun1_chr8.par
perl bin/runHapmix.pl hprun1_chr9.par
perl bin/runHapmix.pl hprun1_chr10.par









