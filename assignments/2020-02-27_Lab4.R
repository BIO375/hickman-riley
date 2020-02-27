# Lab 4

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

### 3.1 Introductoin
library(tidyverse)

### 3.2 First Steps
mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)

View(mpg)

# 1. I ran view(mpg) instead of ggplot(data = mpg) and I saw a chart with all of the data
# 2. There are 234 rows and 11 columns.
# 3. drv tells us f = front wheel drive, r = rear wheel drive, and 4 = 4 wheel drive
# 4. Make a scatter plot of hwy vs cyl
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))
# 5. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))
# I personally don't think it is that helpful. I mean you can read it and understand what it is showing but I think there could be better ways to view it.


### Aesthetic Mapping
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


# 1. What is wrong with this code? Why are they not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# The points aren't blue because of the placement of the parenthesis. The location of the parenthesis changes how R reads the commands. 

# 2. Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?
# Categorical var: model, trans, drv, fl, class. Continuous Var: displ, cty, hwy. You can see this info in a chart when you run mgp

# 3. Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = displ, color = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = displ, size = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = displ, shape = class))





