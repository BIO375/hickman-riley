### FINAL EXAM ###

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

library("ggfortify")

library("broom")

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

insulation <- read_csv("datasets/demos/insulation.csv")

# Predictor Variable: leanness - Continuous 
# Response Variable: heat loss (measured as change in body temp) - Continuous 

# This experiment has a continuous response and predictor variable.
# This means that we will be using linear regression

# Alternative: Slope doesn't equal zero
# Null: Slope = 0  There will be no significant prediction of heat loss by leanness

# Assumptions:
# 1. at each value of x there is a population of possible y values whose mean lies on the true regression line
# 2. at each value of x the distribution of possible y values is normal
# 3. the variance of y values is the same at all values of x
# 4. at each value of x the y measurements represent a random sample from possible y values

modela <- lm(heat_loss ~ leanness, data = insulation)
autoplot(modela, smooth.colour = NA)

insulation_plus <- augment(modela)
ggplot(data = insulation_plus)+
  geom_point(aes(x = leanness, y= .resid))


# This plot does not look that great and nothing seems very linear about it. Very fan/cloud shaped
# So I am going to do a transformation of the y variable (heat_loss). 
# A transformation is warranted 

insulation <- insulation %>%
  mutate(sqrt_heat = sqrt(heat_loss))
modelb<-lm(sqrt_heat ~ leanness, data = insulation)
ggplot(data = insulation)+
  geom_point(aes(x = leanness, y= resid(modelb)))

summary(modelb)

# Boys with more fat quanity have significantly greater amount of heat loss:  
# (Linear regression: sqrt(heat_loss) = 0.012 + 0.046 (leanness); df = 1, 10,
# F=44.58, p<0.001). Fat quanity explained more than 80% variation in the square root transformed grain
# number (R2 = 0.8168).
