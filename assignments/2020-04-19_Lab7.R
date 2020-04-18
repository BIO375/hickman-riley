# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

# The general workflow as you do analyses in R should be as follows:
#   Step 1.  Plot your data (boxplots, histograms, Q-Q plots)
#   Step 2.  Use the function lm() to fit a model, specifying equation & data
#     e.g., y ~ x, data = data
#   Step 3.  Check assumptions again, using residuals plot
#   Step 4.  If assumptions are met, use the functions anova() and summary() 
#     to interpret statistical results.  If assumptions are not met, try 
#     data transformation and/or a non-parametric or robust version of the test

Jaffe <- read_csv("datasets/demos/Jaffe.csv")

Jaffe <- Jaffe %>%
  mutate(Depth = fct_recode(Depth, Surface = "Surface", Middepth = "Middepth", Botttom = "Bottom"))

head(Jaffe)
summary(Jaffe)

ggplot(Jaffe, aes(x = Depth, y = Aldrin))+
  geom_boxplot() +
  theme_bw()

test1 <- lm(Aldrin~Depth, data = Jaffe)

summ_aldrin <- Jaffe %>%
  group_by(Depth) %>% 
  summarise(mean_aldrin = mean(Aldrin),
            sd_aldrin = sd(Aldrin),
            n_aldrin = n())

ratio_aldrin <- (max(summ_aldrin$sd_aldrin)/(min(summ_aldrin$sd_aldrin)))

anova(test1)

# p < 0.05. so from this we can tell that depth does play a role in aldrin levels

summary(test1)
        



