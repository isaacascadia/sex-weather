weather.wd <- getwd()

#install libraries
install.packages("rnoaa")
library("rnoaa")

#Import needed dataset
US.Cities <- read.csv("cities.csv", na.strings = "")
1

####Making a weather dataset for one city#######################################
#Look up city 
station.1 <- isd_stations_search(lat=US.Cities$lat[5], lon = US.Cities$lng[5])


#find city station 
station.id.1 <- paste(station.1$usaf[3],station.1$wban[3],sep="")

#collect data from station 
station.1.weather <- lcd(station.id.1, year=2017)

#file name
filename <- paste(US.Cities$city[5],US.Cities$state_id[5],sep=".")

#create new dataset
write.csv(station.1.weather, paste(path.data, filename,"Ank.AL.csv"),
          row.names = FALSE)


####Turn it into a looop loop lop lp############################################

#----Attempt 1------------------------------------------------------------------
#Try it out
for(i in 1:nrow(US.Cities)){
#Look up city 
station <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])

#find city station 
station.id <- paste(station$usaf[1],station$wban[1],sep="")

#collect data from station 
station.weather <- lcd(station.id, year=2017)

station.weatherdata <- data.frame(date=station.weather$date, 
                                  latitude=station.weather$latitude,
                                  longitude=station.weather$longitude,
                                  name=station.weather$name,
                                  temperature= station.weather$hourlydrybulbtemperature,
                                  source= station.weather$source)

#file name
filename <- paste(US.Cities$name[i], "weather.csv",sep=".")

#create new dataset
write.csv(station.weatherdata, paste(path.data, paste(filename), sep=""),
          row.names = FALSE)
}

#Quickly receiving HTTP 404 errors, deleting rows in the data set works


#----Attempt 2------------------------------------------------------------------
#Work around 1


for(i in 1:nrow(US.Cities)){
  tryCatch({
  #Look up city 
  station <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])
  
  #find city station 
  station.id <- paste(station$usaf[1],station$wban[1],sep="")
  
  #collect data from station 
  station.weather <- lcd(station.id, year=2017)}, error=function(e){
    })
  
  #file name
  filename <- paste(US.Cities$name[i], "weather.csv",sep=".")
  
  #create new dataset
  write.csv(station.weather, paste(path.data, paste(filename), sep=""),
            row.names = FALSE)
  
}

#That worked, kinda... it output a full list of files, but duplicated datasets 
    #but gave them new names if the station was not available


#Time to try to tweak it again

#----Attempt 3------------------------------------------------------------------










