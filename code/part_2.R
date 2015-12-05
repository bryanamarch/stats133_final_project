
# year only column
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

# looking at freq of accidents for 
table(data$decade)

# Graphing
decade_names <- c("1920s", "1930s", "1940s", "1950s", "1960s", "1970s", "1980s", "1990s", "2000s", "2010s")
barplot(table(data$decade), xlab = 'Decades',
        ylab = 'Number of Accidents',
        main = 'Number of Crashes Each Decade',
        names.arg = decade_names,
        las = 2,
        cex.names = .75,
        col = '#FD075E')


decade_1980 <- data[data$decade == "1980s", "type" ]
table(decade_1980)


