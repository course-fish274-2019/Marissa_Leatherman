# Libraries

install.packages("dplyr")
install.packages('tidyverse')

library(ggplot2)
library(dplyr)

# Data import

fish_data <-read.csv("data_raw/Gaeta_etal_CLC_data_1.csv")

# This code names and creates a categoical size column sorted by big and small,
# where any length bigger than 300 is considered big and anything 
# smaller is considered small

fish_data_cat <- fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))

fish_data_cat_new <- filter(fish_data_cat, scalelength > 1)

# Create a scatterplot based on length and scale length of fish with color differences for lake IDs

ggplot(data=fish_data_cat_new, mapping=(aes(x = length, y = scalelength, color = lakeid))) +
         geom_point()+
         labs(x = 'Body Length', y = 'Scale Length')

# Histogram added by Dr. Roberts in pulling exercise

ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(bins=80)
