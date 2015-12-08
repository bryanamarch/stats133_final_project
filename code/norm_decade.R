# ======================================================================
# Function: norm_decade
# Description: This is a function that we created to take the decades
#              data and divides it by the data set of which it came
#              from.
# ======================================================================

# normalizing accidents amounts by decades function
norm_decade <- function(x){
  if(x %in% c('1920s', '1930s', '1940s', '1950s', '1960s', '1970s')){
    nrow(data[data$decade == x,  ])/amt_dataset1
  }
  else{
    nrow(data[data$decade == x,  ])/amt_dataset2
  }
}
