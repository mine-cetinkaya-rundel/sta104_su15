library(openintro)
library(xtable)

load(url("http://bit.ly/dasi_anes_data"))
levels(anes$sample_region) = c("Northeast", "North Central", "South", "West")

anes = anes[!is.na(anes$sample_region) & !is.na(anes$presapp_track), ]

set.seed(12345)
aa = anes[sample(1:nrow(anes), size = 500, replace = FALSE),]
tab = table(aa$sample_region, aa$presapp_track)
xtable(addmargins(tab), digits = 0)

census = c(55,67,115,72)
census_dist = census / sum(census)
round(census_dist,2)

chisq.test(table(aa$sample_region), p = census_dist)

o = c(83, 121, 193, 103)
e = c(90, 110, 185, 115)
sum((o-e)^2/e)

pdf("anes_mosaic.pdf", height = 3, width = 6.5)
par(mar = c(0,0,0.5,0))
mosaicplot(tab, main = "", col = COL[1], cex.axis = 1.25)
dev.off()

chisq.test(tab)
