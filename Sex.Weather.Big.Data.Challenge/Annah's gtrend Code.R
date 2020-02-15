install.packages("gtrendsR")
library(gtrendsR)

catagories <- gtrendsR::categories

cities.needed <- NULL

cities.needed <- c("Birmingham, AL", "Anchorage, AK", "Phoenix, AZ", "Little Rock-Pine Bluff, AR","Los Angeles, CA", 
                         "Denver, CO", "Hartford & New Haven, CT", "Washington, DC (Hagerstown, MD)", "Jacksonville, FL",
                         "Atlanta, GA", "Honolulu, HI", "Boise, ID", "Chicago, IL", "Indianapolis, IN", 
                         "Des Moines-Ames, IA", "Wichita-Hutchinson, KS", "Louisville, KY", "New Orleans, LA", "Portland-Auburn, ME",
                         "Baltimore, MD", "Boston, MA-Manchester, NH", "Detroit, MI", "Minneapolis-St. Paul, MN", "Jackson, MS", 
                         "Kansas City, MO", "Billings, MT", "Omaha, NE", "Las Vegas, NV", "Boston, MA-Manchester, NH",
                         "Albuquerque-Santa Fe, NM", "New York, NY", "Charlotte, NC", "US-ND-724", 
                         "Columbus, OH", "Oklahoma City, OK", "Portland, OR", "Philadelphia, PA", 
                         "Providence, RI", "Charleston, SC", "Sioux Falls, SD", "Nashville, TN", "Houston, TX", 
                         "Salt Lake City, UT", "Burlington, VT", "Virginia Beach, VA", "Seattle-Tacoma, WA",
                         "Charleston, WV", "Milwaukee, WI", "Cheyenne, WY")


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
  obj <- countries[which(countries$name == as.character(cities.needed[i])), c(2, 3)]
  df1[i,1] <- as.character(obj$sub_code)
  df1[i,2] <- as.character(obj$name)}}


find.codes2(cities.needed)
print(find.codes2(cities.needed))
#I am getting a null...?

#-------------------playing with loops------------------------------

for (i in cities.needed) {
print(i)  
}

fff <- NULL
for (i in cities.needed[1:length(cities.needed)]) {
  fff[i] <- cities.needed[i]
}

rm(fff)

fff <- NULL
i <- 1:51
fff[i] <- cities.needed[i]
print(fff)

obj <- countries[which(countries$name == as.character(cities.needed[2])), c(2, 3)]


find.codes2 <- function(cities.needed){
  df1 <- data.frame(sub_code = rep(NA, 51), name = rep(NA, 51))
  for (i in cities.needed[1:length(cities.needed)]) {
    obj <- countries[which(countries$name == as.character(cities.needed[i])), c(2, 3)]
    df1[i,1] <- as.character(obj$sub_code)
    df1[i,2] <- as.character(obj$name)}}


find.codes2(cities.needed)
print(find.codes2(cities.needed))

#---------------------new section------------------------------------

rm(fff)

fff <- NULL
i <- 1:51
fff[i] <- cities.needed[i]
print(fff)

#WORKING
df <- NULL
for(i in 1:51){
  df[i] <- cities.needed[i]}
print(df)
#WORKING

df1 <- NULL
for(i in 1:51){
  df1[i] <- data.frame(cities.needed[i])}
print(df1)

rm(df1)

df1 <- NULL
for(i in 1:(length(cities.needed))){
  df1[i] <- list(cities.needed[i])}

find.codes2 <- function(cities.needed){
  df <- NULL
  for(i in 1:(length(cities.needed))){
    obj <- countries[which(countries$name == as.character(cities.needed[i])), c(2,3)]
    df1[i,1] <- as.character(obj$sub_code)
    df1[i,2] <- as.character(obj$name)}}

find.codes2(cities.needed)

i=1
df1[i] <- 005















