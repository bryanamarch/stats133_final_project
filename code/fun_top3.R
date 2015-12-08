# ======================================================================
# Function: fun_top3
# Description: This function subsets the data by decade and extracts 
#              the three types of panes with the most amount of crashes
#              in each decade, then concatenates all 30 (10 decades). 
# ======================================================================

fun_top3 <- function(dat, dec_names) {
  top3 <- NULL
  for (i in dec_names) {
    data_subset <- subset(dat, decade == i)
    value <- head(sort(table(data_subset$type), decreasing = TRUE), n = 3)
    top3 <- c(top3, value)
  }
  return(top3)
}