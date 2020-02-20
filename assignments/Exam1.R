### Exam 1

# Clean up the working environment
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

### Question 14
polyploid <- read_csv("datasets/demos/polyploid.csv")

polyploid_summary <- polyploid %>%
  group_by(ploidy) %>%
  summarise(n_length = n(),
            mean_length = mean(length),
            median_length = median(length),
            sd_length = sd(length),
            IQR_length = IQR(length),
            var_length = var(length),
            se_length = sd(length)/sqrt(n()))

ggplot(data = polyploid)+
  geom_boxplot(aes(x = ploidy, y = length), notch = FALSE)+
  stat_summary(aes(x = ploidy, y = length), 
               fun.y=mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)


### Extra Credit

SagebrushCrickets <- read_csv("datasets/abd/chapter13/chap13e5SagebrushCrickets.csv")


ggplot(SagebrushCrickets) +
  geom_histogram(aes(timeToMating), binwidth = 5)+
  facet_wrap(~feedingStatus)

SagebrushCrickets <- SagebrushCrickets %>%
  mutate(logtimeToMating = log(timeToMating + 1))

ggplot(SagebrushCrickets) +
  geom_histogram(aes(logtimeToMating), binwidth = .15)+
  facet_wrap(~feedingStatus)




