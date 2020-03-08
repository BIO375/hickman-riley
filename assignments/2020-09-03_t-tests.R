rm(list = ls())
if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}



### Scenario 1 ####

birthrates <- read_csv("datasets/demos/birthrates.csv")

birthdiff <- Birth_1982 - Birth_2000

summ1982 <- birthrates %>%
  summarise(mean_Birth_1982 = mean(Birth_1982),
            median_Birth_1982 = median(Birth_1982),
            IQR_Birth_1982 = IQR(Birth_1982),
            sd_Birth_1982 = sd(Birth_1982),
            var_Birth_1982 = var(Birth_1982),
            se_Birth_1982 = sd(Birth_1982)/sqrt(n()))

summ2000 <- birthrates %>%
  summarise(mean_Birth_2000 = mean(Birth_2000),
            median_Birth_2000 = median(Birth_2000),
            IQR_Birth_2000 = IQR(Birth_2000),
            sd_Birth_2000 = sd(Birth_2000),
            var_Birth_2000 = var(Birth_2000),
            se_Birth_2000 = sd(Birth_2000)/sqrt(n()))

summbirthrates <- birthrates %>%
  summarise(mean_birthdiff = mean(Birth_1982 - Birth_2000),
            median_birthdiff = median(Birth_1982 - Birth_2000),
            IQR_birthdiff = IQR(Birth_1982 - Birth_2000),
            sd_birthdiff = sd(Birth_1982 - Birth_2000),
            var_birthdiff = var(Birth_1982 - Birth_2000),
            se_birthdiff = sd(Birth_1982 - Birth_2000)/sqrt(n()))

### Scenario 2 ####

data01 <- read_csv("datasets/abd/chapter12/chap12e3HornedLizards.csv")
data01 <- data %>% slice(-105)


summhornlength <- data01 %>%
  group_by(Survival) %>%
  summarise(mean_horndiff = mean(squamosalHornLength),
            median_horndiff = median(squamosalHornLength),
            IQR_horndiff = IQR(squamosalHornLength),
            sd_horndiff = sd(squamosalHornLength),
            var_horndiff = var(squamosalHornLength),
            se_horndiff = sd(squamosalHornLength)/sqrt(n()))
