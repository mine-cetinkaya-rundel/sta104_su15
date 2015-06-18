library(openintro)

setwd("/Users/mine/Desktop/Teaching/Sta 101 - S12/Exams/Midterm 2/figures/gifted")
source("http://stat.duke.edu/courses/Spring12/sta101.1/labs/inference.R")

gift = read.csv("gifted.csv")

pdf("count_hist.pdf", height = 3, width = 5)
par(mar=c(4,3.75,0.5,0.5), mgp=c(2.7,0.7,0), las = 1)
hist(gift$count, col="#22558833", border="#225588", xlab = "age when the child first counted to 10 successfully (in months)", main = "", cex.lab = 0.8)
dev.off()

inference(gift$count, est = "mean", null = 32, method = "theoretical", alternative = "less", type = "ht")


summary(gift$count)

##

pdf("father_iq_hist.pdf", height = 3, width = 5)
par(mar=c(4,3.75,0.5,0.5), mgp=c(2.7,0.7,0), las = 1)
hist(gift$fatheriq, col="#22558833", border="#225588", xlab = "father's iq", main = "", cex.lab = 0.8)
dev.off()

summary(gift$fatheriq)

pdf("mother_iq_hist.pdf", height = 3, width = 5)
par(mar=c(4,3.75,0.5,0.5), mgp=c(2.7,0.7,0), las = 1)
hist(gift$motheriq, col="#22558833", border="#225588", xlab = "mother's iq", main = "", cex.lab = 0.8)
dev.off()

summary(gift$motheriq)


iqdff = gift$fatheriq - gift$motheriq


set.seed(5)
simdist_iqdiff = inference(iqdff, type = "ci", method = "simulation", nsim = 200, conflevel = 0.95, est = "mean", simdist = TRUE)

pdf("iqdiff_boot.pdf", width = 7.5, height = 4)
par(mar=c(4,0,0,0))
BHH2::dotPlot(simdist_iqdiff, xlab = "bootstrap statistic", axes = FALSE, xlim = c(-6.5,1))
axis(1, at = seq(-6.5,1,0.25), labels = c(-6.5, NA, -6, NA, -5.5, NA, -5, NA, -4.5, NA, -4, NA, -3.5, NA, -3, NA, -2.5, NA, -2, NA, -1.5, NA, -1, NA, -0.5, NA, 0, NA, 0.5, NA, 1))
dev.off()

pdf("iqdiff_boot_soln.pdf", width = 7.5, height = 4)
par(mar=c(4,0,0,0))
set.seed(5)
inference(iqdff, type = "ci", method = "simulation", nsim = 200, conflevel = 0.95, est = "mean")
axis(1, at = seq(-6.5,1,0.25), labels = c(-6.5, NA, -6, NA, -5.5, NA, -5, NA, -4.5, NA, -4, NA, -3.5, NA, -3, NA, -2.5, NA, -2, NA, -1.5, NA, -1, NA, -0.5, NA, 0, NA, 0.5, NA, 1))
dev.off()


inference(iqdff, type = "ht", method = "theoretical", est = "mean", null = 0, alternative = "twosided")