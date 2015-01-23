### Jinliang Yang
### comparing the output from python and R scripts


rout <- read.table("tests/routput.txt", header=TRUE)
pout <- read.table("tests/output.txt", header=TRUE)


par(mfrow=c(3,2))
plot(pout$maf0, rout$maf0, xlab="Python", ylab="R", main="overall MAF")
plot(pout$missing0, rout$missing0, xlab="Python", ylab="R", main="overall allele missing rate")
plot(pout$maf1, rout$maf1, xlab="Python", ylab="R", main="MAF in population one")
plot(pout$missing1, rout$missing1, xlab="Python", ylab="R", main="Missing rates in population one")
plot(pout$maf2, rout$maf2, xlab="Python", ylab="R", main="MAF in population two")
#cor(pout$maf2, rout$maf2)
plot(pout$missing2, rout$missing2, xlab="Python", ylab="R", main="Missing rates in population two")

