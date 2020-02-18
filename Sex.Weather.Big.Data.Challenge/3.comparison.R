
for(i in 1:length(big.cities$name)){
  weath <- read.csv(paste(path.data, big.cities$name[i], ".weather.csv", 
                          sep = ""),
                    stringsAsFactors = FALSE, 
                    strip.white = TRUE, 
                    na.strings = c(NA, ""))
  
  gtrend <- read.csv(paste(path.data, big.cities$name[i], ".gtrends.csv", 
                           sep = ""),
                     stringsAsFactors = FALSE, 
                     strip.white = TRUE, 
                     na.strings = c(NA, ""))
  
  
  # reducing date and time to just date for weather data
  weath$ymd <- substr(weath$date, 1, 10)
  
  # names for each day of the year in weather dataset
  dates <- unique(weath$ymd)
  
  
  # this loop creates a vector with the mean temperature for each day of year
  daily.temp <- rep(NA, 365)
  for(y in 1:length(unique(weath$ymd))){
    
    daily.temp[y] <- mean(as.numeric(weath$temperature[weath$ymd == dates[y]]), 
                          na.rm = TRUE)
    
  }  # end of daily temperature loop

  
  # combine gtrends and weather data by day of year
  gtrend.weath <- data.frame("date" = dates, 
                             "gtrend.hits" = gtrend$hits[1:length(dates)],
                             "temperature" = daily.temp[1:length(dates)])
  
  
  
  filename <- paste(big.cities$name[i], "comparison.pdf", sep = ".")
  
 
  # start saving of pdf
  pdf(paste(path.figures, paste(filename), sep = ""), 
      width = 5, height = 5)

  plot(gtrend.weath$gtrend.hits[gtrend.weath$gtrend.hits > 0] ~ 
         gtrend.weath$temperature[gtrend.weath$gtrend.hits > 0],
       xlab = "Temperature (F)", ylab = "Hits", las = 1,
       xlim = c(0, 110),
       main = "Google Searches for Sexual Enhancement")
  
  # stop saving 
  dev.off()
  

}  # end of comparison loop




