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


fiddlercrabfans <- read_csv("datasets/abd/chapter15/chap15q30FiddlerCrabFans.csv")

ggplot(fiddlercrabfans) +
  geom_histogram(aes(bodyTemperature), binwidth = .1)+
  facet_wrap(~crabType)
ggplot(fiddlercrabfans) +
  geom_boxplot(aes(x = crabType, y = bodyTemperature))
ggplot(fiddlercrabfans)+
  geom_qq(aes(sample = bodyTemperature, color = crabType))
