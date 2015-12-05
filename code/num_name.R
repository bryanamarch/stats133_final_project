# ======================================================================
# Function: num_name
# Description: This is a function that we created to take the month
#              in numeric form and change it into the month in words. 
# ======================================================================

num_name <- function (dates){
  month = NULL
  for(i in 1:length(dates)){     
    word = switch(dates[i], 
                  'January','February',
                  'March', 'April',
                  'May', 'June', 
                  'July', 'August',
                  'September', 'October', 
                  'November','December')
    month = c(month, word)
  }
  return(month)
}
