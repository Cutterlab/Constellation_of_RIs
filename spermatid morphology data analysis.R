library(lme4)
library(emmeans)
library(MASS)

#======================================================================================
#spermatid area
#======================================================================================

#import data
spermatid_morphology_data <- read_excel("C:/spermatid_morphology_data.xlsx", 
                                        +     sheet = "Spermatid area")
area_data <- spermatid_morphology_data

area_data$worm <- as.factor(area_data$worm)
area_data$parental_cross <- as.factor(area_data$parental_cross)

#creating a unique identifier for each worm (specific to the parental cross)
area_data$unique_worm <- paste0(area_data$parental_cross, "_", area_data$worm)

#visualizing the data to identify distribution
hist(area_data$area_um) 
shapiro.test(area_data$area_um) #p-value < 2.2e-16
#the data is very positive/right skewed (non-normal), will use gamma distribution for glmm

#changing factor levels so that PB219 is the reference cross in glmm output
area_data <- within(area_data, cross <- relevel(parental_cross, ref = "PB219"))

#glmm comparing spermatid area in F1 males between the 4 parental cross types
#worm is included as a random effect (since multiple spermatids were measured per individual worm)
spermatid_area_glmm <- glmer(area_um ~ parental_cross + (1|unique_worm), data = area_data, family = Gamma)
summary(spermatid_area_glmm) 

pairwise_contrasts_area <- emmeans(spermatid_area_glmm, "cross")
pairs(pairwise_contrasts_area)




#=====================================================================================
#spermatid circularity
#======================================================================================

#import data
spermatid_morphology_data <- read_excel("C:/spermatid_morphology_data.xlsx", 
                                        +     sheet = "Spermatid circ + roundness")
circ_round_data <- spermatid_morphology_data

circ_round_data$parental_cross <- as.factor(circ_round_data$parental_cross)
circ_round_data$worm <- as.factor(circ_round_data$worm)
circ_round_data <- within(circ_round_data, cross <- relevel(parental_cross, ref = "PB219")) 

shapiro.test(circ_round_data$circularity) #circularity distribution is non-normal
hist(circ_round_data$circularity) #circularity distribution has negative skew
hist(1/circ_round_data$circularity, breaks = 50) #inverse transformation causes positive skew, will use gamma distribution for glmm

spermatid_circ_glmm <-glmer((1/circularity) ~ parental_cross + (1|worm), data = circ_round_data, family = Gamma)
summary(spermatid_circ_glmm)

pairwise_contrasts_circ <- emmeans(spermatid_circ_glmm, "parental_cross")
pairs(pairwise_contrasts_circ)



#======================================================================================
#spermatid roundness
#======================================================================================

shapiro.test(circ_round_data$roundness) #roundness distribution is non-normal
hist(circ_round_data$roundness) #roundness distribution has negative skew
hist(1/circ_round_data$roundness, breaks = 50) #inverse transformation causes positive skew, will use gamma distribution for glmm

spermatid_roundness_glmm <-glmer((1/roundness) ~ parental_cross + (1|worm), data = circ_round_data, family = Gamma)
summary(spermatid_roundness_glmm)

pairwise_contrasts_roundness <- emmeans(spermatid_roundness_glmm, "parental_cross")
pairs(pairwise_contrasts_roundness)




#======================================================================================
#spermatid number
#======================================================================================

#import data
spermatid_morphology_data <- read_excel("C:/spermatid_morphology_data.xlsx", 
                                        +     sheet = "Spermatid number")
number_data <- spermatid_morphology_data

number_data$parental_cross <- as.factor(number_data$parental_cross)
number_data$worm_id <- as.factor(number_data$worm_id)

mean(number_data$sperm_number) #703.4
sd(number_data$sperm_number) #375.39

glm_spermnum_pois <- glm(sperm_number ~ parental_cross, data = number_data, family = "poisson")
summary(glm_spermnum_pois) #model indicates overdispersion (residual deviance/df >>1), will be more useful to use a negative binomial distribution

glm_spermnum_nb <- glm.nb(sperm_number ~ parental_cross, data = number_data)
summary(glm_spermnum_nb)

glm_spermnum_pairwise <- emmeans(glm_spermnum_nb, "parental_cross")
pairs(glm_spermnum_pairwise)





