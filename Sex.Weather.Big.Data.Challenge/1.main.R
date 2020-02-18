# 
# 
#==== General ==================================================================
# 
# This file contains code that pertains to the following aspects of the 
# sex-weather project:
#
# 1. File Management
# 2. Libraries
# 3. Global Variables
# 4. Run Custom Codes
# 
# 
R.version.string
# "R version 3.6.2 (2019-12-12)"

sessionInfo()  # for more info

#==== 1. Libraries==============================================================
# libraries contain specific functions and they come in many shapaes an forms
# library("name of package")

library(rnoaa)
library(gtrendsR)
library(dplyr)


# if you don't have the library yet, install it! Either through the 'Tools' menu
# or install.packages("name of package")



#======== 2. File Management ===================================================

# working directory
wd <- getwd()

# names of folders for output data (figures,data output,data)
# store names of the folders in an object
output.folder.names <- c("figures", "data.output")
# and make the folders if they don't exit yet. No need to understand this now
for(i in 1:length(output.folder.names)) 
  if(file.exists(output.folder.names[i]) == FALSE) 
    dir.create(output.folder.names[i])

#path to figures folder
path.figures <- paste(wd,"/",output.folder.names[1],"/", sep = "")

#path to data folder
path.data <- paste(wd,"/",output.folder.names[2],"/", sep = "")

#===== 3. Global Variables =====================================================

countries <- gtrendsR::countries
categories <- gtrendsR::categories

# from: https://simplemaps.com/data/us-cities
cities <- read.csv("cities.csv",
                   stringsAsFactors = FALSE, 
                   strip.white = TRUE, 
                   na.strings = c(NA, ""))


# removing with populations under 50,000 
big.cities <- subset(cities, Population > 50000)


# What is the category id for sexual enhancement?
se <- categories$id[categories$name == "Sexual Enhancement"]
# [1] "1236"

#============================ 4. Run Custom Codes ==============================
# # Run Saving.Search.Data script
# source("saving.search.data.R")
# # Run comparison script 
# source("comparison.R")
#============================ End of Main ======================================



