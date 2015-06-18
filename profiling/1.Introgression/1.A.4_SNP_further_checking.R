### Jinliang Yang
### June 17th, 2015

#plink --bfile land_snp50k --freq --out land_snp50k
#plink --bfile land_snp50k --missing --out land_snp50k
#plink --bfile toton_snp50k --freq --out toton_snp50k
#plink --bfile toton_snp50k --missing --out toton_snp50k
#plink --bfile mex_snp50k --freq --out mex_snp50k
#plink --bfile mex_snp50k --missing --out mex_snp50k
#plink --bfile all3_snp50k --freq --out all3_snp50k
#plink --bfile all3_snp50k --missing --out all3_snp50k


#### landraces
frq1 <- read.table("largedata/runplink/land_snp50k.frq", header=TRUE)
miss1 <- read.table("largedata/runplink/land_snp50k.imiss", header=TRUE)
miss2 <- read.table("largedata/runplink/land_snp50k.lmiss", header=TRUE)

par(mfrow=c(1,2))
hist(frq1$MAF, main="MAF of landraces (N=23)", xlab="MAF", breaks=30, col="bisque3")
hist(miss2$F_MISS, main="Missing rate of landraces (N=23)", xlab="missing", breaks=30, col="bisque3")

#### mex
frq2 <- read.table("largedata/runplink/mex_snp50k.frq", header=TRUE)
miss1 <- read.table("largedata/runplink/mex_snp50k.imiss", header=TRUE)
miss2 <- read.table("largedata/runplink/mex_snp50k.lmiss", header=TRUE)

par(mfrow=c(1,2))
hist(frq2$MAF, main="MAF of Mexicana (N=12)", xlab="MAF", breaks=30, col="bisque3")
hist(miss2$F_MISS, main="Missing rate of Mexicana (N=12)", xlab="missing", breaks=30, col="bisque3")

#### Toton
frq3 <- read.table("largedata/runplink/toton_snp50k.frq", header=TRUE)
miss1 <- read.table("largedata/runplink/toton_snp50k.imiss", header=TRUE)
miss2 <- read.table("largedata/runplink/toton_snp50k.lmiss", header=TRUE)

par(mfrow=c(1,2))
hist(frq2$MAF, main="MAF of Totontepec (N=12)", xlab="MAF", breaks=30, col="bisque3")
hist(miss2$F_MISS, main="Missing rate of Totontepec (N=12)", xlab="missing", breaks=30, col="bisque3")

#### all3 populations
frq4 <- read.table("largedata/runplink/all3_snp50k.frq", header=TRUE)
miss1 <- read.table("largedata/runplink/all3_snp50k.imiss", header=TRUE)
miss2 <- read.table("largedata/runplink/all3_snp50k.lmiss", header=TRUE)

par(mfrow=c(1,2))
hist(frq4$MAF, main="MAF of Totontepec (N=12)", xlab="MAF", breaks=30, col="bisque3")
hist(miss2$F_MISS, main="Missing rate of Totontepec (N=12)", xlab="missing", breaks=30, col="bisque3")

###########
frq <- merge(frq1[, 1:4], frq2[, c("SNP", "A1", "A2")], by="SNP")
frq <- merge(frq, frq3[, c("SNP", "A1", "A2")], by="SNP")
frq$count <- -9

#############
frq$count <- sapply(1:nrow(frq), 
                 function(i =1){
                     tab <- table(t(df[i, 3:7]))
                     if("0" %in% names(tab)){
                         idx <- which(names(tab) == "0")
                         tab <- tab[-idx]
                     }
                     print(i)
                     return(length(tab))
                 })
    
dim(subset(frq, count > 2) )   
