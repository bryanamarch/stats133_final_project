fun_top3 <- function(dat, dec_names) {
  top3 <- NULL
  for (i in dec_names) {
    data_subset <- subset(dat, decade == i)
    value <- head(sort(table(data_subset$type), decreasing = TRUE), n = 3)
    # name <- paste0('top3_',i)
    top3 <- c(top3, value)
  }
  return(top3)
}
