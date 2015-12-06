# ======================================================================
# Part 3: Type analysis 
# Description: Here we are looking at how the most common types of 
#              airplanes to crash changed over different decades. 
# ======================================================================

# packages needed
library(stringr)
library(ggplot2)

# must have ran part_2 first. 

# Here we are parsing out the data by decade so that we can plot by type. 
decade_1920 <- subset(data, decade == decade_names[1])
decade_1930 <- subset(data, decade == decade_names[2])
decade_1940 <- subset(data, decade == decade_names[3])
decade_1950 <- subset(data, decade == decade_names[4])
decade_1960 <- subset(data, decade == decade_names[5])
decade_1970 <- subset(data, decade == decade_names[6])
decade_1980 <- subset(data, decade == decade_names[7])
decade_1990 <- subset(data, decade == decade_names[8])
decade_2000 <- subset(data, decade == decade_names[9])
decade_2010 <- subset(data, decade == decade_names[10])

# Taking out just the top values
top3_1920 <- head(sort(table(decade_1920$type), decreasing = TRUE), n = 3)
top3_1930 <- head(sort(table(decade_1930$type), decreasing = TRUE), n = 3)
top3_1940 <- head(sort(table(decade_1940$type), decreasing = TRUE), n = 3)
top3_1950 <- head(sort(table(decade_1950$type), decreasing = TRUE), n = 3)
top3_1960 <- head(sort(table(decade_1960$type), decreasing = TRUE), n = 3)
top3_1970 <- head(sort(table(decade_1970$type), decreasing = TRUE), n = 3)
top3_1980 <- head(sort(table(decade_1980$type), decreasing = TRUE), n = 3)
top3_1990 <- head(sort(table(decade_1990$type), decreasing = TRUE), n = 3)
top3_2000 <- head(sort(table(decade_2000$type), decreasing = TRUE), n = 3)
top3_2010 <- head(sort(table(decade_2010$type), decreasing = TRUE), n = 3)

# Now we want to create a data frame that combines the data from each 
# decade in a way that we can plot it efficiently. 
decade_names <- c("1920s", "1930s", "1940s", "1950s", "1960s", "1970s", 
                  "1980s", "1990s", "2000s", "2010s")

type <- c(row.names(top3_1920), row.names(top3_1930), row.names(top3_1940), 
          row.names(top3_1950), row.names(top3_1960), row.names(top3_1970), 
          row.names(top3_1980), row.names(top3_1990), row.names(top3_2000), 
          row.names(top3_2010))

freq <- c(as.vector(top3_1920), as.vector(top3_1930), as.vector(top3_1940), 
          as.vector(top3_1950), as.vector(top3_1960), as.vector(top3_1970), 
          as.vector(top3_1980), as.vector(top3_1990), as.vector(top3_2000), 
          as.vector(top3_2010))
decade <- rep(decade_names, each = 3)

top3 <- data.frame(type = type, freq = freq, decade = decade)
  
  
# Graphing (I don't think we need to actually include this plot, so we can 
# delete it once we've all seen it)
library(ggplot2)
ggplot(top3, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())
  

# These are the two sets of decades we want to focus on. 
# Because of the differences among our data sets, we want to look at:
#  - from 1940-1980 
#  - from 1980-2010

# 1940-1980
decade_names_1 <- decade_names[3:6]
type_1 <- type[7:18]
freq_1 <- freq[7:18]
decade_1 <- rep(decade_names_1, each = 3)

top3_1 <- data.frame(type = type_1, freq = freq_1, decade = decade_1)

# plotting the trend
ggplot(top3_1, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Most Common Planes in Accidents 1940s to 1970s')

# 1980-2010
decade_names_2 <- decade_names[7:9]
type_2 <- type[19:27]
freq_2 <- freq[19:27]
decade_2 <- rep(decade_names_2, each = 3)

top3_2 <- data.frame(type = type_2, freq = freq_2, decade = decade_2)

# plotting the trend 
ggplot(top3_2, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Most Common Planes in Accidents 1980s to 2000s')

# Exporting the Graphics
# PDF
pdf('plots_and_graphics/most_common_planes_in_accidents_1940s_to_1970s.pdf')
ggplot(top3_1, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1940s to 1970s')
dev.off()

pdf('plots_and_graphics/most_common_planes_in_accidents_1980s_to_2000s.pdf')
ggplot(top3_2, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1980s to 2000s')
dev.off()

# PNG
png('plots_and_graphics/most_common_planes_in_accidents_1940s_to_1970s.png',
    res = 96, width = 700, height = 500)
ggplot(top3_1, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1940s to 1970s')
dev.off()

png('plots_and_graphics/most_common_planes_in_accidents_1980s_to_2000s.png',
    res = 96)
ggplot(top3_2, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())+
  ggtitle('Top 3 Planes in Accidents 1980s to 2000s')
dev.off()

