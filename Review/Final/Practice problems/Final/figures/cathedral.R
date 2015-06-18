setwd("~/Desktop/Teaching/Sta 101 - S12/Review/Final review/figures")
library(xtable)
library(openintro)
library(faraway)

# set colors

COL <- c('#55000088','#225588')

# load data

data(cathedral)

names(cathedral)[2:3] = c("nave_height", "total_length")

levels(cathedral$style) = c("gothic","roman")

# mlr

m = lm(total_length ~ nave_height + style, data = cathedral)
summary(m)

# nearly normal residuals

pdf("cath_normal_res.pdf", height = 4.3, width = 10)

par(mar=c(2,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,2))

qqnorm(m$residuals, main = "Normal probability plot of residuals", pch = 19, col = COL[2])
qqline(m$residuals, col = COL[1], lwd = 2)

hist(m$residuals, main = "Histogram of residuals", col = fadeColor(COL[2], 66), border = COL[2])

dev.off()

# constant variability in residuals

pdf("cath_homo_res.pdf", height = 4.3, width = 5)

par(mar=c(4,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(m$residuals ~ m$fitted, main = "Residuals vs. fitted", pch = 19, col = COL[2], ylab = "residuals", xlab = "fitted")
abline(h = 0, lty = 3)

dev.off()

# independent residuals

pdf("cath_indep_res.pdf", height = 4.3, width = 5)

par(mar=c(4,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25)

plot(m$residuals, main = "Residuals vs. order of data collection", pch = 19, col = COL[2], ylab = "residuals", xlab = "order of data collection")

dev.off()

# linear relatiopnships

pdf("cath_linear.pdf", height = 4.3, width = 5)

par(mar=c(4,4,2,1), las=1, mgp=c(3,0.7,0), cex.lab = 1.25, cex.axis = 1.25, mfrow = c(1,1))

plot(cathedral$total_length ~ cathedral$nave_height, pch = 19, col = COL[2], xlab = "nave height", ylab = "total length", main = "Total length vs. nave height")

dev.off()
