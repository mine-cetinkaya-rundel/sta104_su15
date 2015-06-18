library(ggplot2)
library(downloader)

data(diamonds)
N = nrow(diamonds)

set.seed(869)
to_sample = sample(1:N, 150, replace = FALSE)
d = diamonds[to_sample,]
table(d[, 4])

d$cl = "not IF"
d$cl[d$clarity == "IF"] = "IF"

download("https://stat.duke.edu/~mc301/R/inference.RData", destfile = "inference.RData")
load("inference.RData")

boot_dist = inference(d$cl, est = "proportion", type = "ci", conflevel = 0.90, method = "simulation", boot_method = "perc", success = "IF", eda_plot = FALSE, nsim = 100, seed = 1245, inf_lines = FALSE, simdist = TRUE)

pdf("diamonds_clarity_boot.pdf", height = 4, width = 8)
library("BHH2")
dotPlot(boot_dist, pch = 19, axes = FALSE)
axis(1, at = seq(0,0.075, 0.005), label = c(0,NA,0.01,NA,0.02,NA,0.03,NA,0.04,NA,0.05,NA,0.06,NA,0.07,NA))
dev.off()

m = round(mean(boot_dist), 3)
s = round(sd(boot_dist), 3)

m + c(-1,1)*1.96*s


##

d = diamonds[to_sample,]

VS_minus = c("FL","IF","VVS1","VVS2")
VS_plus = c("VS1","VS2","SI1","SI2","I1","I2","I3")

d$clar = NA
d$clar[d$clarity %in% VS_minus] = "VS-"
d$clar[d$clarity %in% VS_plus] = "VVS+"

colorless = c("D","E","F")
near_colorless = c("G","H","I","J")

d$col = NA
d$col[d$color %in% colorless] = "colorless"
d$col[d$color %in% near_colorless] = "near colorless"

table(d$clar, d$col, useNA = "ifany")

inference(d$col, d$clar, est = "proportion", type = "ht", conflevel = 0.90, method = "simulation", null = 0, success = "colorless", eda_plot = FALSE, seed = 1245, inf_lines = FALSE, alternative = "twosided")




