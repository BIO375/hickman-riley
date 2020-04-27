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
# IWith all of this being looked at, I don't think any assumptions are violated so I will proceed. 

# anova
model01 <- lm(bodyTemperature~crabType, data = fiddlercrabfans)

anova(model01)

summary(model01)

# I think that this problem would be considered a planned comparison 
# I think this because before the experiment started, they knew they wanted to
# compare temperatures between the different groups.

# I can't get planned comparisons to work in R. I think this is because I didn't get "multicomp" to download correctly
# So I will do a tukey test instead

model01_b <- aov(bodyTemperature ~ crabType, fiddlercrabfans)
TukeyHSD(model01_b)

# So all of this is looking at the mean rate of head gain between groups
# For 4 of the comparisons, p < 0.05 meaning that we would reject the null hypohtesis that there is no difference between means
# For  minor removed vs. inact male and major removed vs. inact male have p>0.05
# This would cause us to fail to reject the null meaning that there is no significant difference between those groups.




