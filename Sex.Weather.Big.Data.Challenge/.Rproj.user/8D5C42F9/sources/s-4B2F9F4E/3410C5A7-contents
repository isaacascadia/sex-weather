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


# install gtrendsR package
install.packages("gtrendsR")

#open gtrendsR library
library(gtrendsR)


#============================ Searching for some data ==========================


# What is the category id for sexual enhancement?
(categories$id[categories$name == "Sexual Enhancement"])
# [1] "1236"

# save the gtrends query to an object
se.us.1d <- gtrends(keyword = "sex", geo = "US", time = "now 1-d",
                          gprop = c("web"),category = 1236, hl = "en-US", 
                          low_search_volume = FALSE,
                          cookie_url = "http://trends.google.com/Cookies/NID", 
                          tz = 0,onlyInterest = FALSE)

se.us.1d$interest_over_time


#============================ Saving dat data ==================================


write.csv(x = se.us.1d$interest_over_time, 
          file = paste(wd, "/data/se.us.over.1d.csv", sep = ""))
file.exists(paste(wd, "/data/se.us.over.1d.csv", sep = ""))



  
