




#====INDEX======================================================================






#======== File Management ======================================================

# names of folders for output data (figures,data output,data)
# store names of the folders in an object
output.folder.names <- c("Figures", "Data")
# and make the folders if they don't exit yet. No need to understand this now
for(i in 1:length(output.folder.names)) 
  if(file.exists(output.folder.names[i]) == FALSE) 
    dir.create(output.folder.names[i])

# Create Folder Paths
#Path to figures folder
path.figures <- paste(wd, "/", output.folder.names[1], "/", sep = "")
#Path to data folder
path.data <- paste(wd, "/", output.folder.names[2], "/", 
                          sep = "")


#Example of posting to the datafolder
write.csv(output.folder.names, paste(path.data.output, "uselessnames.csv"),
          row.names = FALSE)


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



