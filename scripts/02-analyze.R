
# load packages -----------------------------------------------------------

library(readr)
library(lme4)


# read data ---------------------------------------------------------------

gap_1980s <- read_csv("data_clean/gapminder_1980s.csv")


# read data ---------------------------------------------------------------

install.packages("ggsave")
library(ggsave)
ggsave("mtcars.png")
