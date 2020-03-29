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

heart <- read_csv("datasets/demos/HeartAttack_short.csv", col_types = cols(group = col_character()))

# Start by looking at normality

ggplot(heart) +
  geom_histogram(aes(cholest), binwidth = 20)+
  facet_wrap(~group)

ggplot(heart) +
  geom_boxplot(aes(x = group, y = cholest))+
  stat_summary(aes(x = group, y = cholest), 
               fun.y=mean, 
               colour="blue", 
               fill = "blue",
               geom="point", 
               shape=21, 
               size=3)

summ_heart <- heart %>%
  group_by(group) %>% 
  summarise(mean_cholest = mean(cholest),
            sd_cholest = sd(cholest),
            n_cholest = n())

# Calculate the ratio between the standard deviations as a loose test of homoscedasticity
ratio <-(max(summ_heart$sd_cholest))/(min(summ_heart$sd_cholest))

# Two sample T-test

t.test(heart$cholest~heart$group,data = heart, var.equal = TRUE,
       alternative = "two.sided" , conf.level = 0.95)

### Question 3 ####
furness <- read_csv("datasets/quinn/chpt3/furness.csv")

ggplot(furness) +
  geom_histogram(aes(METRATE), binwidth = 20)+
  facet_wrap(~SEX)

ggplot(furness) +
  geom_boxplot(aes(x = SEX, y = METRATE))+
  stat_summary(aes(x = SEX, y = METRATE), 
               fun=mean, 
               colour="blue", 
               fill = "blue",
               geom="point", 
               shape=21, 
               size=3)

# Female seems tobe a little right skewed
# The range of the two groups is definitely not the same

ggplot(furness)+
  geom_qq(aes(sample = METRATE, color = SEX))

#Two-sided test
wilcox.test(METRATE ~ SEX, data = furness, alternative = "two.sided", conf.level = 0.95)


### Question 4 ####

elgar <- read_csv("datasets/quinn/chpt3/elgar.csv")

t.test(elgar$HORIZLIG, elgar$HORIZDIM, 
       alternative = "two.sided", paired = TRUE, conf.level = 0.95)







