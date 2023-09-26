# Sept 21, 2023
# Tidyverse practice in Repro Workshop

# install.packages("palmerpenguins")

library(dplyr) # dataframe manipulation
library(tidyr) # reshaping data
library(palmerpenguins) #data

penguins_data <- penguins

class(penguins_data)
head(penguins_data)
str(penguins_data)
