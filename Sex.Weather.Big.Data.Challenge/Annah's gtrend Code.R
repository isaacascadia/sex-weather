install.packages("gtrendsR")
library(gtrendsR)

gtrends("border collie")

gtrends("Quest University")

gtrends("trump and putin")

gtrends("saxx underwear")

gtrends("jocko willink")

gtrends("how to build a bomb")

gtrends("race jokes", time = "today 1-m")

gtrends("suicide")

gtrends("apocalypse survival kit")

length(gtrends("corona virus"))

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

cities.needed <- data.frame(c("Birmingham, AL", "Anchorage, AK", "Phoenix, AZ", "Little Rock, AR","Los Angeles, CA", 
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

find.codes <- function(city.name){
  df1 <- countries[countries$name == city.name, ]
  df2 <- subset(df1, !is.na(df1[, 2]))}

testing <- find.codes("Portland, OR", portland.1, portland.2)



