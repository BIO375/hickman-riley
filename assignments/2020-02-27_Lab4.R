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
# Categorical var: model, trans, drv, fl, class. Continuous Var: displ, year, cyl, cty, hwy. 
# You can see this information when you run View(mpg). The angled brackets at the top of each column tell you which variable it is. 

# 3. Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(mpg, aes(x = displ, y = hwy, color = cty)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, size = cty)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, shape = cty)) +
  geom_point()
# A continuous variable cannot be mapped to shape so it comes up as an error
# A color scale is given for the continuous variables and creates a color scale to coordinate value.
# Using size makes the points on the scatter plot bigger or smaller depending on varibable value.

# 4.What happens if you map the same variable to multiple aesthetics?
ggplot(mpg, aes(x = hwy, y = cty, colour = hwy, size = cty)) +
  geom_point()
# When you map the same variable to multiple aesthetics seems kind of weird
# It basically just shows you the same information twice
# Points with high value will be light colored and large in size and vice versa for small value points

# 5. What does the stroke aesthetic do? What shapes does it work with?
# Stroke changes the border of shapes and the color.
# It can work on shapes that will have a filling.

# 6. What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)?
ggplot(mpg, aes(x = cty, y = hwy, colour = cty < 5)) +
  geom_point()
# When you do that it will color coordinate the data depending on if it meets the statement
# So the points are red if it is false that cty < 5. 
# It would be a different color if it was true that cty < 5.


### 3.4 Common Problems

#If you write the code like this and put the + sign in the wrong spot nothing will happen
ggplot(data = mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy))

### 3.5 Facets

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# 1. What happens if you facet on a continuous variable?


