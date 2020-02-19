
# 
# 
# This script file contains code for querying and saving gtrends data, and also
# code for downloading daily temperature data for every city listed in the 
# study from the NOAA Local Climate Data database. 
# 



#==================== gtrends queries to .csv function ========================= 


# making a function to search through subcodes for every listed city and print 
# .csv files for each query


download.gtrends.data <- function(){
  # loop to create .csv for first half of gtrends queries
  for(i in 1:(length(big.cities$name)/2)){
    
    # querying gtrends for first half of year and saving to object
    first.6mo <- gtrendsR::gtrends(geo = as.character(big.cities[i,3]), 
                                   category = 1236,
                                   time = "2017-01-01 2017-06-30", 
                                   onlyInterest = TRUE)
    
    # querying gtrends for second half of year and saving to object
    second.6mo <- gtrendsR::gtrends(geo = as.character(big.cities[i,3]), 
                                    category = 1236,
                                    time = "2017-07-01 2017-12-31", 
                                    onlyInterest = TRUE)
    
    # combining first and second half to get whole year interest over time 
    iot <- rbind(first.6mo$interest_over_time, second.6mo$interest_over_time)
    
    # saving combined interest over time to .csv
    write.csv(iot, paste(path.data.raw, as.character(big.cities[i,1]), 
                         ".gtrends", ".csv", sep = ""))
  }  # end of loop
  
  
  # loop to create .csv for second half of gtrends queries
  for(i in (length(big.cities$name)/2):length(big.cities$name)){
    
    # querying gtrends for first half of year and saving to object
    first.6mo <- gtrendsR::gtrends(geo = as.character(big.cities[i,3]), 
                                   category = 1236,
                                   time = "2017-01-01 2017-06-30", 
                                   onlyInterest = TRUE)
    
    # querying gtrends for second half of year and saving to object
    second.6mo <- gtrendsR::gtrends(geo = as.character(big.cities[i,3]), 
                                    category = 1236,
                                    time = "2017-07-01 2017-12-31", 
                                    onlyInterest = TRUE)
    
    # combining first and second half to get whole year interest over time 
    iot <- rbind(first.6mo$interest_over_time, second.6mo$interest_over_time)
    
    # saving combined interest over time to .csv
    write.csv(iot, paste(path.data.raw, as.character(big.cities[i,1]), 
                         ".gtrends", ".csv", sep = ""))
  }  # end of loop
  
  
  
  
  
  # checking presence of gtrend .csvs
  
  fcsv.check.gtrend <- function(){        # function definition
    csv.check <- rep(NA, 178)             # vector: Boolean .csv presence
    for(i in 1:length(big.cities$name)){  # loop checks .csvs for all cities
      # populating vector w/ Boolean presence
      csv.check[i] <- file.exists(paste(path.data.raw,  
                                        as.character(big.cities[i,1]), 
                                        ".gtrends", ".csv", sep = ""))
    }
    
    # which cities don't have a gtrends query .csv?
    print("Are there any missing gtrends query .csvs?")
    return(big.cities$name[which(csv.check == FALSE)])
  }
  
  # Running the function - do any cities not have a gtrends query .csv?
  fcsv.check.gtrend()
  
}  # end of gtrends query download function


# execute the gtrends data download function
download.gtrends.data()




#================= saving weather data from noaa ===============================

# this loop downloads temperature data for every city in the big.cities list
# WARNING: this is about 200MB of data, and takes about 1hr to run whole loop.

download.weather.data <- function(){
  
  
  for(i in 1:nrow(big.cities)){
    # look up stations within a city 
    station <- isd_stations_search(lat = big.cities$lat[i], 
                                   lon = big.cities$lng[i])
    
    # a sub for loop to run through the different stations within each city
    # looks until it finds one that's available
    for(y in 1:nrow(station)) {
      #find city station 
      station.id <- paste(station$usaf[y],station$wban[y],sep = "")
      #collect data from station 
      station.weather <- try(lcd(station.id, year = 2017), silent = TRUE)
      #when station.weather is a list (not an error) move on
      if(typeof(station.weather) == typeof(big.cities)){
        break
      }  # end of if statement
    }    # end of station-checking sub-lopp
    
    # specify the data that we want to download for the station
    station.weatherdata <- 
      data.frame(date=station.weather$date, 
                 latitude = station.weather$latitude,
                 longitude = station.weather$longitude,
                 name = station.weather$name,
                 temperature = station.weather$hourlydrybulbtemperature,
                 source = station.weather$source)
    
    # define file name
    filename <- paste(big.cities$name[i], "weather.csv", sep = ".")
    
    # save downloaded weather data to .csv
    write.csv(station.weatherdata, paste(path.data.raw, filename, sep = ""),
              row.names = FALSE)
    
  }  # end of weather data download loop
  
  
  
  # checking presence of weather .csvs
  
  fcsv.check.weather <- function(){       # function definition
    csv.check <- rep(NA, 178)           # vector contains Boolean .csv presence
    for(i in 1:length(big.cities$name)){  # loop checks .csv presence for cities
      # populating vector w/ Boolean presence
      csv.check[i] <- file.exists(paste(path.data.raw,  
                                        as.character(big.cities[i,1]), 
                                        ".weather", ".csv", sep = ""))
    }
    
    # which cities don't have a weather data .csv?
    print("Are there any missing weather data .csvs?")
    return(big.cities$name[which(csv.check == FALSE)])
  }
  
  # Running the function - do any cities not have a gtrends query .csv?
  fcsv.check.weather()
  
  
}  # end of weather data download function


# execute the weather data download function
download.weather.data()




