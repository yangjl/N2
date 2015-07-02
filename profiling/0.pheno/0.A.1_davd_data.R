### Jinliang Yang
### analysis the N15 data


t1 <- read.csv("data/N15_david_T1.csv")
t1 <- subset(t1, Variety != "Mo 17")
#subset(t1, d15N > 15)
hist(t1$d15N)
t1 <- subset(t1, d15N < 15)
t1 <- subset(t1, Namount < 200)
t1$d15ref <- 5.139456913
hist(t1$Namount)
t1$time <- "T1"
length(table(t1$Variety)) #32


t2 <- read.csv("data/N15_david_T2.csv")
t2$d15ref <- 4.81953438
#t2 <- subset(t2, d15N > 0)
hist(t2$Namount)
hist(t2$d15N)
t2$time <- "T2"
length(table(t2$Variety)) #23

################
tot <- rbind(t1, t2)
tot$block <- gsub(".*-", "", tot$SampleID)
head(tot)
tot$Ndfa <- 100*(tot$d15ref - tot$d15N)/(tot$d15ref)

###############
tot$Variety <- gsub("Tepetongo", "Tepitongo", tot$Variety)
tot$Variety <- gsub("Mo 17", "Mo17", tot$Variety)
tot$Variety <- gsub("Totontepec", "Tontotepec", tot$Variety)
tot$Variety <- gsub("Tontotepec Vidal", "Tontotepec - Vidal", tot$Variety)
tot$Variety <- gsub("^Vidal", "Tontotepec - Vidal", tot$Variety)
tot$Variety <- gsub("^Vicente", "Tontotepec - Vicente", tot$Variety)
tot$Variety <- gsub("^Carmita", "Tontotepec - Carmita", tot$Variety)


hist(tot$Ndfa)
# negative number should be removed

write.table(tot, "cache/d15N_data.csv", sep=",", row.names=FALSE, quote=FALSE)




hist(t1$Namount)
hist(t2$Namount)


fit <- lm(d15N ~ Variety, data=tot)

par(mfrow=c(2,2))
plot(fit)

#######
library("nlme")


res <- mixed_model(data = tot, model = Ndfa ~ Variety, random = ~1 | time/block,  trait = "Ndfa") 
res[order(res[,2]),]

par(mar= (c(8,4,4,2) +0.1) )
res <- res[order(res[,2]),]
barplot(res$Ndfa, names.arg=res$Genotype, cex.names = 0.8, main="Car makes",ylab="Freqency",xlab="",las=2, srt=60)


x <- barplot(res$Ndfa, xaxt="n")
#labs <- paste(names(table(mtcars$cyl)), "cylinders")
text(cex=1, x=x-.25, y=-1.25, labels=res$Genotype, xpd=TRUE, srt=45, pos=2)


par(mar = c(7, 4, 2, 2) + 0.2) #add room for the rotated labels
#use mtcars dataset to produce a barplot with qsec colum information
res <- res[order(res[,2]),]
#this is the line which does the trick (together with barplot "space = 1" parameter)
end_point = 0.5 + nrow(res) + nrow(res)-1 
barplot(res$Ndfa, col="grey50", 
        main="",
        ylab="mtcars - qsec",
        xlab = "",
        space=1)
#rotate 60 degrees, srt=60
text(seq(1.5,end_point,by=2), par("usr")[3]-0.25, 
     srt = 60, adj= 1, xpd = TRUE,
     labels = res$Genotype, cex=0.9)





