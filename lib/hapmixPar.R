# lambda average number of generations since admixture

hapmixPar <- function(lambda=6.0, parfile="test_chr10.par", ref1geno="maizeland94.out", 
                      ref2geno="mex120.out", ref1snp="snp_maize.info", ref2snp="snp_mex.info",
                      admixsnp="toton_chr10.snpinfo", admixgeno="toton_chr10.out", admixind="toton_chr10.ind", 
                      ref1label="MZ", ref2label="MEX", 
                      rates="toton_chr10.rate", admixlabel="TOTON", 
                      chr=10, outdir="TestOut", pwd="largedata/path",
                      mode="LOCAL_ANC"){
    
    wd <- getwd()
    setwd(pwd)
    outdir <- paste0(outdir, lambda)
    dir.create(outdir, showWarnings = FALSE)
    cat("GENOTYPE:1",
        "OUTPUT_SITES:0",
        "SITE_POSITIONS: 1 1000000000",
        "THETA:0.2",
        paste0("LAMBDA:", lambda),
        "RECOMBINATION_VALS:900 900",
        "MUTATION_VALS:0.2 0.2 0.01",
        "MISCOPYING_VALS:0.05 0.05",
        
        paste0("REFPOP1GENOFILE:", ref1geno),
        paste0("REFPOP2GENOFILE:", ref2geno),
        paste0("REFPOP1SNPFILE:", ref1snp),
        paste0("REFPOP2SNPFILE:", ref2snp),
        paste0("ADMIXSNPFILE:", admixsnp),
        paste0("ADMIXGENOFILE:",admixgeno),
        paste0("ADMIXINDFILE:",admixind),
        paste0("REF1LABEL:", ref1label),
        paste0("REF2LABEL:", ref2label),
        paste0("RATESFILE: ", rates),
        paste0("ADMIXPOP: ", admixlabel),
        paste0("CHR:", chr),
        paste0("OUTDIR:", outdir),
        paste0("HAPMIX_MODE:", mode),
        "OUTPUT_DETAILS:PROB",
        "THRESHOLD:0.0",
        "KEEPINTFILES:0",
        
        file=parfile, sep="\n", append=FALSE)
    setwd(wd)
}

jacknifePar <- function(lambda=6.0, jn=1, parfile="test_chr10.par", ref1geno="maizeland94.out", 
                      ref2geno="mex120.out", ref1snp="snp_maize.info", ref2snp="snp_mex.info",
                      admixsnp="toton_chr10.snpinfo", admixgeno="toton_chr10.out", admixind="toton_chr10.ind", 
                      ref1label="MZ", ref2label="MEX", 
                      rates="toton_chr10.rate", admixlabel="TOTON", 
                      chr=10, outdir="TestOut", pwd="largedata/path",
                      mode="LOCAL_ANC"){
    
    wd <- getwd()
    setwd(pwd)
    outdir <- paste0(outdir, lambda, "_", jn)
    dir.create(outdir, showWarnings = FALSE)
    cat("GENOTYPE:1",
        "OUTPUT_SITES:0",
        "SITE_POSITIONS: 1 1000000000",
        "THETA:0.2",
        paste0("LAMBDA:", lambda),
        "RECOMBINATION_VALS:900 900",
        "MUTATION_VALS:0.2 0.2 0.01",
        "MISCOPYING_VALS:0.05 0.05",
        
        paste0("REFPOP1GENOFILE:", ref1geno),
        paste0("REFPOP2GENOFILE:", ref2geno),
        paste0("REFPOP1SNPFILE:", ref1snp),
        paste0("REFPOP2SNPFILE:", ref2snp),
        paste0("ADMIXSNPFILE:", admixsnp),
        paste0("ADMIXGENOFILE:",admixgeno),
        paste0("ADMIXINDFILE:",admixind),
        paste0("REF1LABEL:", ref1label),
        paste0("REF2LABEL:", ref2label),
        paste0("RATESFILE: ", rates),
        paste0("ADMIXPOP: ", admixlabel),
        paste0("CHR:", chr),
        paste0("OUTDIR:", outdir),
        paste0("HAPMIX_MODE:", mode),
        "OUTPUT_DETAILS:PROB",
        "THRESHOLD:0.0",
        "KEEPINTFILES:0",
        
        file=parfile, sep="\n", append=FALSE)
    setwd(wd)
}
