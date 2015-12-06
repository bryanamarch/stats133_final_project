# ======================================================================
# Part 2: Percentage of Accidents in Each Decade
# Description: Here we will find the proportions of accidents to each 
#              dataset.
# ======================================================================
# packages needed
library(stringr)

# making a year only column
data$year <- as.numeric(str_extract(data$date, '[0-9]{4}'))

# labeling by decades
decade = NULL
for(i in 1:length(data$year)){
  x <- data$year[i]
  if ((x %in% c(1920:1929))==TRUE) x = '1920s'
  if ((x %in% c(1930:1939))==TRUE) x = '1930s'
  if ((x %in% c(1940:1949))==TRUE) x = '1940s'
  if ((x %in% c(1950:1959))==TRUE) x = '1950s'
  if ((x %in% c(1960:1969))==TRUE) x = '1960s'
  if ((x %in% c(1970:1979))==TRUE) x = '1970s'
  if ((x %in% c(1980:1989))==TRUE) x = '1980s'
  if ((x %in% c(1990:1999))==TRUE) x = '1990s'
  if ((x %in% c(2000:2009))==TRUE) x = '2000s'
  if ((x %in% c(2010:2019))==TRUE) x = '2010s'
  decade = c(decade, x)
}

data$decade <- decade

# looking at freq of accidents for 
table(data$decade)

# normalizing data
amt_dataset1 <- nrow(air_data_6)
amt_dataset2 <- nrow(av_data_5)

# normalizing accidents amounts by decades function
norm_decade <- function(x){
  if(x %in% c('1920s', '1930s', '1940s', '1950s', '1960s', '1970s')){
    nrow(data[data$decade == x,  ])/amt_dataset1
  }
  else{
    nrow(data[data$decade == x,  ])/amt_dataset2
  }
}

norm_decade_1920 <- norm_decade('1920s')
norm_decade_1930 <- norm_decade('1930s')
norm_decade_1940 <- norm_decade('1940s')
norm_decade_1950 <- norm_decade('1950s')
norm_decade_1960 <- norm_decade('1960s')
norm_decade_1970 <- norm_decade('1970s')
norm_decade_1980 <- norm_decade('1980s')
norm_decade_1990 <- norm_decade('1990s')
norm_decade_2000 <- norm_decade('2000s')
norm_decade_2010 <- norm_decade('2010s')

vec_norm_decade <- c(norm_decade_1920, norm_decade_1930,  norm_decade_1940, 
                     norm_decade_1950, norm_decade_1960, norm_decade_1970, 
                     norm_decade_1980, norm_decade_1990, norm_decade_2000, 
                     norm_decade_2010)

# Graphing
<<<<<<< HEAD
decade_names <- c("1920s", "1930s", "1940s", "1950s", "1960s", "1970s", "1980s", "1990s", "2000s", "2010s")
barplot(table(data$decade), border = FALSE, xlab = 'Decades',
        ylab = 'Number of Accidents',
        main = 'Number of Crashes Each Decade',
=======
decade_names <- c('1920s', '1930s', '1940s', '1950s', '1960s', '1970s',
                  '1980s', '1990s', '2000s', '2010s')

barplot(vec_norm_decade, xlab = 'Decades',
        ylab = 'Proportions of Accidents to Each Dataset',
        main = 'Normalized Number of Crashes Each Decade',
>>>>>>> dc4edd3634b6b0830c41d2e6ba7b91ce70655c11
        names.arg = decade_names,
        las = 2,
        cex.names = .75,
        col = '#FFAC0E')

<<<<<<< HEAD
barplot(vec_norm_decade, border = FALSE, xlab = 'Decades',
=======
# Exporting the Graphics
# PDF
pdf('plots_and_graphics/normalized_number_of_crashes_each_decade.pdf')
barplot(vec_norm_decade, xlab = 'Decades',
>>>>>>> dc4edd3634b6b0830c41d2e6ba7b91ce70655c11
        ylab = 'Proportions of Accidents to Each Dataset',
        main = 'Normalized Number of Crashes Each Decade',
        names.arg = decade_names,
        las = 2,
        cex.names = .75,
        col = '#FFAC0E')
dev.off()

# PNG
png('plots_and_graphics/normalized_number_of_crashes_each_decade.png',
    res = 96)
barplot(vec_norm_decade, xlab = 'Decades',
        ylab = 'Proportions of Accidents to Each Dataset',
        main = 'Normalized Number of Crashes Each Decade',
        names.arg = decade_names,
        las = 2,
        cex.names = .75,
        col = '#FFAC0E')
dev.off()




