

#######
library("nlme")


library("lme4")
library(lmerTest)

fit <- lmer(Ndfa ~ Variety + (1| time/block) + (1 | Subdate), data=tot)

fit <- lmer(Ndfa ~ Variety + (1| time/block) + (1 | Subdate), data=tot)

# get Satterthwaite-approximated degrees of freedom
coefs <- coef(summary(fit))
coefs <- as.data.frame(coefs)
rownames(coefs) <- gsub("Variety", "", rownames(coefs))
rownames(coefs)[1] <- "B73"

coefs <- coefs[order(coefs[,1]),]


res <- coefs
par(mar = c(12, 4, 2, 2) + 0.2) #add room for the rotated labels
#use mtcars dataset to produce a barplot with qsec colum information
res <- res[order(res[,1]),]
#this is the line which does the trick (together with barplot "space = 1" parameter)
end_point = 0.5 + nrow(res) + nrow(res)-1 
cols <- c(rep("grey50", 17), rep("red", 15))
xvals <- barplot(res$Estimate, col=cols, ylim=c(-70,140),
        main="",
        ylab="% Ndfa",
        xlab = "",
        space=1)
with(res, 
     arrows(
         xvals, res$Estimate-res[,2], xvals, res$Estimate+res[,2], 
         length=.03, angle=90, code=3,
         # Change the colour and line width, to see the error bars
         col="navy", lwd=1.5
     )
)
#rotate 60 degrees, srt=60
text(seq(1.5,end_point,by=2), par("usr")[3]-0.25, 
     srt = 45, adj= 1, xpd = TRUE,
     labels = rownames(res), cex=0.9)







res <- mixed_model(data = tot, model = Ndfa ~ Variety, random = ~1 | time/block,  trait = "Ndfa") 
res[order(res[,2]),]

mixed_model <- function(data = df, model = KRN ~ Pedigree, random = ~1 | Farm/Rep, 
                        trait = "KRN") {
    
    trait <- as.character(model)[2]
    data <- data[!is.na(data[, trait]), ]
    data[, trait] <- as.numeric(as.character(data[, trait]))
    
    lmeout1 <- lme(model, data = data, random = random)
    ped.hat1 <- lmeout1$coef$fixed
    ped.hat1[-1] <- ped.hat1[-1] + ped.hat1[1]
    
    fix <- as.character(model)[3]
    names(ped.hat1)[1] <- as.character(data[order(data[, fix]), fix][1])
    names(ped.hat1) <- gsub(fix, "", names(ped.hat1))
    tped <- data.frame(Genotype = names(ped.hat1), trait = ped.hat1)
    names(tped)[2] <- trait
    return(tped)
}

