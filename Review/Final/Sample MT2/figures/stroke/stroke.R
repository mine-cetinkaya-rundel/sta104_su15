library(openintro)

source("http://stat.duke.edu/courses/Spring12/sta101.1/labs/inference.R")

setwd("/Users/mine/Desktop/Teaching/Sta 101 - S12/Exams/Midterm 2/figures/stroke")

group = c(rep("treatment", 224), rep("control", 227))
outcome = c(rep("stroke", 33), rep("no event", 191), 
	rep("stroke", 13), rep("no event", 214)
)

group = factor(group, levels = c("treatment", "control"))
outcome = factor(outcome, levels = c("stroke", "no event"))

set.seed(836582)
simdist = inference(outcome, group, outcome = "stroke", null = 0, type = "ht", method = "simulation", est = "proportion", alternative = "twosided", drawlines = "no", nsim = 200, simdist = TRUE)

sorted_simdist = sort(simdist)
sorted_simdist[1] = -1*max(sorted_simdist)

pdf("stroke.pdf", width = 6, height = 4)
par(mar=c(4.5,0,1,0))
BHH2::dotPlot(sorted_simdist, axes = FALSE, xlab = "randomization statistic")
axis(1, at = seq(-0.10,0.10,0.01), labels = c("-0.10", rep(NA, 4), "-0.05", rep(NA, 4), 0, rep(NA, 4), "0.05", rep(NA, 4), "0.10"))
dev.off()