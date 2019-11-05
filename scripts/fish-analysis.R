fish_data <-read.csv("data_raw/Gaeta_etal_CLC_data_1.csv")

install.packages("dplyr")
library(dplyr)

# This code adds a categoical size column sorted by big and small,
# where any length bigger than 300 is considered big and anything 
# smaller is considered small

fish_data_cat <- fish_data %>%
  mutate(length_cat <- ifelse(length > 300, "big", "small"))

fish_data_cat_new <- filter(fish_data_cat, scalelength > 1)