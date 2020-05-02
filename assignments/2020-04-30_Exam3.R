### Exam 3 ####

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

caffeine <- read_csv("datasets/demos/caffeine.csv") 

#I will be using a One way ANOVA statistical test 

###Test the assumptions####
#The first assumption is that observations are a random sample from a population and are independent from each other.
#     As far as we know, this assumption is met

#The second assumption is that there is equal variance among groups
summ_life <- caffeine %>%
  group_by(group) %>% 
  summarise(mean_life = mean(half_life),
            sd_life = sd(half_life),
            n_life = n())
ratio_life <-(max(summ_life$sd_life))/(min(summ_life$sd_life))
# The ratio is less than 3 so we cann assume equal variance

#The third assumption of ANOVA is that a variable is normally distributed
#Check for Normality
ggplot(caffeine) +
  geom_histogram(aes(half_life), binwidth = 1)+
  facet_wrap(~group)
ggplot(caffeine)+
  geom_qq(aes(sample = half_life, color = group))
ggplot(caffeine) +
  geom_boxplot(aes(x = group, y = half_life))

###Perform the Test ####

model01 <- aov(half_life ~ group, caffeine)

anova(model01)
#This shows *** so there is at least a significant effect/difference between two groups

summary(model01)

TukeyHSD(model01)

