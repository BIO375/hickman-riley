### Lab 8 ###

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

# To perform sign tests, load the package DescTools
library("DescTools")

fiddlercrabfans <- read_csv("datasets/abd/chapter15/chap15q30FiddlerCrabFansb.csv")



### Assess normality and equal variance assumptions ####
# Assumptions of ANOVA include random sample, normal distribution and same variance

summ_temp <- fiddlercrabfans %>%
  group_by(crabType) %>% 
  summarise(mean_temp = mean(bodyTemperature),
            sd_temp = sd(bodyTemperature),
            n_temp = n())
ratio <-(max(summ_temp$sd_temp))/(min(summ_temp$sd_temp))
# there is equal variance because ratio is less than 3

### Plot the data ####
ggplot(fiddlercrabfans) +
  geom_histogram(aes(bodyTemperature), binwidth = .1)+
  facet_wrap(~crabType)
ggplot(fiddlercrabfans) +
  geom_boxplot(aes(x = crabType, y = bodyTemperature))
ggplot(fiddlercrabfans)+
  geom_qq(aes(sample = bodyTemperature, color = crabType))
#I think from these figures things appear to be normally distributed

# anova
model01 <- lm(bodyTemperature~crabType, data = fiddlercrabfans)

anova(model01)

summary(model01)

# I think that this problem would be considered a planned comparison 
# I think this because before the experiment started, they knew they wanted to
# compare temperatrues between the different groups.

# Planned comparison
planned <- glht(model01, linfct = 
                  mcp(crabType = c("female - intact male = 0",
                                   "minor male removed - intact male = 0",
                                   "major male removed - intact male = 0")))
confint(planned)
summary(planned)
