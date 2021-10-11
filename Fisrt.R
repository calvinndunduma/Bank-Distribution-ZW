library(flexdashboard)
install.packages("tidyverse")

library(billboarder)
library(dplyr)
library(tidyverse)

setwd("C:\\Users\\Calvin.Ndunduma\\Documents\\Bank distribustion")

bank_data <- read.csv("Bank_Codes.csv")
class(bank_data)
head(bank_data)
bank_data %>% count(Town)

summarized_data <- bank_data %>% group_by(Banks, Town) %>% summarise(Branch = n())
summarized_data
class(summarized_data)


tw_data <- table(summarized_data$Town)
billboarder() %>% bb_piechart(tw_data)

ban_data <- table(summarized_data$Banks)
billboarder() %>% bb_piechart(ban_data)



ggplot(data = summarized_data) + 
  geom_point(mapping = aes(x = Banks, y = Town))

