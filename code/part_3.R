# ======================================================================
# Part 3: Type analysis 
# Description: Here we are looking at how the most common types of 
#              airplanes to crash changed over different decades. 
# ======================================================================

## ---- Preliminary ----
# packages needed
library(stringr)
library(ggplot2)

# functions needed 
source('../code/fun_top3.R')

# Note: must have ran part_2 first.

# Here we are parsing out the data by decade so that we can plot by type and 
# extracting just the top three values.
## ---- Top3 Array ----
top3_array <- fun_top3(data, decade_names)

## ---- comment ----
# Now we want to create a data frame that combines the data from each 
# decade in a way that we can plot it efficiently. 
## ---- Reorganizing ----
type <- names(top3_array)
freq <- as.vector(top3_array)
decade <- rep(decade_names, each = 3)

top3 <- data.frame(type = type, freq = freq, decade = decade)

## ---- comment ----
# These are the two sets of decades we want to focus on. 
# Because of the differences among our data sets, we want to look at:
#  - from 1940-1980 
#  - from 1980-2010

## ---- Parsing: 1940-1980 ----
decade_names_1 <- decade_names[3:6]
type_1 <- type[7:18]
freq_1 <- freq[7:18]
decade_1 <- rep(decade_names_1, each = 3)

top3_1 <- data.frame(type = type_1, freq = freq_1, decade = decade_1)

# plotting the trend
ggplot(top3_1, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Most Common Planes in Accidents 1940s to 1970s')+
  theme(plot.title = element_text(size = rel(.75)))

## ---- Parsing: 1980-2010 ----
decade_names_2 <- decade_names[7:9]
type_2 <- type[19:27]
freq_2 <- freq[19:27]
decade_2 <- rep(decade_names_2, each = 3)

top3_2 <- data.frame(type = type_2, freq = freq_2, decade = decade_2)

# plotting the trend 
ggplot(top3_2, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Most Common Planes in Accidents 1980s to 2000s')

## ---- Exporting the Graphics ----
# Exporting the Graphics
# PDF
pdf('../plots_and_graphics/most_common_planes_in_accidents_1940s_to_1970s.pdf')
ggplot(top3_1, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1940s to 1970s')
dev.off()

pdf('../plots_and_graphics/most_common_planes_in_accidents_1980s_to_2000s.pdf')
ggplot(top3_2, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1980s to 2000s')
dev.off()

# PNG
png('../plots_and_graphics/most_common_planes_in_accidents_1940s_to_1970s.png',
    res = 96, width = 700, height = 500)
ggplot(top3_1, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1940s to 1970s')
dev.off()

png('../plots_and_graphics/most_common_planes_in_accidents_1980s_to_2000s.png',
    res = 96)
ggplot(top3_2, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1980s to 2000s')
dev.off()

