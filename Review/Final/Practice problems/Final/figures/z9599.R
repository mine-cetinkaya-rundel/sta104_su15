setwd("~/Desktop/Teaching/Sta 101 - S12/Review/Final review/figures")

library(openintro)

pdf("z95.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0))
normTail(U = 1.65, axes = FALSE)
axis(1, at = c(-3,0,1.65,3), labels = c(NA,NA,1.65,NA))
text(x = 2, y = 0.02, col = "blue", "0.05")
dev.off()

pdf("z99.pdf", height = 2, width = 4)
par(mar=c(2,0,0,0))
normTail(U = 2.33, axes = FALSE)
axis(1, at = c(-3,0,2.33,3), labels = c(NA,NA,2.33,NA))
text(x = 2.6, y = 0.03, col = "blue", "0.01")
dev.off()