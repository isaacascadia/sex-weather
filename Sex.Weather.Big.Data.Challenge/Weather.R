weather.wd <- getwd()

#install libraries
install.packages("rnoaa")
library("rnoaa")

#Import needed dataset
US.Cities <- read.csv("uscities.csv", na.strings = "")


####Making a weather dataset for one city#######################################
#Look up city 
station.1 <- isd_stations_search(lat=US.Cities$lat[1], lon = US.Cities$lng[1])


#find city station 
station.id.1 <- paste(station.1$usaf[1],station.1$wban[1],sep="")

#collect data from station 
station.1.weather <- lcd(paste(station.1$usaf[1],station.1$wban[1],sep=""), 
                         year=2017)

#file name
filename <- paste(US.Cities$city[1],US.Cities$state_id[1],sep=".")

#create new dataset
write.csv(station.1.weather, paste(path.data, filename,".csv"),
          row.names = FALSE)


####Turn it into a looop loop lop lp############################################


#Try it out
for(i in 1:nrow(US.Cities)){
#Look up city 
station <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])

#find city station 
station.id <- paste(station$usaf[i],station$wban[i],sep="")

#collect data from station 
station.weather <- lcd(paste(station$usaf[i],station$wban[i],sep=""), 
                         year=2017)

#file name
filename <- paste(US.Cities$city[i],US.Cities$state_id[i],sep=".")

#create new dataset
write.csv(station.weather, paste(path.data, filename,".csv", sep=""),
          row.names = FALSE)
}

#Quickly receiving HTTP 404 errors, deleting rows in the data set works

#Work around attempt 1
#Try it out
for(i in 1:nrow(US.Cities)){
  #Look up city 
  station <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])
  
  #find city station 
  station.id <- paste(station$usaf[i],station$wban[i],sep="")
  
  #collect data from station 
  station.weather <- try(lcd(paste(station$usaf[i],station$wban[i],sep=""), 
                         year=2017))
  
  if(!inherits(station.weather,"Error")){ 
    (i+1)
    station.test <- isd_stations_search(lat=US.Cities$lat[i], lon = US.Cities$lng[i])
    
    #find city station 
    station.id.test <- paste(station$usaf[i],station$wban[i],sep="")
    
    #collect data from station 
    station.weather <- try(lcd(paste(station$usaf[i],station$wban[i],sep=""), 
                               year=2017))}
  else{ #file name
    filename <- paste(US.Cities$city[i],US.Cities$state_id[i],sep=".")
    }
    
    #create new dataset
    write.csv(station.weather, paste(path.data, filename,".csv", sep=""),
              row.names = FALSE)
    }
  

  
  
  mtry <- try(tuneRF(dat3[, -36], dat3[,36], ntreeTry=1000,
                     stepFactor=1.5,improve=0.01, trace=TRUE, plot=TRUE))
  if (!inherits(mtry, "try-error")) {
    best.m <- mtry[mtry[, 2] == min(mtry[, 2]), 1]
    rf <- randomForest(classe~.,data=dat3, mtry=best.m, importance=TRUE,ntree=1000)
  } else {
    rf <- randomForest(classe~.,data=dat3, importance=TRUE,ntree=1000)
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #file name
  filename <- paste(US.Cities$city[i],US.Cities$state_id[i],sep=".")
  
  #create new dataset
  write.csv(station.weather, paste(path.data, filename,".csv", sep=""),
            row.names = FALSE)
}









