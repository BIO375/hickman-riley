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

# Chapter Two from R for Data Science

### 10.1 Introduction
library(tidyverse)

### 10.2 Creating Tibbles
as_tibble(iris)

tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)

tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)


tb


tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)

### 10.3 Tibbles vs. data.frames

tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)


nycflights13::flights %>% 
  print(n = 10, width = Inf)

nycflights13::flights %>% 
  View()

# Subsetting
df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

# Extract by name
df$x
df[["x"]]

# Extract by position
df[[1]]

# Using a placeholder
df %>% .$x
df %>% .[["x"]]

### 10.4 Interacting with older code

class(as.data.frame(tb))

### 10.5 Exercises ###


# 1. You can tell if an object is a tibble if it is a data frame and was created using the tibble() command.
# 2. Compare and contrast the data.frame below and the equivalent tibble. 
df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]
# There doesn't seem to be as much informations given in the data.frame compared to the tibble. This might be frustrating becasue there is not as much info
# 3. You can extract the name of a variable 
#4
#5
#6

### 11.2 Getting Started

library(tidyverse)

heights <- read_csv("data/heights.csv")











