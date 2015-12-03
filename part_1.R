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


