### Jinliang Yang
### April. 4th, 2015
### purpose: assign probability and plot the results

source("lib/assignment.R")
#library("dplyr")
##################################################
## assign for totontepec

run_assignp_nmarker <- function(assign_geno=geno, frq=frq){
    myres <- data.frame()
    for(n in 10:100){
        for(i in 2:ncol(assign_geno)){
            mygeno <- assign_geno[, c(1, i)]
            res <- assignp(frqfile=frq, N=1000,
                           geno=mygeno, nmarker=n, binsize=1000000, missingrate=0.5)
            myres <- rbind(myres, res)
            
        }
    }
    #### res summary
    #myres <- subset(myres, P1 !=0 & P2 != 0)
    myres$rate <- -log10(10^myres$P1/10^myres$P2)
    return(myres)
}


###
totgeno <- read.table("largedata/SeeDs/Toton_geno_only.txt", header=TRUE)

myres1 <- run_assignp_nmarker(assign_geno=totgeno, frq="largedata/SeeDs/Toton_unimputed_mr6_fpsnp.txt")
myres2 <- run_assignp_nmarker(assign_geno=maize)

plot(myres$nSNP, myres$rate,
     xlab="Number of SNPs", ylab="-log10(L1/L2)", cex.lab=1.3, col="darkblue")
points(myres2$nSNP, myres2$rate, cex.lab=1.3, col="red")

myres$rate <- log10(10^myres$P2/10^myres$P1)
myres2$rate <- log10(10^myres2$P2/10^myres2$P1)

par(mfrow=c(1,2))
plot(myres$nSNP, myres$rate, pch=16, main="Simulated Totontepec Lines", 
     xlab="Number of SNPs", ylab="log10(L1/L2)", cex.lab=1.3, col="darkblue")
plot(myres2$nSNP, myres2$rate, cex.lab=1.3, col="red", pch=16, main="Simulated Maize Lines",
     xlab="Number of SNPs", ylab="log10(L1/L2)")



##################


myres <- myres2
#myres <- subset(myres, plant != "P11" & plant != "P12")

p <- ggplot(myres, aes(x=nSNP, y=rate)) + 
    geom_point(aes(colour = plant), cex=2, shape = 3) +    # Use hollow circles
    stat_smooth(method=loess, level=0.999, cex=1.3)   # Add linear regression line 
p <- p + theme_bw()
#  (by default includes 95% confidence region)
p <- p + ggtitle("Simulated Maize Lines") +
     theme(plot.title = element_text(lineheight=3, face="bold", color="black", size=29), 
           legend.position = "none")
p <- p + labs(x="Number of SNPs", y="Log10 (L1 / L2)")
#### change labels
p <- p + theme(axis.title.y = element_text(size = rel(1.5), face="bold", angle = 90), 
               axis.title.x = element_text(size = rel(1.5), face="bold", angle = 00),
               axis.text=element_text(size=15))
p

##################
myres <- subset(myres2, plant != "P11" & plant != "P12")
myres2$plant <- gsub("\\..*", "", myres2$plant)

p <- ggplot(myres, aes(x=nSNP, y=rate)) +
    geom_point(aes(colour = plant), cex=2, shape = 3) +    # Use hollow circles
    stat_smooth(method=loess, level=0.999, cex=1.3)   # Add linear regression line 
p <- p + theme_bw()
#  (by default includes 95% confidence region)
p <- p + ggtitle("Simulated Maize Lines") +
    theme(plot.title = element_text(lineheight=3, face="bold", color="black", size=29))
p <- p + labs(x="Number of SNPs", y="Log10 (L1 / L2)")


p <- p + theme(axis.title.y = element_text(size = rel(1.8), angle = 90))
p <- p + theme(axis.title.x = element_text(size = rel(1.8), angle = 00))
p


