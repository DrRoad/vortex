#data obtained from http://www.ers.usda.gov/dataFiles/CountyLevelDatasets/PovertyEstimates.xls

#setwd("vortex") #code will not run appropriately from another directory
library(rio)

download.file("http://www.ers.usda.gov/dataFiles/CountyLevelDatasets/PovertyEstimates.xls","raw_data/poverty_unemployment_med_income/PovertyEstimates.xls",method="curl")
pov.raw <- import("raw_data/poverty_unemployment_med_income/PovertyEstimates.xls")

pov <- pov.raw[-(1:(which(pov.raw[,1]=="FIPStxt")-1)),] #remove the rows above the column names, held comments from original excel file
colnames(pov) <- pov[which(pov[,1]=="FIPStxt"),] #adds rownames
if (which(pov$FIPStxt=="FIPStxt")!=0){pov <- pov[-which(pov$FIPStxt=="FIPStxt"),]} #if the names are still in a row, removes.
pov <- pov[-which(is.na(pov$Rural_urban_Continuum_Code_2003)),] #removes data for just states and misc census areas (leaves only counties)
if (which(names(pov)=="FIPStxt")!=0){names(pov)[which(names(pov)=="FIPStxt")] <- "state_county_fips"} #changes FIPS code column

#selecting desired data
categories <- c(
  "state_county_fips",
  "POVALL_2014",
  "PCTPOVALL_2014"
)

pov.clean.2014 <- pov[,categories]

write.csv(pov.clean.2014,"output/tidy_county_data/poverty_2014.csv",row.names=F) #writes out cleaned data
