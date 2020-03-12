rm(list = ls())
library(tidyverse)
if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}



### Scenario 1 ####

birthrates <- read_csv("datasets/demos/birthrates.csv")

birthrates <- birthrates %>%
  mutate(difference = Birth_1982 - Birth_2000)

ggplot(data = birthrates) +
  geom_histogram(mapping = aes(difference), binwidth = 1)
ggplot(data = birthrates)+
  geom_boxplot(mapping=aes(x="", y=difference))+
  stat_summary(aes(x="", y=difference),
               fun.y=mean,
               colour="darkred",
               geom="point",
               shape=18,
               size=3)

ggplot(birthrates)+
  geom_qq(mapping = aes(sample = difference))

summ_births <- birthrates %>%
  summarise(meand = mean(difference),
            se_d = sd(difference)/sqrt(n()),
            n = n())


### Scenario 2 ####

data01 <- read_csv("datasets/abd/chapter12/chap12e3HornedLizards.csv")
data01 <- data01 %>% 
  slice(-105)


summhornlength <- data01 %>%
  group_by(Survival) %>%
  summarise(mean = mean(squamosalHornLength),
            median = median(squamosalHornLength),
            sd = sd(squamosalHornLength),
            var = var(squamosalHornLength),
            se = sd(squamosalHornLength)/sqrt(n()))



