
library(stringr)
data$year <- as.numeric(str_extract(data$date, "[0-9]{4}"))

# labeling by decades
decade = NULL
for(i in 1:length(data$year)){
  x <- data$year[i]
  if ((x %in% c(1920:1929))==TRUE) x = "1920s"
  if ((x %in% c(1930:1939))==TRUE) x = "1930s"
  if ((x %in% c(1940:1949))==TRUE) x = "1940s"
  if ((x %in% c(1950:1959))==TRUE) x = "1950s"
  if ((x %in% c(1960:1969))==TRUE) x = "1960s"
  if ((x %in% c(1970:1979))==TRUE) x = "1970s"
  if ((x %in% c(1980:1989))==TRUE) x = "1980s"
  if ((x %in% c(1990:1999))==TRUE) x = "1990s"
  if ((x %in% c(2000:2009))==TRUE) x = "2000s"
  if ((x %in% c(2010:2019))==TRUE) x = "2010s"
  decade = c(decade, x)
}

data$decade <- decade



# parsing out the data by decade so that we can plot by type. 
decade_1920 <- subset(data, decade == decade_names[1])
top3_1920 <- head(sort(table(decade_1920$type), decreasing = TRUE), n = 3)

decade_1930 <- subset(data, decade == decade_names[2])
top3_1930 <- head(sort(table(decade_1930$type), decreasing = TRUE), n = 3)

decade_1940 <- subset(data, decade == decade_names[3])
top3_1940 <- head(sort(table(decade_1940$type), decreasing = TRUE), n = 3)

decade_1950 <- subset(data, decade == decade_names[4])
top3_1950 <- head(sort(table(decade_1950$type), decreasing = TRUE), n = 3)

decade_1960 <- subset(data, decade == decade_names[5])
top3_1960 <- head(sort(table(decade_1960$type), decreasing = TRUE), n = 3)

decade_1970 <- subset(data, decade == decade_names[6])
top3_1970 <- head(sort(table(decade_1970$type), decreasing = TRUE), n = 3)

decade_1980 <- subset(data, decade == decade_names[7])
top3_1980 <- head(sort(table(decade_1980$type), decreasing = TRUE), n = 3)

decade_1990 <- subset(data, decade == decade_names[8])
top3_1990 <- head(sort(table(decade_1990$type), decreasing = TRUE), n = 3)

decade_2000 <- subset(data, decade == decade_names[9])
top3_2000 <- head(sort(table(decade_2000$type), decreasing = TRUE), n = 3)

decade_2010 <- subset(data, decade == decade_names[10])
top3_2010 <- head(sort(table(decade_2010$type), decreasing = TRUE), n = 3)

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
  
  
library(ggplot2)
ggplot(top3, aes(x = decade, y = freq, fill = type))+
  geom_bar( stat = 'identity', position = position_dodge())
  





