# load data
d <- read.csv("~/Desktop/Teaching/Sta101_S15/Class survey/surveyS15_1_13.csv")

# histogram of university applications
pdf("hist_university_applications.pdf", width = 7, height = 4)
par(mar = c(3.2,2,1.5,0.5), mgp = c(2,1,0))
hist(d$university_applications, col = COL[1], main = "How many universities did you apply to?", xlab = "universities", ylab = "", cex.main = 1, las = 1, ylim = c(0,25))
abline(h = seq(0, 25, 5), col = COL[6,2], lty = 2)
abline(h = seq(0, 25, 1), col = COL[6,2], lty = 3)
dev.off()

# no NAs
summary(d$university_applications)
length(d$university_applications)
