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

countries <- gtrendsR::countries






# making a function to search through a bunch 

city.list <- c("Seattle-Tacoma,WA", "Portland, OR")


for(i in 1:length(city.list)){
  
  city.list[i]
}











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



#============================ Playing around with noaa =========================
library(rnoaa)
station <- isd_stations_search(lat = 40.6943, lon = -73.9249, radius = 25)

station$usaf[1]

ny.weather <- lcd(station = paste(station$usaf[1], station$wban[1], sep = ""), 
                  year = 2018)




