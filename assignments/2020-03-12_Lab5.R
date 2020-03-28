### Lab 5

rm(list = ls())

### Install and load packages ####

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

# Check for updates
tidyverse_update()

### Question 1: Earth Spin Example ####

earthspin <- read_csv("datasets/demos/earthspin.csv")

# Use R to perform a one-sample t-test
t.test(earthspin$Obliquity, 
       alternative = "two.sided", mu = 0, conf.level = 0.95)



