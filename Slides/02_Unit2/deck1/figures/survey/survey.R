# load libraries
library(openintro)  # for colors
library(BHH2)       # for dotplot
library(xtable)

# load data
d <- read.csv("~/Desktop/Teaching/Sta101_S15/Class survey/surveyS15.csv")

# rename to shorten levels of vote variable
levels(d$voted_for_president) = c("no, eligible but didn't", "no, not eligible", "yes")

# order class year levels
d$class_year = factor(d$class_year, levels = c("First-year", "Sophomore", "Junior", "Senior"))

# year vs. vote
yr_vote_tab = table(d$class_year, d$voted_for_president)

# xtable for slides
xtable(addmargins(yr_vote_tab), digits = 0)

