library(gtrendsR)

# 
# 
# This script file contains code  for querying and saving gtrends data.
# 
# 
# 





#===== getting subcodes function ============================================

cities.needed <- data.frame(names = 
                              c("Birmingham, AL", "Anchorage, AK", "Phoenix, AZ", 
                                "Little Rock-Pine Bluff, AR","Los Angeles, CA", "Denver, CO", 
                                "Wilmington, DE", "Washington, DC", 
                                "Jacksonville, FL", "Atlanta, GA", "Honolulu, HI", 
                                "Boise, ID", "Chicago, IL", "Indianapolis, IN", 
                                "Des Moines, IA", "Wichita, KS", "Louisville, KY", 
                                "New Orleans, LA", "Portland, ME","Baltimore, MD", 
                                "Boston, MA", "Detroit, MI", "Minneapolis, MN", 
                                "Jackson, MS", "Kansas City, MO", "Billings, MT", 
                                "Omaha, NE", "Las Vegas, NV", "Manchester, NH","Newark, NJ", 
                                "Albuquerque, NM", "New York City, NY", "Charlotte, NC", 
                                "Fargo, ND", "Columbus, OH", "Oklahoma City, OK", 
                                "Portland, OR", "Philadelphia, PA", "Providence, RI", 
                                "Charleston, SC", "Sioux Falls, SD", "Nashville, TN", 
                                "Houston, TX", "Salt Lake City, UT", "Burlington, VT", 
                                "Virginia Beach, VA", "Seattle-Tacoma, WA","Charleston, WV", 
                                "Milwaukee, WI", "Cheyenne, WY"), sub_code = rep(NA, 50))



for(i in 1:length(cities.needed[,2])){
  cities.needed[i,2] <- as.character(countries[
    which(countries$name == as.character(cities.needed[i,1])),
    2])
}


fcode(cities.needed)

rm(i)












#============================ queries to csvs function ========================= 


# What is the category id for sexual enhancement?
(categories$id[categories$name == "Sexual Enhancement"])
# [1] "1236"



# making a function to search through a bunch of city subcodes and print .csv
# files for each query


head(cities)



# loop to create .csv for every gtrends query
for(i in 1:length(cities$name)){

# i <- 1

# saving gtrends query to object
list <- gtrends(geo = as.character(cities[i,3]), 
               category = 1236, onlyInterest = TRUE)

obj <- list$interest_over_time

# saving object to .csv
write.csv(obj, paste(wd, "/data.output/", as.character(cities[i,1]), 
          ".csv", sep = ""))
  }  # end of loop



rm(i)


# checking work
file.exists(paste(wd, "/data/", deparse(substitute(se.us.over.1d)), ".csv", 
                  sep = "")) %>%   
  return()




# fuckin' around
city <- as.character(cities$sub_code[
  which(cities$name == "Washington, DC")])
int <- gtrends(geo = as.character(city), 
                category = 1236, onlyInterest = TRUE)
test <- (int$interest_over_time)
head(test)

class(test)







#============================ noaa =============================================
library(rnoaa)
station <- isd_stations_search(lat = 40.6943, lon = -73.9249, radius = 25)

station$usaf[1]

ny.weather <- lcd(station = paste(station$usaf[1], station$wban[1], sep = ""), 
                  year = 2018)




