### Lab 6 ####

# Clean up the working environment
rm(list = ls())
library("tidyverse")

# To perform sign tests, install and load the package DescTools
# install.packages("DescTools")
library("DescTools")


### Problem 13-20 #####

salmoncolor <- read_csv("datasets/abd/chapter13/chap13q20SalmonColor.csv")

# A.) List two methods that would be appropriate to test whether there was a difference in the two groups
#      - A two sample t test could be used.
#      - Mann-Whitney U test is a method to use on a two sample test. It tells us if the two distributions are different.

# B.) Is there a difference in mean between these two groups? Kokanee and sockeye? 
#      Alternative = There is a difference in means.
#      Null = There is no difference in means. 

# Two sided t test
t.test(skinColor ~ species, data = salmoncolor, var.equal = TRUE,
       alternative = "two.sided", conf.level = 0.95)

# Two sided Wilcoxan test
wilcox.test(skinColor ~ species,
            data = salmoncolor, alternative = "two.sided", conf.level = 0.95)

# P value seems to be really low so we reject the null. There does seem to be a difference in means between these groups. 

### Problem 13-25 ####

clearcuts <- read_csv("datasets/abd/chapter13/chap13q25Clearcuts.csv")

# Alt: There is a difference in biomass
# Null: there is no difference in biomass

t.test(clearcuts$biomassChange, 
       alternative = "two.sided", mu = 0, conf.level = 0.95)

# P>0.05 so fail to reject null hypothesis. With this data we can't tell that there was a significant change in biomass.

### Problem 13-26 ####

