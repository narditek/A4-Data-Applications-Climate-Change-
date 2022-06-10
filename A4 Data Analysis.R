library(tidyverse)
library(dplyr)

co2_df<- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# How many columns and rows
num_observations<-nrow(co2_df)
num_features<-ncol(co2_df)

# Countries with the highest and lowest amounts of co2 emissions
highest_co2_country<-co2_df %>% 
  drop_na() %>% 
  filter(co2 == max(co2)) %>% 
  pull(country)

lowest_co2_country<-co2_df%>% 
  drop_na() %>% 
  filter(co2 == min(co2)) %>% 
  pull(country)

# Most and least recent year
highest_co2_year<-co2_df%>% 
  drop_na() %>% 
  filter(co2 == max(co2)) %>% 
  pull(year)

lowest_co2_year<-co2_df%>% 
  drop_na() %>% 
  filter(co2 == min(co2)) %>% 
  pull(year)

# The average value of co2 emissions across all the countries (in the most current year)
avg_co2<-co2_df %>% 
  group_by(country) %>% 
  filter(year==2020) %>% 
  summarise(co2_sum = sum(co2))





