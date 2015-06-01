# load libraries
library(openintro)  # for colors
library("BHH2")     # for dotplot

# load data
d <- read.csv("~/Desktop/Teaching/Sta101_S15/Class survey/surveyS15_1_13.csv")

# view data
str(d)

# histogram of age at first kiss
# very low numbers -> bad question? romantic kiss or any kiss?
pdf("hist_first_kiss.pdf", width = 5, height = 3)
par(mar = c(3.2,2,1.5,0.5), mgp = c(2,1,0))
hist(d$first_kiss, col = COL[1], main = "How old were you when you had your first kiss?", xlab = "age at first kiss", ylab = "", cex.main = 1)
dev.off()

# dotplot of fb visits
# at higher numbers people are rounding
pdf("dot_fb_visits_per_day.pdf", width = 5, height = 3)
par(mar = c(3.2,2,1.5,0.5), mgp = c(2,1,0))
BHH2::dotPlot(d$fb_visits_per_day, pch = 19, main = "How many times do you go on Facebook per day?", xlab = "FB visits / day", cex.main = "1")
dev.off()

# relationship status vs. class year
d$class_year = factor(d$class_year, levels = c("First-year", "Sophomore", "Junior", "Senior"))

d$relationship_status = factor(d$relationship_status, levels = c("yes", "no", "it's complicated"))

pdf("mosaic_relstatus_class.pdf", width = 6, height = 3)
par(mar = c(0.2,0,2,0.5), mgp = c(2,1,0))
mosaicplot(table(d$class_year, d$relationship_status), las = 1, main = "Relationship status vs. class year", cex.axis = 1, col = COL[1])
dev.off()

# drinks vs. vegetarian
pdf("box_drinks_veg.pdf", width = 5, height = 3)
par(mar = c(2.2,2,2,0.5), mgp = c(2,1,0))
boxplot(d$nights_drinking ~ d$vegetarian, main = "nights drinking/week vs. vegetarianism", cex.main = 1)
dev.off()
