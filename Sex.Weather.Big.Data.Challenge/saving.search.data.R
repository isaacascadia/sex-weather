# 
# 
# This script file contains code  for saving data.
# 
# 
# 
#============================ File Management ==================================

# directory stuff
wd <- getwd()

# create data directory
dir.create("data")


mydata <- read.csv("filename.csv", 
                   stringsAsFactors = FALSE, 
                   strip.white = TRUE, 
                   na.strings = c(NA, ""))



#============================ Searching for some data ==========================


# What is the category id for sexual enhancement?
(categories$id[categories$name == "Sexual Enhancement"])
# [1] "1236"


head(countries)
countries$sub_code[which(countries$name == "Detroit, MI")]



sea <- countries$sub_code[which(countries$name == "Seattle-Tacoma, WA")]



# save the gtrends query to an object
se.sea.5y <- gtrends(geo = as.character(sea), time = "today+5-y", 
                     category = 1236, onlyInterest = TRUE)

se.sea.over.5y <- se.sea.5y$interest_over_time







# making a function to search through a bunch 

cities.needed

for(i in 1:length(cities)){
obj <- gtrends(geo = as.character(cities.needed[i,2]), time = "today+5-y", category = 1236, onlyInterest = TRUE)
write.csv(obj)
  }


se.sea.5y$interest_over_time








#============================ Save dat data ====================================

# create a .csv from an object of queried data in "data" folder 
write.csv(x = se.us.1d$interest_over_time, 
          file = paste(wd, "/data/se.us.over.1d.csv", sep = ""))

# did write.csv() work?
file.exists(paste(wd, "/data/se.us.over.1d.csv", sep = ""))
# [1] TRUE



# making a function to automatically save query data based on a list of objects

fsave.data <- function(laundry){
  write.csv(x = laundry, 
                         # how to print object name in filename?
            file = paste(wd, "/data/", deparse(substitute(se.us.over.1d)), 
                                               ".csv", sep = ""))  
  file.exists(paste(wd, "/data/", deparse(substitute(se.us.over.1d)), ".csv", 
                                          sep = "")) %>%   
    return()
}

# testing the function
fsave.data(se.us.over.1d)



  


# loop that shit (forthcoming)
for(i in 1:length(laundry)){}
      





# for loop example

n.permut <- 1000
null.test.stats <- rep(NA, n.permut)

for(i in 1:n.permut){
  AB.shuffl <- sample(length(AB), replace = FALSE)
  # assign first nA to A.temp
  A.temp <- AB.shuffl[1:nA]
  # the rest of the reshuffled vector goes to B.temp
  B.temp <- AB.shuffl[-c(1:nA)]
  
  # calculate the test stats under the null hypothesis
  stats.diff.H0 <- mean(A.temp) - mean(B.temp)
  # store the stats.diffH0 in a storgae vector
  null.test.stats[i] <- stats.diff.H0
}


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


#============================ Playing around with noaa =========================
library(rnoaa)
station <- isd_stations_search(lat = 40.6943, lon = -73.9249, radius = 25)

station$usaf[1]

ny.weather <- lcd(station = paste(station$usaf[1], station$wban[1], sep = ""), 
                  year = 2018)




