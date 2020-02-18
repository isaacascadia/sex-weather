#Intsall and pull database
install.packages("gtrendsR")
library(gtrendsR)

#Pull cataogries data frame from gtrends
catagories <- gtrendsR::categories

#Pull countries data frame from gtrends
countries <- gtrendsR::countries

#figuring out how to search
#key word search
gtrends("border collie")
#location search
gtrends("border collie", geo = "US")
#time search (the last hour)
gtrends("border collie", geo = "US", time = "now 1-H")
#catagory search (886=dogs) where timeframe = the last month
gtrends(geo="US", time = "today 1-m", 
                    category = 886)

length(cities.needed)

#First interation of a functions

find.codes1 <- function(city.name){
  df1 <- countries[which(countries$name == city.name), c(2, 3)]
}

testing <- find.codes1("Birmingham, AL")
View(testing)


#This is bewteen having to give it a city name manually
#and setting it up for a loop
i <- 1
find.codes1 <- function(city.name){
  df1 <- data.frame(Country.Code = character(51), City.Name = character(51))
  df1[i,] <- countries[which(countries$name == 
                               as.character(cities.needed$name[i])), c(2, 3)]
}

testing <- find.codes1("Portland, OR")
View(testing)


#First real attempt at automation
i <- 1
find.codes1 <- function(cities.needed){

# this generates the data frame you'll populate with names and sub codes  
    df1 <- data.frame(sub_code = rep(NA, 51), name = rep(NA, 51))

# this makes an object with the name and subcode of a city and puts it into the 
# ith row of the 1st and 2nd cols
  obj <- countries[which(countries$name == 
                           as.character(cities.needed$name[i])), c(2, 3)]
  df1[i,1] <- as.character(obj$sub_code)
  df1[i,2] <- as.character(obj$name)
}

#remove df1 from memory to start trial and error clean
rm(df1)

#playing with i
test <- countries[which(countries$name == as.character(cities.needed$name[i])),
                  c(2, 3)]

testing <- find.codes1(cities.needed)
View(testing)

rm(i)

#-------------------Trying to loop------------------------------------------

find.codes2 <- function(cities.needed){
  df1 <- data.frame(sub_code = rep(NA, 51), name = rep(NA, 51))
  for(i in length(cities.needed)){
  obj <- countries[which(countries$name == as.character(cities.needed[i])), 
                   c(2, 3)]
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

obj <- countries[which(countries$name == as.character(cities.needed[2])), 
                 c(2, 3)]


#Trying to loop gain
find.codes2 <- function(cities.needed){
  df1 <- data.frame(sub_code = rep(NA, 51), name = rep(NA, 51))
  for (i in cities.needed[1:length(cities.needed)]) {
    obj <- countries[which(countries$name == as.character(cities.needed[i])), 
                     c(2, 3)]
    df1[i,1] <- as.character(obj$sub_code)
    df1[i,2] <- as.character(obj$name)}}


find.codes2(cities.needed)
print(find.codes2(cities.needed))

#Playing with loops again
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

#Trying to improve
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
    obj <- countries[which(countries$name == as.character(cities.needed[i])), 
                     c(2,3)]
    df1[i,1] <- as.character(obj$sub_code)
    df1[i,2] <- as.character(obj$name)}}

find.codes2(cities.needed)

#-------------making a function that searches with city codes---------------

#first attempt at a function to search for out catagory in the last
#5 years with a given city code
sex.search <- function(city.code){
  gtrends(geo = city.code, time = "today+5-y", category = 1236)}

#testing
sex.search("US-OR-820")
#works


#------------------------------Adapting Issac's code-----------------------

for(i in 1:(length(cities$name)/2)){
  list <- gtrends(geo = as.character(cities[i,3]), 
                  category = 1236, onlyInterest = TRUE)
  obj <- list$interest_over_time
  write.csv(obj, paste(wd, "/data.output/", as.character(cities[i,1]), 
                       ".csv", sep = ""))}



for(i in (length(cities$name)/2):length(cities$name)){
  list <- gtrends(geo = as.character(cities[i,3]), 
                  category = 1236, onlyInterest = TRUE)
  obj <- list$interest_over_time
  write.csv(obj, paste(wd, "/data.output/", as.character(cities[i,1]), 
                       ".csv", sep = ""))}


#-------------removing the cities with the 9 smallest populations-------------

a <- matrix(1:9, nrow=3)
b <- subset(a, a[ , 3] < 9)

big.cities <- subset(cities, Population > 50000)


#rerunning Issac's code with big.cities
for(i in 1:(length(big.cities$name)/2)){
  list <- gtrends(geo = as.character(big.cities[i,3]), 
                  category = 1236, onlyInterest = TRUE)
  obj <- list$interest_over_time
  write.csv(obj, paste(wd, "/data.output/", as.character(big.cities[i,1]), 
                       ".csv", sep = ""))}



for(i in (length(big.cities$name)/2):length(big.cities$name)){
  list <- gtrends(geo = as.character(big.cities[i,3]), 
                  category = 1236, onlyInterest = TRUE)
  obj <- list$interest_over_time
  write.csv(obj, paste(wd, "/data.output/", as.character(big.cities[i,1]), 
                       ".csv", sep = ""))}

gtrends(geo = "US-AL-630", time = "2014-01-01 2014-09-01", category = 1236, 
        onlyInterest = TRUE)


#------------------adjusting loop to run 6 month at a time--------------------

for(i in 1:(length(big.cities$name)/2)){
  list1 <- gtrends(geo = as.character(big.cities[i,3]), 
                   category = 1236,
                   time = "2018-01-01 2018-06-30",
                   onlyInterest = TRUE)
  list2 <- gtrends(geo = as.character(big.cities[i,3]), 
                   category = 1236,
                   time = "2018-07-01 2018-12-31",
                   onlyInterest = TRUE)
  iot <- rbind(list1$interest_over_time, list2$interest_over_time)
  write.csv(iot, paste(wd, "/data.output/", as.character(big.cities[i,1]), 
                       ".gtrends", ".csv", sep = ""))
  }



for(i in (length(big.cities$name)/2):length(big.cities$name)){
  list1 <- gtrends(geo = as.character(big.cities[i,3]), 
                   category = 1236,
                   time = "2018-01-01 2018-06-30",
                   onlyInterest = TRUE)
  list2 <- gtrends(geo = as.character(big.cities[i,3]), 
                   category = 1236,
                   time = "2018-07-01 2018-12-31",
                   onlyInterest = TRUE)
  iot <- rbind(list1$interest_over_time, list2$interest_over_time)
  write.csv(iot, paste(wd, "/data.output/", as.character(big.cities[i,1]), 
                       ".gtrends", ".csv", sep = ""))
  }






  list1 <- gtrends(geo = as.character(big.cities[i,3]), 
                   category = 1236,
                   time = "2018-01-01 2018-06-30",
                   onlyInterest = TRUE)
  list2 <- gtrends(geo = as.character(big.cities[i,3]), 
                   category = 1236,
                   time = "2018-07-01 2018-12-31",
                   onlyInterest = TRUE)
  iot <- rbind(list1$interest_over_time, list2$interest_over_time)
  write.csv(iot, paste(wd, "/data.output/", as.character(big.cities[i,1]), 
                       ".gtrends", ".csv", sep = ""))


class(iot)  
rm(iot)

head(list1$interest_over_time)
nrow(list1$interest_over_time)
nrow(list2$interest_over_time)

