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

### Aldrin Anova ####
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

### Log transformation Anova Aldrin ####

Jaffe <- mutate(Jaffe, log_aldrin = log10(Aldrin))

test2 <- lm(log_aldrin~Depth, data = Jaffe)

summ_logaldrin <- Jaffe %>%
  group_by(Depth) %>% 
  summarise(mean_logaldrin = mean(log_aldrin),
            sd_logaldrin = sd(log_aldrin),
            n_logaldrin = n())

anova(test2)
summary(test2)

        
### HCB Anova ####
testHCB <- lm(HCB~Depth, data = Jaffe)

summ_HCB <- Jaffe %>%
  group_by(Depth) %>% 
  summarise(mean_HCB = mean(HCB),
            sd_HCB = sd(HCB),
            n_HCB = n())

ratio_HCB <- (max(summ_HCB$sd_HCB)/(min(summ_HCB$sd_HCB)))

anova(testHCB)
summary(testHCB)

### Tukey Kramer Honestly Significant Difference (HSD) ####

test2_b <- aov(log_aldrin ~ Depth, Jaffe)
TukeyHSD(test2_b)

testHCB_b <- aov(HCB ~ Depth, Jaffe)
TukeyHSD(testHCB_b)


