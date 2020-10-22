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


# It has arguments for the size, resolution and device for the image. 
# Since I often make more than one figure, 
# I might set these argument values to variables first:
  
#   # figure saving settings
#   units <- "in"  
# fig_w <- 3.5
# fig_h <- fig_w
# dpi <- 300
# device <- "tiff" 
# 
# #Then write the figure to file using, for example:
#   
#   ggsave("../figures/fig1.tiff",
#          plot = fig1,
#          device = device,
#          width = fig_w,
#          height = fig_h,
#          units = units,
#          dpi = dpi)



# Make the ggplot

fig1<-ggplot( data = chaff2, aes(x = sex, y = mass, col = sex)) + geom_point() + theme_bw() +
  ylab("Mass") + xlab("Sex") +
  labs(col = "Sex")

# if you want to see the plot (even though its assigned):
fig1

# So main ggplot is by itself and add anything else 


# ggplot(data = summary_chaff, aes(x = sex, y = mass)) + geom_point()


# No mass in the summary


# figure saving settings
  units <- "in"
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff"

#Then write the figure to file using, for example:

  ggsave("./chaff plot",
         plot = fig1,
         device = device,
         width = fig_w,
         height = fig_h,
         units = units,
         dpi = dpi)

# Hello! Sophie here, hopefully this has all worked :) 























