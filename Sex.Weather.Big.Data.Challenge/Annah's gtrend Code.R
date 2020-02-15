install.packages("gtrendsR")
library(gtrendsR)

gtrends("border collie")

res <- gtrends(c("nhl", "nba"), geo = c("CA", "US"))
plot(res)

plot(die)

die2 <- gtrends("viagra", time = "2005-01-01 2020-02-12", geo = "CA")
plot(die2)

catagories <- gtrendsR::categories

?gtrends

data("countries")

new.york <- gtrends(geo="US-NY-501", time = "today 1-m", category = 1236)

plot(gtrends("NHL")$interest_over_time)

countries <- gtrendsR::countries

Cities2 <- countries$name[368479]

which(countries == "Portland, OR")

countries$name[368479]

cities <- subset(countries$name[368479])

cities <- countries$name[122789]

cities <- subset(0, 3)

length(countries)

cities <- subset(countries, name == "Portland, OR", "Austin, TX")

?subset

cities.needed <- NULL

cities.needed <- data.frame(name =
  c("Birmingham, AL", "Anchorage, AK", "Phoenix, AZ", "Little Rock, AR","Los Angeles, CA", 
                         "Dever, CO", "Bridgeport, CT", "Wilmington, DE", "Washington, DC", "Jacksonville, FL",
                         "Atlanta, GA", "Honolulu, HI", "Boise, ID", "Chicago, IL", "Indianapolis, IN", 
                         "Des Moines, IA", "Wichita, KS", "Louisville, KY", "New Orleans, LA", "Portland, ME",
                         "Baltimore, MD", "Boston, MA", "Detroit, MI", "Minneapolis, MN", "Jackson, MS", 
                         "Kansas City, MO", "Billings, MT", "Omaha, NE", "Las Vegas, NV", "Manchester, NH",
                         "Newark, NJ", "Albuquerque, NM", "New York City, NY", "Charlotte, NC", "Fargo, ND", 
                         "Columbus, OH", "Oklahoma City, OK", "Portland, OR", "Philadelphia, PA", 
                         "Providence, RI", "Charleston, SC", "Sioux Falls, SD", "Nashville, TN", "Houston, TX", 
                         "Salt Lake City, UT", "Burlington, VT", "Virginia Beach, VA", "Seattle, WA",
                         "Charleston, WV", "Milwaukee, WI", "Cheyenne, WY"))

names(cities.needed)[1] <- "names"

portland <- countries[countries$name == "Portland, OR", ]

#I need a function where I incert the name of the city and it gives me a list of all of the codes
#I then need another function that takes those code and runs a search for each code and saves that data

cities.desired <- rep(NA, 50)
city.codes <- rep(NA, 50)

find.codes1 <- function(city.name){
  df1 <- countries[countries$name == city.name,]
  df2 <- subset(df1, !is.na(df1[, 2]))}

testing <- find.codes1("Portland, OR")

find.codes2 <- function(city.name){
  df1 <- data.frame(Country.Code = character(51), City.Name = character(51))
  df1 <- countries[countries$name[which(countries$name == as.character(city.name))]]
  }

testinf1 <- find.codes2("Portland, OR")


city.name <- "Portland, OR"
bb <- countries[which(countries$name == as.character(city.name)),]

find.codes2 <- function(City.Name){
  df1 <- data.frame(Country.Code = character(51), City.Name = character(51))
  df1 <- countries[which(countries$name == city.name), c(2, 3)]
}

testing <- find.codes("Birmingham, AL")
View(testing)

find.codes2 <- function(city.name){
  df1 <- countries[which(countries$name == city.name), c(2, 3)]
}

find.codes2 <- (cities.needed[1]){
  df1 <- data.frame(Country.Code = character(51), cities.needed$names[1] = character(51))
  df1 <- countries[which(countries$name == city.name), c(2, 3)]
}

find.codes2 <- function(city.name){
  df1 <- countries[countries$name[which(countries$name == as.character(city.name))]]
}

testing <- find.codes2(cities.needed[1, 1])
testing

find.codes2 <- function(city.name){
  df1 <- data.frame(Country.Code = character(51), City.Name = character(51))
  df1 <- countries[countries$name[which(countries$name == as.character(city.name)),]]
}


cities.needed$name[1]

#WORKING - DO NOT TOUCH
i <- 1
find.codes2 <- function(city.name){
  df1 <- data.frame(Country.Code = character(51), City.Name = character(51))
  df1[i,] <- countries[which(countries$name == as.character(cities.needed$name[i])), c(2, 3)]
}

testing <- find.codes2("Portland, OR")
View(testing)
#WORKING - DO NOT TOUCH


#ALT WORKING
find.codes2 <- function(city.name){
  df1 <- countries[which(countries$name == city.name), c(2, 3)]
}

testing <- find.codes("Birmingham, AL")
View(testing)
#ALT WORKING



i <- 1
find.codes2 <- function(cities.needed){

# this generates the data frame you'll populate with names and sub codes  
    df1 <- data.frame(sub_code = rep(NA, 51), name = rep(NA, 51))

# this makes an object with the name and subcode of a city and puts it into the 
# ith row of the 1st and 2nd cols
    obj <- countries[which(countries$name == as.character(cities.needed$name[i])), c(2, 3)]
  df1[i,1] <- as.character(obj$sub_code)
  df1[i,2] <- as.character(obj$name)
}



# remove df1 to start clean
rm(df1)

test <- countries[which(countries$name == as.character(cities.needed$name[i])), c(2, 3)]

testing <- find.codes2(cities.needed)
View(testing)

rm(i)

#-------------------Trying to loop------------------------------------------

find.codes2 <- function(cities.needed){
  df1 <- data.frame(sub_code = rep(NA, 51), name = rep(NA, 51))
  for(i in length(cities.needed)){
  obj <- countries[which(countries$name == as.character(cities.needed$name[i])), c(2, 3)]
  df1[i,1] <- as.character(obj$sub_code)
  df1[i,2] <- as.character(obj$name)}}


find.codes2(cities.needed)
print(find.codes2(cities.needed))
#I am getting a null...?


