
# First we download the raw data onto R studio: 
# We will use a numebering convention so that at each modication the number increases by one. 
av_data_1 <- read.delim('raw_data/aviation_data.txt', header = TRUE, sep = '|', stringsAsFactors = FALSE)
air_data_1 <- read.csv('raw_data/airplane_crashes.csv', stringsAsFactors = FALSE)

# This takes only the airplane data fromt the data frame as opposed to  all aircrafts. 
av_data_2 <- subset(data_1, Aircraft.Category == ' Airplane ')
air_data_2 <- air_data_1[grepl()]

# Now to extract the information (columns) that we want  
av_data_3 <- av_data_2[c('Event.Date', 'Location','Country', 'Make', 'Model')]
air_data_3 <- air_data_2[c('Date', 'Location', 'Type')]

head(data_1$Aircraft.Category)


air_data_2$Type
