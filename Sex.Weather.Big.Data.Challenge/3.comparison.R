#comparison loop
for(i in 1:length(big.cities$name)){
  weath <- read.csv(paste(path.data.raw, big.cities$name[i], ".weather.csv", 
                          sep = ""),
                    stringsAsFactors = FALSE, 
                    strip.white = TRUE, 
                    na.strings = c(NA, ""))
  
  gtrend <- read.csv(paste(path.data.raw, big.cities$name[i], ".gtrends.csv", 
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
  
  
  
  filename <- paste(big.cities$name[i], "comparison.csv", sep = ".")
  pdfname <- paste(big.cities$name[i], "comparison.pdf", sep = ".")
  
  # save table of compared gtrend and weather data to .csv
  write.csv(gtrend.weath, paste(path.data.output, filename, sep = ""),
            row.names = FALSE)
  
  
  # start saving of pdf
  pdf(paste(path.figures, paste(pdfname), sep = ""),
      width = 5, height = 5)
  #
  plot(gtrend.weath$gtrend.hits[gtrend.weath$gtrend.hits > 0] ~
         gtrend.weath$temperature[gtrend.weath$gtrend.hits > 0],
       xlab = "Temperature (F)", ylab = "Hits", las = 1,
       xlim = c(0, 110),
       main = "Google Searches for Sexual Enhancement")
  #
  #
  abline(lm(gtrend.weath$gtrend.hits[gtrend.weath$gtrend.hits > 0] ~
              gtrend.weath$temperature[gtrend.weath$gtrend.hits > 0]),
         xlim = c(0, 110), col = "red")
  #
  # stop saving
  dev.off()
  #
  #
  #
  #
  df <-read.csv(paste(path.data.output, big.cities$name[i], ".comparison.csv",
                      sep = ""),
                stringsAsFactors = FALSE,
                strip.white = TRUE,
                na.strings = c(NA, ""))
} # end comparison loop

#loop for p values
for(i in 1:nrow(big.cities)){
  df <-read.csv(paste(path.data.output, big.cities$name[i], ".comparison.csv", 
                      sep = ""),
                stringsAsFactors = FALSE, 
                strip.white = TRUE, 
                na.strings = c(NA, ""))
  #run linear model
  modelobject <- lm(df$temperature[!is.na(df$temperature)]~ 
                      df$gtrend.hits[1:length(df$temperature
                                              [!is.na(df$temperature)])])
  lmsummary <- summary(modelobject)
  big.cities$r2value[i] <- lmsummary$r.squared
  if (class(modelobject) != "lm") stop("Not an object of class 'lm' ")
  #find f statistic
  f <- summary(modelobject)$fstatistic
  #find p statistic
  p <- pf(f[1],f[2],f[3],lower.tail=F)
  attributes(p) <- NULL
  #print p values onto big cities
  big.cities$pvalue[i] <- (p)
  #big sorting big.cities by p value, you can see Redding is significant!
}
#print Big.Cities results
write.csv(gtrend.weath, paste(path.data.output,"1.Cities.Results", sep = ""),
          row.names = FALSE)