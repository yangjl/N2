## introgression plot

qtlplot <- function(qtloutput=cwqtl,  gap=1000000, col=c("slateblue", "cyan4"), main="KRN", threshold=6){ 
    #threshold=3,
    
    qtloutput <- subset(qtloutput, Chr!="chr0"&Chr!="chrMt"&Chr!="chrPt");
    qtloutput$Chr <- gsub("chr", "", qtloutput$Chr);
    qtloutput$Chr <- as.numeric(qtloutput$Chr);
    names(qtloutput)[c(2,3)] <- c("CHR", "BP")
    
    qtloutput <- newpos(qtloutput)
    #idx <- grep("Error", qtloutput$pval);
    #qtloutput <- qtloutput[-idx,]
    qtloutput$logp <- -log10(as.numeric(qtloutput$pval))
    
    # the basic plot information:
    # sets colors based on colors argument.
    colors <- rep(col, 5)
    #xscale:
    cl <- read.csv("~/Documents/GWAS2_KRN/plot/chr_length_B73v2.csv")
    cl <- newpos(cl, GAP=gap)
    xmax <- max(cl$pos)
    
    plot(x=-9, y=-9, xlim=c(0, xmax), ylim=c(0, max(qtloutput$window)+2), xlab="Physical Pos", ylab="-log10", main=main);
    for(i in 1:10){
        points(x=qtloutput[qtloutput$CHR==i,]$pos, y=qtloutput[qtloutput$CHR==i,]$window, col=colors[i])
    }
    abline(h=threshold, col="red", lty=2)
    qtloutput <- qtloutput[order(qtloutput$window, decreasing=T),]
    return(qtloutput)
}



