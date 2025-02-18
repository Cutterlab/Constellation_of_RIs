library(lme4)
library(emmeans)

#import data
tail_defect_datasheet <- read_excel("C:/tail_defect_datasheet.xlsx")
taildata <- tail_defect_datasheet

taildata$cross <- as.factor(taildata$parental_cross)
taildata$defect <- as.factor(taildata$defect)


#glmm with block as a random effect
tail_defect_glmm <- glmer(defect ~ parental_cross + (1|block), data = taildata, family = binomial)
summary(tail_defect_glmm)

#pairwise contrasts comparing # of individuals with tail defects between parental crosses
tail_defect_contrasts <- emmeans(tail_defect_glmm, "parental_cross")
pairs(tail_defect_contrasts)
