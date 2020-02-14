# File structure for reproducibility
# Master project folder
#   R scripts
#     Data.manip.R
#     Figures.R
#     Functions.R
#     Analysis.R
#     Main 
#       Function at beginning to run "Functions" script 
#       SessionInfo()
#     Markup.R
# Data
#   Original data
#   Data.clean
#   Figures
#   Analysis.output
#   Paper (with markup)



################################# STARTUP ##############################


# set working directory
based <- getwd()
dir.create("climate.stuff")
wd <- paste(based, "/climate.stuff", sep = "")
wd <- setwd(wd)
list.files(wd)

# figures and data folders inside wd
dir.create("clim.figs")
dir.create("data")



# install packages
install.packages("weathercan")
install.packages("devtools")

# load packages
library(weathercan)
library(tidyr)
library(colorspace)


# look at help files within weathercan
vignette(package = "weathercan")



################################# DATA MANIP ##############################

# Looking for station and climate ids
stations_search("Vancouver", normals_only = TRUE, interval = "day")
stations_search("Squamish", normals_only = TRUE, interval = "day")
stations_search("Pemberton", normals_only = TRUE, interval = "day")
stations_search("Lillooet", normals_only = TRUE, interval = "day")

# station id download for squamish
squam <- weather_dl(336, start = "2018-01-01", end = "2019-12-31")
head(pemb)


# write .csv of station info
write.csv(x = squam, file = paste(wd, "/data/squam.weath.csv", sep = ""))



squam.clim <- normals_dl(climate_ids = "10476F0")
head(squam.clim)



# unnest normals (from tidy)
squam.norm <- unnest(squam.clim, normals)


################################# VISUALIZE #########################################


# start saving of pdf
pdf(paste(wd, "/clim.figs/squam.rainfall.pdf", sep = ""), 
    width = 5, height = 5)

# run plots
barplot(squam.norm$`precip_days_>=0.2`[1:12], 
        names.arg = squam.norm$period[1:12],
        las = 1, ylim = c(0, 30), 
        main = "Precipitation >= 0.2",
        ylab = "Days", xlab = "Month",
        col = rainbow_hcl(14))

barplot(squam.norm$rain_extreme_daily[1:12], 
        names.arg = squam.norm$period[1:12],
        las = 1, ylim = c(0, 200), 
        main = "Max Daily Rainfall",
        ylab = "Rainfall (mm)", xlab = "Month",
        col = rainbow_hcl(14))

# stop saving 
dev.off()

# is the file really there?
file.exists(paste(wd, "/clim.figs/squam.rainfall.pdf", sep = ""))



cor()

# SNACK TIIIIME!

#============================== The end ====================================
