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
# 

model01 <- lm(heat_loss ~ leanness, data = insulation)
autoplot(model01, smooth.colour = NA)

insulation_plus <- augment(model01)
ggplot(data = insulation_plus)+
  geom_point(aes(x = leanness, y= .resid))


# This plot does not look that great and nothing seems very linear about it. So I am going to do a transformation

insulation <- insulation %>%
  mutate(sqrt_heat = sqrt(heat_loss))
model02<-lm(sqrt_heat ~ leanness, data = insulation)
ggplot(data = insulation)+
  geom_point(aes(x = leanness, y= resid(model02)))