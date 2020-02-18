weather.wd <- getwd()

#install libraries
# install.packages("rnoaa")
# library("rnoaa")


# Import dataset with city names and latitude/longitude 
US.Cities <- read.csv("cities.csv", na.strings = "")

# 
# ####Making a weather dataset for one city#######################################
# #Look up city 
# station.1 <- isd_stations_search(lat=US.Cities$lat[5], lon = US.Cities$lng[5])
# 
# 
# #find city station 
# station.id.1 <- paste(station.1$usaf[3],station.1$wban[3],sep="")
# 
# #collect data from station 
# station.1.weather <- lcd(station.id.1, year=2017)
# 
# #file name
# filename <- paste(US.Cities$city[5],US.Cities$state_id[5],sep=".")
# 
# #create new dataset
# write.csv(station.1.weather, paste(path.data, filename,"Ank.AL.csv"),
#           row.names = FALSE)
# 
# 
# ####Turn it into a looop loop lop lp############################################
# 
# #----Attempt 1------------------------------------------------------------------
# #Try it out
# for(i in 1:1){
# #Look up city 
# station <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])
# 
# #find city station 
# station.id <- paste(station$usaf[1],station$wban[1],sep="")
# 
# #collect data from station 
# station.weather <- lcd(station.id, year=2017)
# 
# station.weatherdata <- data.frame(date=station.weather$date, 
#                                   latitude=station.weather$latitude,
#                                   longitude=station.weather$longitude,
#                                   name=station.weather$name,
#                                   temperature= station.weather$hourlydrybulbtemperature,
#                                   source= station.weather$source)
# 
# #file name
# filename <- paste(US.Cities$name[i], "weather.csv",sep=".")
# 
# #create new dataset
# write.csv(station.weatherdata, paste(path.data, paste(filename), sep=""),
#           row.names = FALSE)
# }
# 
# #Quickly receiving HTTP 404 errors, deleting rows in the data set works
# 
# 
# #----Attempt 2------------------------------------------------------------------
# #Work around 1
# 
# 
# for(i in 1:nrow(US.Cities)){
#   tryCatch({
#   #Look up city 
#   station <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])
#   
#   #find city station 
#   station.id <- paste(station$usaf[1],station$wban[1],sep="")
#   
#   #collect data from station 
#   station.weather <- lcd(station.id, year=2017)}, error=function(e){
#     })
#   
#   #file name
#   filename <- paste(US.Cities$name[i], "weather.csv",sep=".")
#   
#   #create new dataset
#   write.csv(station.weather, paste(path.data, paste(filename), sep=""),
#             row.names = FALSE)
#   
# }
# 
# #That worked, kinda... it output a full list of files, but duplicated datasets 
#     #but gave them new names if the station was not available
# 
# 
# #Time to try to tweak it again
# 
# #----Attempt 3------------------------------------------------------------------
# 
# for(i in 1:nrow(US.Cities)){
#   #Look up city 
#   station <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])
#   
#   
#   for(y in 1:nrow(station)) {
#     #find city station 
#     station.id <- paste(station$usaf[y],station$wban[y],sep="")
#     #collect data from station 
#     station.weather <- (lcd(station.id, year=2017), silent = TRUE)
#     if(typeof(lcd(station.id, year=2017))==typeof(US.Cities)){
#       break
#     }
#   } 
#   
#   
#   station.weatherdata <- data.frame(date=station.weather$date, 
#                                     latitude=station.weather$latitude,
#                                     longitude=station.weather$longitude,
#                                     name=station.weather$name,
#                                     temperature= station.weather$hourlydrybulbtemperature,
#                                     source= station.weather$source)
#   
#   #file name
#   filename <- paste(US.Cities$name[i], "weather.csv",sep=".")
#   
#   #create new dataset
#   write.csv(station.weatherdata, paste(path.data, paste(filename), sep=""),
#             row.names = FALSE)
# }
# 
# #Still not working...UGGGGHHHHHHHHHHHHHHH
# 

#----Attempt 4------------------------------------------------------------------------------------

#more ideas and fiddling around after 8 hours of work brought me to this, 
#Attempt 3 was very close

for(i in 1:nrow(US.Cities)){
  # look up stations within a city 
  station <- isd_stations_search(lat = US.Cities$lat[i], lon = US.Cities$lng[i])
  
  # a sub for loop to run through the different stations within each city
  # looks until it finds one that's available
  for(y in 1:nrow(station)) {
    #find city station 
    station.id <- paste(station$usaf[y],station$wban[y],sep = "")
    #collect data from station 
    station.weather <- try(lcd(station.id, year = 2017), silent = TRUE)
    #when station.weather is a list (not an error) move on
    if(typeof(station.weather) == typeof(US.Cities)){
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
  filename <- paste(US.Cities$name[i], "weather.csv", sep = ".")

# save downloaded weather data to .csv
  write.csv(station.weatherdata, paste(path.data, paste(filename), sep = ""),
            row.names = FALSE)

}  # end loop



