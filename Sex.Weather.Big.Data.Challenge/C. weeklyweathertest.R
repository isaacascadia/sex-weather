df <- read.csv(paste(path.data,"Albany, NY.weather.csv", sep = ""),
               stringsAsFactors = FALSE, 
               strip.white = TRUE, 
               na.strings = c(NA, ""))

#remove blank values
df <- df[!(df$temperature== ""), ]
df <- df[!is.na(df$temperature), ]
#Only take data from source=7
df <- df[!(df$source== "4"), ]
df <- df[!(df$source== "6"), ]
#Remove "T" from time column and replace with ""
df$date <- sub(pattern = "T", replacement = " ",df$date)



#split date and time
df$Hours <- format(as.POSIXct(df$date, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%H:%M")
df$Dates <- format(as.Date(df$date,"%Y-%m-%d"), format = "%Y-%m-%d")
weeks<- seq(as.Date(df$Dates[1]),to=as.Date(df$Dates[nrow(df)]),by='week')


#paste weekly intervals next to each data point to group later
y=2
for(i in 1:nrow(df)){
 
    df$week[i] <- weeks[y]
    if(df$Dates[i]==weeks[y]){y=y+1}
  
  
}


####was finally making progress with this 
#was following the logic of the answer with 7 upvotes https://stackoverflow.com/questions/24645628/how-to-calculate-average-of-a-variable-by-hour-in-r
#was then going to build this into the loop that creates the weather files
#that way all of the data would be similar