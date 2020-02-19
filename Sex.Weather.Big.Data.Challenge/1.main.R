  # 
  # 
  #===== General ================================================================
# 
# This file contains code that pertains to the following aspects of the 
# sex-weather project:
#
# 1. Libraries
# 2. File Management
# 3. Global Variables
# 4. Run Custom Codes
# 
# 
R.version.string
# "R version 3.6.2 (2019-12-12)"

sessionInfo()  # for more info

#==== 1. Libraries==============================================================
# libraries needed for downloading gtrends and weather data

library(rnoaa)
library(gtrendsR)

# if you don't have the library yet, please install it! Either with the script 
# below, or with the "Install Packages..." option under the 'Tools' menu

# install.packages("rnoaa")
# install.packages("gtrendsR")


#======== 2. File Management ===================================================

# working directory
wd <- getwd()

# folders for storing data outputs and figures
# store names of the folders in an object
output.folder.names <- c("data.raw", "data.output", "figures")
# and make the folders if they don't exist yet. 
for(i in 1:length(output.folder.names)){ 
  if(file.exists(output.folder.names[i]) == FALSE) 
    dir.create(output.folder.names[i])
  }

# path to raw data folder
path.data.raw <- paste(wd,"/",output.folder.names[1],"/", sep = "")

# path to data output folder
path.data.output <- paste(wd,"/",output.folder.names[2],"/", sep = "")

# path to figures folder
path.figures <- paste(wd,"/",output.folder.names[3],"/", sep = "")


#===== 3. Global Variables =====================================================

countries <- gtrendsR::countries
categories <- gtrendsR::categories

# city populations, latitudes, and longitudes data modified from: 
# https://simplemaps.com/data/us-cities
cities <- read.csv("cities.csv",
                   stringsAsFactors = FALSE, 
                   strip.white = TRUE, 
                   na.strings = c(NA, ""))


# removing cities with populations under 50,000 
big.cities <- subset(cities, Population > 50000)


# What is the category id for sexual enhancement?
se <- categories$id[categories$name == "Sexual Enhancement"]
# [1] "1236"

#============================ 4. Run Custom Codes ==============================

# # Run Saving.Search.Data script
source("2.saving.search.data.R")

# # Run comparison script
source("3.comparison.R")

#============================ End of Main ======================================


