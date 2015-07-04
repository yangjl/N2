## introgression plot

Inplot <- function(){ 
    #threshold=3, 
    cen <- read.table("~/Documents/Github/zmSNPtools/shareData/centromeres.20090608.txt", header=TRUE)
    # start data plotting:
    # plot the frame of the figure
    plot(x=c(0, max(info2$physical)), y=c(0, 10.5), col="maroon", type="n", main="2D epistasis scanning", xlab="Physical position",
         ylab="", yaxt="n", xaxt="n", bty="n")
    
    
    #### chromosome
    for (i in 1:10){
        chr <- subset(info2, chr == i)
        lines(c(0, max(chr$physical)), c(10.5-i, 10.5-i), lwd=4, col="grey")
        
        ##centremere
        rect(xleft=cen[cen$Chr==i, ]$Start, ybottom=10.5-i, xright=cen[cen$Chr==i, ]$End, ytop=10.5-i+1,
             col="#ffd700", border="#ffd700", lty=1, xpd=TRUE)
        ### introgression
        rect(xleft=chr$physical-1, ybottom=rep(10.5-i, nrow(chr)), xright=chr$physical+1, ytop=10.5-i + chr$mex.x,
             col="maroon", border="maroon", lty=1, xpd=TRUE)
        
        ### jacknife
        rect(xleft=chr$physical-1, ybottom=rep(10.5-i, nrow(chr)), xright=chr$physical+1, ytop=10.5-i + chr$mex,
             col="#008080", border="#008080", lty=1, xpd=TRUE)
        
        #lines(c(chr$physical, chr$physical), c(rep(10.5-i, nrow(chr)), 10.5-i + chr$mex.x), type="h", col="maroon")
        text(0,11-i, paste("Chr", i, sep=""))
    }
}



