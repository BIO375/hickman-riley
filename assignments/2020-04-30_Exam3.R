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

# Null Hypotheses:
# mean caffeine metabolism rate is not different between men and women without elevated progesterone
# mean caffeine metabolism rate is not different between women without and with elevated progesterone

# Predictor variable: group, categorical
# Response variable: half life of caffeine concentration; continuous

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
#This shows *** so there is at least a significant effect/difference between two groups

TukeyHSD(model01)

# Results
# The male-high_prog and the norm_prog-high_prog comparisons show a p value less than 0.05
# This means we would reject the null hypothsis that mean caffeine metabolism rate
# is different no between women with elevated progesterone and women without elevated progesterone.
# Basically, there is significant difference between groups mentioned above.

# However, we would fail to reject the null hypothesis that mean caffeine metabolism rate is not different between
# men and women with without elevated progesterone. The p value was greater than 0.79.
# Basically, there is no significant difference between groups mentioned above.





