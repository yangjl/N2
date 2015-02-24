

d <- read.table("data/davd_data.txt", header=TRUE)

fit <- lm(d15N ~ Type, data=d)

par(mfrow=c(2,2))
plot(fit)

