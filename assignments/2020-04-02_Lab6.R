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

# Two sided t test
t.test(skinColor ~ species, data = salmoncolor, var.equal = TRUE,
       alternative = "two.sided", conf.level = 0.95)

# Two sided Wilcoxan test
wilcox.test(skinColor ~ species,
            data = salmoncolor, alternative = "two.sided", conf.level = 0.95)

