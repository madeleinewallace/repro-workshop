# This script reads and wrangles data for prepare for analysis
# Maddie Wallace
# 2023-09-05


# Load packages -----------------------------------------------------------
# install.packages("readr")
# install.packages("lme4")
library(readr)
library(lme4)
library(dplyr)


# Read data ---------------------------------------------------------------
## Read the csv file----
gapminder <- read.csv("data/gapminder_data.csv")
head(gapminder)
str(gapminder)


# Wrangle data ------------------------------------------------------------
gap_1980s <- filter(gapminder, year >= 1980, year < 1990)
gap_big <- filter(gapminder, pop > 100000000000)


# Write data --------------------------------------------------------------
write_csv(gap_1980s, "data_clean/gapminder_1980s.csv")
write_rds(gap_1980s, "data_clean/gapminder_1980s.rds")

print("hello")
