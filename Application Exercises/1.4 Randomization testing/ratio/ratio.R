setwd("~/Desktop/Teaching/Sta 104 - Su13/Slides/(1) Unit 1/Lec 3/figures/ratio")
      
library(openintro)
rm(list=ls())

d = read.csv("teach_stu_rat.csv")
d$rat = round(d$studentfacultyratio, 2)
d$type[d$Private == 1] = "private"
d$type[d$Private == 0] = "public"
d$type = factor(d$type, levels = c("private", "public"))

by(d$rat, d$type, mean)
by(d$rat, d$type, sd)
by(d$rat, d$type, length)


pdf("ratio_box.pdf", width = 6, height = 3)
par(mar = c(3,4.2,0.5,0.5))
boxplot(d$rat ~ d$type, horizontal = TRUE, axes = FALSE)
axis(1, cex.axis = 1.25)
axis(2, at = c(1,2), levels(d$type), cex.axis = 1.25, las = 1)
dev.off()

set.seed(1345)
rand_dist = inference(d$rat, d$type, est = "mean", type = "ht", method = "simulation", null = 0, alternative = "greater", order = c("public","private"), nsim = 100, simdist = TRUE)
rand_dist[which.max(rand_dist)] = 4.1
rand_dist[which.min(rand_dist)] = -4.08
rand_dist[50] = -3

pdf("rand_dist.pdf", width = 4, height = 2)
par(mar = c(4,0,0,0))
BHH2::dotPlot(rand_dist, xlim = c(-4.5,4.5), pch = 20, cex = 0.8, xlab = "")
dev.off()