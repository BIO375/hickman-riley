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
ggplot(mpg, aes(x = year, y = cyl)) +
  geom_point() +
  facet_grid(. ~ cty)
# When you facet on a continuous variable it makes a really ugly scatter plot. It makes a facet for every single value.

# 2. What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
# I think the empty cells mean that there was no observations of the combination of cyl and drv categories.

# 3. What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
# The . seems to define which variable goes on which axis or the orientation of the graph. 

# 4. What are the advantages to using faceting instead of the colour aesthetic? What are the disadvantages? 
# How might the balance change if you had a larger dataset?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
# Sometimes when you use colors or a scale of colors it might be hard to distinguish one color from another.
# Having them separated into their own groups can make it easier to see trends for each type
# However sometimes it might be helpful to have all of the data on one graph, making separation by color really helpful.

# 5. Read ?facet_wrap. What does nrow do? What does ncol do? What other options control the layout of the individual panels? 
# Why doesn’t facet_grid() have nrow and ncol arguments?
# nrow and ncol seem to control the number of rows and columns in a facet. 

# 6. When using facet_grid() you should usually put the variable with more unique levels in the columns. Why?
# There would be more space in columns for the variabls that have more unique levels. 

### 3.6 Geometric Objects

# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# 1. What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
# geom_line(), geom_boxplot(), geom_histogram(), geom_area()

# 2. Run this code
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# 3. What does show.legend = FALSE do? What happens if you remove it?  Why do you think I used it earlier in the chapter?
# To see what show.legend = FALSE does I briefly changed it in the script I wrote earlier to "TRUE".
# I noticed that when it = FALSE, the figure legend on the right of the graph goes away.
# I honestly don't know why a legend wouldn't be used in this graph because it helps you understand what line reperesents each characteristic

# 4. What does the se argument to geom_smooth() do?
# se stands for standard error so when you put se = TRUE, it adds a grayish standard error underlay to the graph.
# When you have se = FALSE, the stardard error is not shown.

# 5. Will these two graphs look different? Why/why not?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# No these two graphs do not lok different.
# The data is inserted in different spots in the script of the two graphs but it performs the same function.

# 6. Recreate the R code necessary to generate the following graphs.
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(group = drv), se = FALSE) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(colour = drv)) +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(colour = drv)) +
  geom_smooth(aes(linetype = drv), se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(aes(colour = drv))

### 3.7 Statistical Transformations
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

# 1. What is the default geom associated with stat_summary()? 
# How could you rewrite the previous plot to use that geom function instead of the stat function?

# I used the help center for this question. When I searched stat_summary it said geom = "pointrange"
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

# 2. What does geom_col() do? How is it different to geom_bar()?
#  geom_bar makes the heigh of the bar proportional to the number of cases in each group. geom_col makes the heights of the bars represent values in the data.

# 3. Most geoms and stats come in pairs that are almost always used in concert.
# Read through the documentation and make a list of all the pairs. What do they have in common?
# I found these by reading the section, searching the geom_*** in the help section and reading the equivalent stat under the usage section
# geom_bar & stat_count
# geom_pointrange & stat_summary
# geom_point & stat_identity
# geom_smooth & stat_smooth


# 4. What variables does stat_smooth() compute? What parameters control its behavior?
# stat_smooth computes y, ymin, ymax, and se. The method and formula control it's behavior.

#5. In our proportion bar chart, we need to set group = 1. Why? In other words what is the problem with these two graphs?
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = 1))
# When I ran the code above without group = 1 included, all of the bars were the same height.
# Now that the code does have group = 1 it shows the proper height of the bars to correspond with data.

### 3.8 Position Adjustments
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

# 1. What is the problem with this plot? How could you improve it?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()
# The issue with this plot is that it has overplotting - so basically points are all in a straight line and it's hard to tell where the spread of the data is at
# I think the jitter setting can help fix this.

# 2. What parameters to geom_jitter() control the amount of jittering?
# From the help section, I have gathered that you can change the height and width to change the jitter.

# 3. Compare and contrast geom_jitter() with geom_count().
# geom_jitter is a shortcut for geom_point and is helpful with overplotting problems
# geom_count counts the number of observations at each location

# 4. What’s the default position adjustment for geom_boxplot()? Create a visualisation of the mpg dataset that demonstrates it.
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_boxplot()

### 3.9 Coordinate Systems
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

# 1. Turn a stacked bar chart into a pie chart using coord_polar().


# 2. What does labs() do? Read the documentation.
# According to the help tab, labs modifies axis, legend and plot labels

# 3. What’s the difference between coord_quickmap() and coord_map()?
# Help tab says that coord_map projects a portion of the earth onto a flat 2D plane.
# coord_quickmap is a fast approximation that does preserve straight lines.

# 4. What does the plot below tell you about the relationship between city and highway mpg? Why is coord_fixed() important? 
# What does geom_abline() do?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
# geom_abline is a reference line. 
# I think the plot tells us that overall this data has a positive trend and the values in hwy are slightly larger in comparison to their cty.





