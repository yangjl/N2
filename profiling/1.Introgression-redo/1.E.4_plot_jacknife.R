### Jinliang Yang
### Plot Jacknife results

###########
jn <- read.csv("cache/jacknife_fdr.csv")
snpinfo <- read.csv("cache/introgression_toton34.csv")



info2 <- merge(snpinfo[, c("snpid", "chr", "genetic", "physical", "mex", "maize")], jn[, c("snpid", "mex")], by="snpid")
info2$mex <- info2$mex.x - info2$mex.y
info2[info2$mex < 0, ]$mex <- 0
info2$maize <- 1 - info2$mex
info2 <- info2[order(info2$chr, info2$physical),]






pdf("graphs/intro_jacknife.pdf", height=3, width=10)
par(mfrow=c(1, 1))
for(i in 1:10){
    tem <- subset(info2, chr == i)
    tab <- t(tem[, c("mex", "maize")])
    #barplot()
    barplot(tab, xlab="", xaxt="n", col=c("maroon","gold"), border=NA, space = 0)
}
dev.off()




