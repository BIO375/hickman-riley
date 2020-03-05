### ggplot Resource examples

# Tidyverse book Ch.3 (online version, actually Ch.1 in text version)
rm(list = ls())

### 3.1 Introduction ####

#install.packages("tidyverse")
library("tidyverse")
if(!require(nycflights13)){install.packages("nycflights13")}
if(!require(gapminder)){install.packages("gapminder")}
if(!require(Lahman)){install.packages("Lahman")}
tidyverse_update()

### 3.2 First steps ####
mpg
?mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
?geom_point
# When you put a '?' before it will search in the help center.
# This is the basic template to buld a graph.
# ggplot(data = <DATA>)
#   <geom_function>(mapping = aes(<position>) + <coordinate_function + <facet_function> + <scale_function> + <theme_function>)
# Everything after <mappings> is optional

### 3.3. Aesthetic mappings ####
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
# When you want to display all of the classes on one plot, you can insert "color = class" and it will provide a key and divide by color.
# If you want to assign specific colors you type "color = "blue"" , for example
# If you want to make the dots transparent insert "alpha = class"
# If you want to orgainze points by shape insert "shape = class"
# If you want to make the points different sizes and organize that way, insert "size = class"

### 3.5.  Facets ####
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
# Facets divide a plot into subplots based on the values of one or more discrete variables.
# The first line always starts the same for a ggplot "ggplot(data = mpg) +"
# The second line specified waht you want to include in your plot (Refer to aesthetics mapping)
# The third line is where you order your facets
# "facet_wrap" wraps the facets into a rectangular layout
# Then in parentheses you insert ~ 'variable' to identify which variable you want to divide facets by.
# you can use nrow and ncol to tell R how many rows and columns you want your facets to be presented in

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
# Another type of facet you can use is "facet_grid"
# Using teh grid can provide even more ways to organize facets
# It allows you to plot two variables, by arranging the facets by two other variables

### 3.6.  Geometric objects ####
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
# There are several ways you can present the data besides through points.
# This example uses smooth lines to display data.
# To do this, the function "geom_smooth" presents the data in smooth lines.
# You can also make several lines show up, dividing the data by a certain variable.
# To do this, you add "linetype = <variable>" 
# You could also organize by color by typing "color = <variable>"
# The grey background behind the lines shows the standard error
# If you want to remove the standard error type "se = FALSE".

# Using geom_smooth is good for mapping two continuous variables
# Other functions good for mapping continuous variables include:
#     geom_jitter(height = 2, width = 2) <-- 
#     geom_point()
#     geom_quantile()
#     geom_smooth()



### 3.7. Statistical transformations ####

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
# geom_bar() is good for mapping discrete one variables
# This example gives the name "demo" to a data set
# tribble is the command that helps create a chart of all of the data you are inserting (helps make it easier to read)
# Then you can make a bar graph out of your data set



