### Jinliang Yang
### Jan 29th, 2015
### purpose: get assignment probility

assignone <- function(snpfq=snpfq, geno=geno, nmarker=nmarker){
    ###geno contains: snpid, haplotypes
    snpfq$a1 <- "N"
    snpfq$a2 <- "N"
    geno <- merge(snpfq, geno, by="snpid")
    
    res <- data.frame()
    for(i in 16:ncol(geno)){
        geno$a1 <- gsub(".$", "", geno[, i])
        geno$a2 <- gsub("^.", "", geno[, i])
        
        ### removing alleles with missing data
        geno <- subset(geno, a1 != "N" | a2 !="N")
        geno <- geno[order(geno$diff, decreasing=TRUE),]
        geno <- geno[1:nmarker, ]
        
        ### log10 likelihood for population one
        frq1 <- subset(geno, minor == a1 & minor == a2 )$maf1
        p1_p2 <- sum(log10( frq1*frq1 ))
        frq12 <- subset(geno, (minor == a1 & minor != a2) | (minor != a1 & minor == a2))$maf1
        p1_2pq <- sum(log10( 2*frq12*(1-frq12) ))
        frq2 <- subset(geno, minor != a1 & minor != a2)$maf1
        p1_q2 <- sum(log10( (1-frq2)*(1-frq2)  ))
        pop1 <- p1_p2 + p1_2pq + p1_q2
        
        ### log10 likelihood for population two
        frq3 <- subset(geno, minor == a1 & minor == a2 )$maf2
        p2_p2 <- sum(log10( frq3*frq3 ))
        frq34 <- subset(geno, (minor == a1 & minor != a2) | (minor != a1 & minor == a2))$maf2
        p2_2pq <- sum(log10( 2*frq34*(1-frq34) ))
        frq4 <- subset(geno, minor != a1 & minor != a2)$maf2
        p2_q2 <- sum(log10( (1-frq4)*(1-frq4)  ))
        pop2 <- p2_p2 + p2_2pq + p2_q2
        
        tem <- data.frame(plant=names(geno)[i], nSNP=nrow(geno), P1=pop1, P2=pop2)
    }
    
    res <- rbind(res, tem)
    return(res)
    
}

########################
assignp <- function(frqfile="largedata/assignprb/usgbs_tot50k_5619.snpfrq", 
                    geno=geno,
                    nmarker=100, binsize=1000000, missingrate=0.5){
    
    ### read in the data
    snpfq0 <- read.table(frqfile, header=TRUE)
    if(sum(snpfq0$maf1 == 0) > 0){
        snpfq0[snpfq0$maf1==0,]$maf1 <- 0.001
    }
    if(sum(snpfq0$maf1 == 1)){
        snpfq0[snpfq0$maf1==1,]$maf1 <- 0.999
    }
    if(sum(snpfq0$maf2 == 0)){
        snpfq0[snpfq0$maf2==0,]$maf2 <- 0.001
    }
    if(sum(snpfq0$maf2 == 1)){
        snpfq0[snpfq0$maf2==1,]$maf2 <- 0.999
    }
    
    snpfq0$diff <- abs(snpfq0$maf1 - snpfq0$maf2)
    
    ### snp filtering based on missingrate
    snpfq <- subset(snpfq0, missing1 <= missingrate & missing2 <= missingrate)
    message(sprintf("###>>> [ %s ] SNPs loaded, [ %s ] remaining after filtering [ missingrate=%s ]!", 
                    nrow(snpfq0), nrow(snpfq), missingrate))
    
    ### snp filtering based on binsize
    snpfq$bin <- paste(snpfq$chr, round(snpfq$pos/binsize, 0), sep="_")
    snpfq <- snpfq[order(snpfq$diff, decreasing=TRUE),]
    snpfq <- snpfq[!duplicated(snpfq$bin),]
    message(sprintf("###>>> [ %s ] unique [ binsize=%s ] bins!", 
                    nrow(snpfq), binsize))
    
    ### select top markers for assignment!
    ### select n markers
    #if(nrow(snpfq) > nmarker){
    #    snpfq <- snpfq[1:nmarker, ]
    #}else{
    #    message(sprintf("Non-duplicated markers [%s] less than selected [%s]", nrow(snpfq), nmarker))
    #}
    
    ### start to assign probability for selected ind for each plant
    resp <- assignone(snpfq=snpfq, geno=geno, nmarker=nmarker)
    return(resp)
}

