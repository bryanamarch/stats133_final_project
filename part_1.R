#packages needed
library(stringr)

# extracting months
data$month <- as.numeric(str_extract(data$date, '[0-9]+'))

# labeling months with words
month = NULL
for(i in 1:length(data$month)){     
  word = switch(data$month[i], 
                'January',
                'February',
                'March',
                'April',
                'May', 
                'June', 
                'July', 
                'August',
                'September',
                'October', 
                'November',
                'December')
  month = c(month, word)
}

# Number of Entries Each Month
month_names <- c('January', 'February', 'March', 'April', 'May', 'June', 
                 'July', 'August', 'September', 'October', 'November',
                 'December')

monthly_data = NULL
for (name in month_names){
  total_per_month <- sum(month == name)
  monthly_data <- c(monthly_data, total_per_month)
}

# Graphing the months
barplot(monthly_data, xlab = 'Months',
        ylab = 'Number of Accidents',
        main = 'Number of Crashes Each Month',
        names.arg = month_names,
        las = 2,
        cex.names = .75,
        col = '#FD075E')

# Exporting the Graphics
#PDF
pdf('plots_and_graphics/Number_of_Crashes_Each_Month.pdf')
barplot(monthly_data, xlab = 'Months',
        ylab = 'Number of Accidents',
        main = 'Number of Crashes Each Month',
        names.arg = month_names,
        las = 2,
        cex.names = .75,
        col = '#FD075E')
dev.off()

#PNG
png('plots_and_graphics/Number_of_Crashes_Each_Month.png', res = 96)
barplot(monthly_data, xlab = 'Months',
        ylab = 'Number of Accidents',
        main = 'Number of Crashes Each Month',
        names.arg = month_names,
        las = 2,
        cex.names = .75,
        col = '#FD075E')
dev.off()
