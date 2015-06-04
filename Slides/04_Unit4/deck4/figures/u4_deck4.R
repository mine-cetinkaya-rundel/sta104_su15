
rxntime.example <- function(write.out=FALSE, width=400, height=300)
{

    rxntime = read.csv("data/rxntime.csv")

    
    rxnt    = rxntime[,c("Subject", "PictureTarget.RT", "Littered", "FarAway")]

    if (write.out) png("figures/rxntime-boxplots.png", width=width, height=height)
    
    boxplot(PictureTarget.RT ~ Subject, data=rxntime, main="Reaction time of subjects",
            ylab="Reaction Times", xlab="Subject ID")

    if (write.out) dev.off()

    lm1 = lm(PictureTarget.RT ~ as.factor(Subject), data=rxntime)
    anova(lm1)

    lm2 = lm(PictureTarget.RT ~ as.factor(Subject)*as.factor(Littered), data=rxntime)

    anova(lm1, lm2)
    
    rxnt$Subject.x.Littered = paste("S", rxnt$Subject, ".", "L", rxnt$Littered, sep="")

    if (write.out) png("figures/rxntime-boxplot-subject-littered.png", width=width*1.2, height=height)

    boxplot(PictureTarget.RT ~ Subject.x.Littered, data=rxnt, main="Reaction times: Subject & Littered",
            ylab="Reaction Times", xlab="", las=2)
    mtext("Subject and Littered Status", side=1, line=4)
    
    if (write.out) dev.off()

    
}

rxntime = read.csv("../data/rxntime.csv")
anova(lm(rxntime$PictureTarget.RT~as.factor(rxntime$Subject)))
library(xtable)
xtable(anova(lm(rxntime$PictureTarget.RT ~ as.factor(rxntime$Subject))))
