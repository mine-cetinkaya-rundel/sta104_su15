library(xtable)
library(openintro)

cig07 <- read.csv("~/Desktop/Teaching/Sta101_F14/Application exercise/7.1 Multiple linear regression/cig07.csv")

names(cig07)

cig07$TYPE = relevel(cig07$TYPE, "REGULAR")
table(cig07$TYPE)

cig07$FLTR[cig07$FLTR == "f"] = "F"
cig07$FLTR = droplevels(cig07$FLTR)
table(cig07$FLTR)

cig07$STRENGTH = factor(cig07$STRENGTH, levels = c("ULTRA LIGHT", "LIGHT", "MEDIUM", "REGULAR", "FULL FLAVOR"))
table(cig07$STRENGTH)

save(cig07, file = "cig07.RData")

rm(list = ls())

load("cig07.RData")

m = lm(CO ~ NIC + TAR + LEN + FLTR + PACK + STRENGTH + TYPE, data = cig07)
summary(m)
xtable(summary(m))

m2 = lm(CO ~ TAR + LEN + FLTR + PACK + STRENGTH + TYPE, data = cig07)
summary(m2)
xtable(summary(m2))

m3 = lm(CO ~ NIC + LEN + FLTR + PACK + STRENGTH + TYPE, data = cig07)
summary(m3)

m4 = lm(CO ~ TAR + LEN + FLTR + PACK + STRENGTH, data = cig07)
summary(m4)
xtable(summary(m4))
xtable(anova(m4))
sum(anova(m4)[2])

pdf("diag.pdf", width = 12, height = 3)
par(mfrow=c(1,4), mar = c(4,4,0.5,0))
# res vs fit
plot(m4$residuals ~ m4$fitted.values, col = COL[1,2], pch = 19)
abline(h = 0, lty = 2)
# res hist
hist(m4$residuals, col = COL[1], main = "")
# res qq
qqnorm(m4$residuals, col = COL[1,2], main = "", ylab = "Sample Quantiles of m4$residuals")
qqline(m4$residuals, col = COL[1])
# res order
plot(m4$residuals, col = COL[1,2], pch = 19)
abline(h = 0, lty = 2)
dev.off()


# fit the model
m = lm(CO ~ TAR + LEN + FLTR + PACK + STRENGTH, data = cig07)
# create the new data point
smokesalot = data.frame(TAR = 12, LEN = 80, FLTR = "F", PACK = "HARD", STRENGTH = "LIGHT")
# predict
predict(m, newdata = smokesalot)
