#get latitude and longitude for "from"
library(zipcode)
library(ggmap)
library(maps)
library(geosphere)
library(plyr)
data(zipcode)
nsli_y <- read.csv("H:/data viz personal/R code/data/nsli_y_2015.csv", sep=",",head=TRUE)  
head(nsli_y)
nsli_y$Home.Postal.Code = clean.zipcodes(nsli_y$Home.Postal.Code)
nsli_y
nsli_y = merge(nsli_y, zipcode, by.x='Home.Postal.Code', by.y='zip')
head(nsli_y)
write.csv(nsli_y, file="H:/data viz personal/R code/data/nsli_y_geo.csv", row.names=FALSE)

#create to and from lines 

nsli_y <- read.csv("H:/python_scripts/nsli_y_geo.csv", sep=",",head=TRUE)  
head(nsli_y)
nsli_y <- na.omit(nsli_y)
head(nsli_y)
xlim <- c(-171.738281, 50.601563)
ylim <- c(12.039321, 71.856229)
map("world", col="grey50", fill=TRUE,  bg="black", lwd=0.05)
for (j in 1:length((nsli_y$Module.City)))
{
  a <- c(nsli_y[j,]$longitude, nsli_y[j,]$latitude)
  b <- c(nsli_y[j,]$module.long, nsli_y[j,]$module.lat)
  points <- gcIntermediate(a,b,n=10000,addStartEnd=TRUE, breakAtDateLine=TRUE, sp=TRUE)
  lines(points, col="white", lwd=0.5)
}

