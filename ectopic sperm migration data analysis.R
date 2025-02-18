library(dplyr)
library(lme4)
library(emmeans)
library(performance)

#import data
ectopic_sperm_migration_datasheet <- read_excel("C:/ectopic_sperm_migration_datasheet.xlsx")

esm_data <- ectopic_sperm_migration_datasheet

#compile location information into column containing binary data on whether ectopic sperm migration occurred in each individual or not
esm_data <- esm_data %>% 
  mutate(ectopic_sperm = case_when(gonads == "no" & soma == "no" ~ "absent",
                                   gonads == "yes" & soma == "no" ~ "present",
                                   gonads == "no" & soma == "yes" ~ "present",
                                   gonads == "yes" & soma == "yes" ~ "present"))

esm_data$ectopic_sperm <- as.factor(esm_data$ectopic_sperm)

#generalized linear mixed model
esm_glmm <- glmer(ectopic_sperm ~ cross + (1|plate), data = esm_data, family = binomial)
summary(esm_glmm)

esm_pairs <- emmeans(esm_glmm, "cross")
pairs(esm_pairs)


#Fisher's exact test for differences in ectopic sperm migration severity and location between cross types

affected_females <- subset(esm_data, esm_data$ectopic_sperm == "present")
affected_females$sperm_number <- as.factor(esm_data$sperm_number)

affected_females <- affected_females %>% 
  mutate(location = case_when(gonads == "yes" & soma == "no" ~ "gonad",
                              gonads == "no" & soma == "yes" ~ "soma",
                              gonads == "yes" & soma == "yes" ~ "all"))

affected_females$location <- as.factor(affected_females$location)
affected_females$invasion_severity <- as.factor(affected_females$invasion_severity)
affected_females$cross_type <- as.factor(affected_females$cross_type)

fisher.test(affected_females$cross, affected_females$location)
fisher.test(affected_females$cross, affected_females$invasion_severity)












