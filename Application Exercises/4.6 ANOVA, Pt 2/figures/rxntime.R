library(xtable)

rxntime = read.csv("rxntime.csv")

rxntime_to_print = subset(rxntime, select = c(Subject, PictureTarget.RT, Littered, FarAway))

print(xtable(head(rxntime_to_print)))

xtable(anova(lm(rxntime$PictureTarget.RT ~ rxntime$Subject)))

rxn_subj6 = rxntime[rxntime$Subject == 6,]
rxn_subj8 = rxntime[rxntime$Subject == 8,]

m6 = mean(rxn_subj6$PictureTarget.RT)
s6 = sd(rxn_subj6$PictureTarget.RT)
l6 = length(rxn_subj6$PictureTarget.RT)

m8 = mean(rxn_subj8$PictureTarget.RT)
s8 = sd(rxn_subj8$PictureTarget.RT)
l8 = length(rxn_subj8$PictureTarget.RT)

sum_tab = matrix(rep(NA, 3*4), nrow = 4)
sum_tab[,1] = c("", "mean", "sd", "n")
sum_tab[,2] = c("Subject 6", round(m6,2), round(s6,2), l6)
sum_tab[,3] = c("Subject 8", round(m8,2), round(s8,2), l8)
print(xtable(sum_tab), include.rownames = FALSE, include.colnames = FALSE)


