# Sept 21, 2023
# Intermediate programming in R

# install.packages("palmerpenguins")

library(dplyr) # dataframe manipulation
library(tidyr) # reshaping data
library(palmerpenguins) #data

biscoe_dat <- read.csv("https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv")
head(biscoe_dat)

# check for NAs
anyNA(biscoe_dat)
biscoe_dat <- biscoe_dat |> 
  na.omit()

# wrangle
# biscoe_dat_means <- biscoe_dat |> 
  # group_by(species, sex) |> 
  # summarize(mean_bill_length = mean(bill_length_mm),
            # mean_bill_depth = mean(bill_depth_mm),
            # mean_flipper_length = mean(flipper_length_mm))

biscoe_dat_means <- biscoe_dat |> 
   group_by(species, sex) |> 
   summarize(across(ends_with("mm"), mean))

biscoe_dat_means_imperial <- biscoe_dat_means |> 
  mutate(across(ends_with("mm"), ~ . * 0.039337008, .names = "{.col}_in"),
         across(ends_with("g"), ~ . * 0.002204623, .names = "{.col}_lbs"))

biscoe_dat_means_imperial <- biscoe_dat_means_imperial |> 
  rename_with(~stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) |> 
  rename_with(~stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))
  
biscoe_dat_means_imperial <- biscoe_dat_means_imperial |> 
  select(c(where(is.character) |
           ends_with("in") |
           ends_with("lb")))

# writing functions----

my_function <- function(favorite_beverage = "coffee") {
  
  what_to_say <- paste0("I need ", favorite_beverage, "!")
  return(what_to_say)
  
}

my_function(favorite_beverage = "tea")

# data wrangling fucntion

my_function <- function(data_url = "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv") {
  
  island_dat <- read.csv(data_url)
  
  island_dat <- island_dat |> 
    na.omit()
  
  island_dat_means <- island_dat |> 
    group_by(species, sex) |> 
    summarize(across(ends_with("mm"), mean))
  
  island_dat_means_imperial <- island_dat_means |> 
    mutate(across(ends_with("mm"), ~ . * 0.039337008, .names = "{.col}_in"),
           across(ends_with("g"), ~ . * 0.002204623, .names = "{.col}_lbs"))
  
  island_dat_means_imperial <- island_dat_means_imperial |> 
    rename_with(~stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) |> 
    rename_with(~stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))
  
  island_dat_means_imperial <- island_dat_means_imperial |> 
    select(c(where(is.character) |
               ends_with("in") |
               ends_with("lb")))
  
  return(island_dat_means_imperial)
  
  
}

function_output <- my_function("https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Torgersen.csv")

