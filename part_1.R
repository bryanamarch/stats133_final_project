# extracting months
data$month <- as.numeric(str_extract(data$Date, "[0-9]+"))

# labeling months with words
month = NULL
for(i in 1:length(data$month)){     
  word = switch(data$month[i], 
                "january",
                "february",
                "march",
                "april",
                "may", 
                "june", 
                "july", 
                "august",
                "september",
                "october", 
                "november",
                "december"
  )
  month = c(month, word)
}

# exporting decades games csv
for(i in 1:length(decade_names)){
  filename = paste(paste("nflweather", decade_names[i], sep = ""), "csv", sep = ".")
  write.csv(raw_nflweather[raw_nflweather$decade == decade_names[i], col_selected], 
            file = paste("C:/Users/Lily/Documents/STAT133/HW/cleandata/", filename, sep = ""))
  i = i+1
}
