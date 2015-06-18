setwd("~/Desktop/Teaching/Sta 101 - S12/Review/Final review/figures")

year1 = c(38, 10, 84, 36, 50, 35, 73, 48)
year2 = c(32, 16, 57, 28, 55, 12, 61, 29)

pdf("year1.pdf", height = 3, width = 4)
hist(year1, col="#22558833", border="#225588", main = "", xlab = "number of rusted leaves, year 1", xlim = c(0,100))
dev.off()

pdf("year2.pdf", height = 3, width = 4)
hist(year2, col="#22558833", border="#225588", main = "", xlab = "number of rusted leaves, year 2", xlim = c(0,100))
dev.off()
