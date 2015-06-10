library("downloader")

download("https://stat.duke.edu/~mc301/data/vacc_malaria.csv", destfile = "vacc_malaria.csv")
vacc_malaria = read.csv("vacc_malaria.csv")

pdf("malaria.pdf", height = 3, width = 8)
inference(vacc_malaria$outcome, vacc_malaria$group, success = "malaria", est = "proportion", type = "ht", null = 0, alternative = "twosided", method = "simulation", seed = 1028)
dev.off()