### Lab 5

rm(list = ls())
getwd()
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

# One Sample t-test - This is two sided

t.test(earthspin$Obliquity, 
       alternative = "two.sided", mu = 0, conf.level = 0.95)

### Question 2: Blood Cholesterol ####

heartattack <- read_csv("datasets/demos/HeartAttack_short.csv")

# Start by looking at normality
heartattack <- heartattack %>%
  mutate(diff = afterImplant - beforeImplant)
