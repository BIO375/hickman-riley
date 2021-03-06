### Exam 2


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

### Question 17 ####
baker <- read_csv("datasets/demos/baker.csv")

baker <- baker %>%
  mutate(diff = After - Before)

ggplot(baker) +
  geom_histogram(aes(diff), binwidth = 1)

# One-sided, HA that after is greater than before
t.test(baker$After, baker$Before, 
       alternative = "greater", paired =  TRUE, conf.level = 0.95)

### Question 18 ####

install.packages("abd", repos="http://R-Forge.R-project.org")
library("abd")

algae <- AlgaeCO2

summ <- algae %>%
  group_by(treatment) %>% 
  summarise(mean_growth = mean(growthrate),
            sd_growth = sd(growthrate),
            n_growth = n())

# Calculate the ratio between the standard deviations as a loose test of homoscedasticity
ratio <-(max(summ$sd_growth))/(min(summ$sd_growth))

ggplot(algae) +
  geom_histogram(aes(growthrate), binwidth = .5)+
  facet_wrap(~treatment)

t.test(growthrate ~ treatment, data = algae, var.equal = TRUE, alternative = "two.sided", conf.level = 0.95)

### Code runs without breaking 10/10 ####
