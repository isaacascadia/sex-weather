
# 
# 
# This script file contains code  for querying and saving gtrends data.
# 
# 
# 



#============================ queries to .csv function ========================= 


# making a function to search through a bunch of city subcodes and print .csv
# files for each query




# loop to create .csv for first half of gtrends queries
for(i in 1:(length(big.cities$name)/2)){
  
  # querying gtrends for first half of year and saving to object
  first.6mo <- gtrends(geo = as.character(big.cities[i,3]), category = 1236,
                       time = "2018-01-01 2018-06-30", onlyInterest = TRUE)
  
  # querying gtrends for second half of year and saving to object
  second.6mo <- gtrends(geo = as.character(big.cities[i,3]), category = 1236,
                        time = "2018-07-01 2018-12-31", onlyInterest = TRUE)
  
  # combining first and second half to get whole year interest over time 
  iot <- rbind(first.6mo$interest_over_time, second.6mo$interest_over_time)
  
# saving combined interest over time to .csv
  write.csv(iot, paste(wd, "/data.output/", as.character(big.cities[i,1]), 
                       ".gtrends", ".csv", sep = ""))
}  # end of loop


# loop to create .csv for second half of gtrends queries
for(i in (length(big.cities$name)/2):length(big.cities$name)){
  
# querying gtrends for first half of year and saving to object
  first.6mo <- gtrends(geo = as.character(big.cities[i,3]), category = 1236,
                   time = "2018-01-01 2018-06-30", onlyInterest = TRUE)
   
# querying gtrends for second half of year and saving to object
  second.6mo <- gtrends(geo = as.character(big.cities[i,3]), category = 1236,
                   time = "2018-07-01 2018-12-31", onlyInterest = TRUE)
  
# combining first and second half to get whole year interest over time 
  iot <- rbind(first.6mo$interest_over_time, second.6mo$interest_over_time)
  
# saving combined interest over time to .csv
  write.csv(iot, paste(wd, "/data.output/", as.character(big.cities[i,1]), 
                       ".gtrends", ".csv", sep = ""))
}  # end of loop












# checking presence of .csvs

fcsv.check.gtrend <- function(){      # function definition
csv.check <- rep(NA, 178)             # vector contains Boolean .csv presence
for(i in 1:length(big.cities$name)){  # loop checks .csv presence for each city
# populating vector w/ Boolean presence
  csv.check[i] <- file.exists(paste(wd, "/data.output/",  
                                  as.character(big.cities[i,1]), ".gtrends", 
                                  ".csv", sep = ""))
}

# which cities don't have a gtrends query .csv?
return(big.cities$name[which(csv.check == FALSE)])
}

# Running the function - do any cities not have a gtrends query .csv?
fcsv.check.gtrend()


  




#============================ noaa =============================================
library(rnoaa)
station <- isd_stations_search(lat = 40.6943, lon = -73.9249, radius = 25)

station$usaf[1]

ny.weather <- lcd(station = paste(station$usaf[1], station$wban[1], sep = ""), 
                  year = 2018)




