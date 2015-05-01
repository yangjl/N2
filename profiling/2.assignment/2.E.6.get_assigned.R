### Jinliang Yang
### April. 4th, 2015
### purpose: assign probability and plot the results

source("lib/assignment.R")
res1 <- assignp(frqfile="largedata/SeeDs/Toton_unimputed_mr6_fpsnp.txt", N=1000,
               binsize=1000000, missingrate=0.5)
###>>> [ 322723 ] SNPs loaded, [ 249549 ] remaining after filtering [ missingrate=0.5 ]!
###>>> [ 2068 ] unique [ binsize=1e+06 ] bins!
write.table(res1, "cache/toton_ames_2068.csv", sep=",", row.names=FALSE, quote=FALSE)

res2 <- assignp(frqfile="largedata/SeeDs/seeds_unimputed_mr6_fpsnp.txt", N=1000,
                binsize=1000000, missingrate=0.5)
###>>> [ 455738 ] SNPs loaded, [ 324940 ] remaining after filtering [ missingrate=0.5 ]!
###>>> [ 2067 ] unique [ binsize=1e+06 ] bins!
write.table(res2, "cache/toton_SeeDs_2068.csv", sep=",", row.names=FALSE, quote=FALSE)

res3 <- assignp(frqfile="largedata/SeeDs/SeeDs-toton_unimputed_mr6_ames_fpsnp.txt", N=1000,
                binsize=1000000, missingrate=0.5)
###>>> [ 323920 ] SNPs loaded, [ 241821 ] remaining after filtering [ missingrate=0.5 ]!
###>>> [ 2067 ] unique [ binsize=1e+06 ] bins!
write.table(res3, "cache/SeeDs-toton_ames_2068.csv", sep=",", row.names=FALSE, quote=FALSE)



##################################################
## assign for totontepec


###

run_assignp_nmarker <- function(question_geno=geno, frqtable=frq){
    myres <- data.frame()
    for(n in seq(from=10, to=100, by=10)){
        message(sprintf("###>>> running [ %s ] SNPs for all plants ...", n))
        for(planti in 4:14){
            mygeno <- question_geno[, c(1, planti)]
            resp <- assignone(snpfq=frqtable, geno=mygeno, nmarker= n)
            myres <- rbind(myres, resp)
            
        }  
    }
    #### res summary
    #myres <- subset(myres, P1 !=0 & P2 != 0)
    myres$rate <- -log10(10^myres$P1/10^myres$P2)
    return(myres)
}


totgeno <- read.table("largedata/SeeDs/Toton_geno_only.txt", header=TRUE)
myres1 <- run_assignp_nmarker(question_geno=totgeno, frqtable=res1)
#myres2 <- run_assignp_nmarker(assign_geno=maize)


save(list=c(), file="cache/likelihood.R")

##################


myres <- myres1
#myres <- subset(myres, plant != "P11" & plant != "P12")

p <- ggplot(myres, aes(x=nSNP, y=rate)) + 
    geom_point(aes(colour = plant), cex=2, shape = 3) +    # Use hollow circles
    stat_smooth(method=loess, level=0.999, cex=1.3)   # Add linear regression line 
p <- p + theme_bw()
#  (by default includes 95% confidence region)
p <- p + ggtitle("Totontepec Lines") +
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


