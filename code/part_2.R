# exporting decades games csv
for(i in 1:length(decade_names)){
  filename = paste(paste("nflweather", decade_names[i], sep = ""), "csv", sep = ".")
  write.csv(raw_nflweather[raw_nflweather$decade == decade_names[i], col_selected], 
            file = paste("C:/Users/Lily/Documents/STAT133/HW/cleandata/", filename, sep = ""))
  i = i+1
}