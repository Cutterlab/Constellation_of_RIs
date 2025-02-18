library(lme4)
library(emmeans)
library(performance)

#import data
assortative_mating_data <- read_excel("C:/assortative_mating_data.xlsx", 
                                      +     sheet = "Choice mating data")

#expand counts of observations into binary data
cnt2bin <- function(data, yes, no) {
  xvars <- names(data)[names(data)!=yes & names(data)!=no]
  list <- lapply(xvars, function(z) with(data, rep(get(z), get(yes)+get(no))))
  names(list) <- xvars
  df <- as.data.frame(list)
  with(data, data.frame(bin=rep(rep(c(1,0), nrow(data)), c(rbind(get(yes), get(no)))), df))
}


assortative_mating_data_1 <- cnt2bin(assortative_mating_data, "yessperm", "nosperm")
names(assortative_mating_data_1)[names(assortative_mating_data_1) == "bin"] <- "sperm"


#binomial glmm
glmm <- glmer(sperm ~ cross + (1|block) + (1|plate), data = assortative_mating_data_1, family = binomial)

#identity of dyed male and female is associated with extremely little variance so will not include in the model

summary(glmm)
performance(glmm)

glmm_pairs <- emmeans(glmm, "cross")
pairs(glmm_pairs)


#import control data 
assortative_mating_data <- read_excel("C:/assortative_mating_data.xlsx", 
                                      +     sheet = "Conspecific control data")
control <- assortative_mating_data
control$no_sperm <- (control$total_fem - control$num_with_sperm)


#expand counts of observations into binary data
control <- cnt2bin(control, "num_with_sperm", "no_sperm")
names(control)[names(control) == "bin"] <- "sperm"

control$sperm <- as.factor(control$sperm)
control$species <- as.factor(control$species)

#glmm on control data
glmm_control <- glmer(sperm ~ species + (species|rep), data = control, family = binomial)
summary(glmm_control)








