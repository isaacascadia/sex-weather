weather.wd <- getwd()

#install libraries
install.packages("rnoaa")
library("rnoaa")

#Import needed dataset
US.Cities <- read.csv("uscities.csv", na.strings = "")


station.1 <- isd_stations_search(lat=US.Cities$lat[1], lon = US.Cities$lng[1])

lcd(paste(station.1$usaf[1],station.1$wban[1],sep=""), year=2018)

station.id.1 <- paste(station.1$usaf[1],station.1$wban[1],sep="")
