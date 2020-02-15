




#====INDEX======================================================================






#======== File Management ======================================================

# working directory
wd <- getwd()

# names of folders for output data (figures,data output,data)
# store names of the folders in an object
output.folder.names <- c("figures", "data.output")
# and make the folders if they don't exit yet. No need to understand this now
for(i in 1:length(output.folder.names)) 
  if(file.exists(output.folder.names[i]) == FALSE) 
    dir.create(output.folder.names[i])




#====Libraries==================================================================
# libraries contain specific functions and they come in many shapaes an forms
# library("name of package")

library(rnoaa)
library(gtrendsR)
library(dplyr)

# if you don't have the library yet, install it! Either through the 'Tools' menu
# or install.packages("name of package")


#===== Global Variables =======================================================

countries <- gtrendsR::countries

cities <- read.csv("cities.csv",
                   stringsAsFactors = FALSE, 
                   strip.white = TRUE, 
                   na.strings = c(NA, ""))



