### Jinliang Yang
### 04-20-2017
### chr plot of the avg RS in bins


#######################
chrplot <- function(tab, val, bin=1, cutoff, cols = rep(c("slateblue", "cyan4"), 5), ...){
    # tab: [data.frame]: chr, pos, a value [chr] to  plot
    # val, [chr]: the value to plot, must range from 0 - 10
    
    tab <- tab[order(tab$chr, tab$pos), ]
    #### read chr length
    cl <- read.table("data/ZmB73_RefGen_v2.length", header=FALSE)
    names(cl) <- c("chrom", "BP")
    plot(c(0, max(cl$BP/bin)), c(10,110), type="n", 
         ylab="", yaxt="n", bty="n", ...)
    
    axis(side=2, tick =FALSE, las=1, at=c(105, 95, 85, 75, 65, 55, 45, 35, 25, 15), 
         labels=paste("Chr", 1:10, sep=""))
    #### chromosome
    for (i in 1:10){
        lines(c(0, cl[i,]$BP/bin), c(105-10*(i-1), 105-10*(i-1)), lwd=2, col="grey")
    }
    ### core plot
    for (chri in 1:10){
        mytab1 <- subset(tab, chr == chri & tab[, val] < cutoff)
        points(mytab1$pos, 105 - 10*(chri-1) + mytab1[, val], pch=19, cex=0.4, col=cols[1])
        
        mytab2 <- subset(tab, chr == chri & tab[, val] >= cutoff)
        if(nrow(mytab2) > 0){
            points(mytab2$pos, 105 - 10*(chri-1) + mytab2[, val], pch=19, cex=0.4, col=cols[2])
        }
    }
    ### centromere
    cent <- read.csv("data/centromere_AGPv2.csv")
    cent$start <- cent$start*1000000/bin
    cent$end <- cent$end*1000000/bin
    
    for (chri in 1:10){
        subc <- subset(cent, chr == chri)
        rect(xleft=subc$start, ybottom= 115 - 10*chri, xright=subc$end, ytop=109 - 10*(chri-1),
             border="red")
    } 
    
    
    for (i in 1:10){
        lines(c(0, cl[i,]$BP/bin), c(105-10*(i-1)+ cutoff, 105-10*(i-1)+ cutoff), lwd=1, lty=2, col="red")
    } 
}

#### Read in data
jn <- read.csv("cache/jacknife_fdr.csv")
snpinfo <- read.csv("cache/introgression_toton34.csv")

info2 <- merge(snpinfo[, c("snpid", "chr", "genetic", "physical", "mex", "maize")], jn[, c("snpid", "mex")], by="snpid")
info2$mex <- info2$mex.x - info2$mex.y
info2[info2$mex < 0, ]$mex <- 0
info2$maize <- 1 - info2$mex
info2 <- info2[order(info2$chr, info2$physical),]

names(info2)[4] <- "pos"

mean(info2$mex)
sd(info2$mex)


info2$mex <- 10*info2$mex

##############

library(plyr)

BINSIZE = 10000
info3 <- info2
info3$pos <- round(info3$pos/BINSIZE, 0)
info3$bid <- paste(info3$chr, info3$pos, sep="_")


tab <- ddply(info3, .(bid, chr, pos), summarise,
             mex = mean(mex, na.rm=TRUE))

out <- subset(tab, mex > 2)
out$pos <- out$pos * BINSIZE
write.table(out, "graphs/table_introgress_regions_10kb.csv", sep=",", row.names =FALSE, quote=FALSE)

chrplot(tab=tab, val="mex", bin=BINSIZE, cutoff=2, cols = rep(c("slateblue", "cyan4"), 5))

pdf("graphs/int_res_chrplot.pdf", width=10, height=6)
chrplot(tab=tab, val="mex", bin=BINSIZE, cutoff=2, cols = c("grey", "cyan4"), 
        xlab="Chromosome Position (10-kb)")
dev.off()

###### find continuous regions
get_regions <- function(df=info2, cutoff= 0.2, snpno=1){
    df <- df[order(df$chr, df$pos),]
    df$idx <- 1:nrow(df)
    
    sub <- subset(df, mex > cutoff)
    sub$chunk <- 1
    
    chunkid <- 1
    for(i in 2:nrow(sub)){
        if(sub$idx[i] - snpno <= sub$idx[i -1] & sub$chr[i] == sub$chr[i -1]){
            sub$chunk[i] <- chunkid
        }else{
            chunkid <- chunkid + 1
            sub$chunk[i] <- chunkid
            
        }
    }
    
    ####
    myout <- data.frame()
    for(ci in 1:max(sub$chunk)){
        out <- subset(sub, chunk == ci)
        if(nrow(out) > 1){
            tem <- data.frame(chr=mean(out$chr), start=min(out$pos), start_snpid=out$snpid[1],
                              end=max(out$pos), end_snpid=out$snpid[nrow(out)], mex=mean(out$mex),
                              nsnp=nrow(out))
            myout <- rbind(myout, tem)
        }
        
    }
    myout$dis <- myout$end - myout$start
    return(myout)
}

#####
out0 <- get_regions(df=info2, cutoff= 0.2, snpno=1)

   
write.table(out0, "graphs/introgression_regions.csv", sep=",", row.names=FALSE, quote=FALSE)    

sub <- subset(out0, dis > 1000000) 

    