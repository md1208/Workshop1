# We set up a new project on GitHub called "Workshop1"

#setwd("~/3. Data Science/Week 4/Workshop1")

chaff <- read.table ("./chaff.txt", header = T)

# Try refort into tidy form

library(tidyverse)

# Try make the two columns saying the sexes and the masses

mass <- chaff$females +
  chaff$males

# Just separated the masses into a group by themselves

chaff2 <- group_by("female"+"male")

# Doesn't work

#Easy way but not flexible

chaff2<- gather(data = chaff, key = sex, value = max)


#the tidyverse way is 

chaff2<- chaff%>% 
  pivot_longer(names_to = "sex", 
               values_to = "mass",
               cols = everything())

# Write the newly formatted data to a file. 
# A dataframe can be written to file 
  
file <-  "./chaff2.txt"
write.table(chaff2, 
            file, 
            quote = FALSE,
            row.names = FALSE)

#Summarise and analyse the data 
# testing whether there is a difference in mass between male and female chaffinches

# %>% allows you to do multiple commands at the same time

summary_chaff <- chaff2 %>% group_by(sex) %>%
  summarise(mean = mean(mass), 
            n = length(mass),
            sd = sd(mass))


# Check summary

summary_chaff

# sex      mean     n    sd
# <chr>   <dbl> <int> <dbl>
#   1 females  20.5    20  2.14
# 2 males    22.3    20  2.15










































