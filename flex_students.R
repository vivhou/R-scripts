install.packages("maps") ## only do once
library(maps) ## do every time you want to use maps

map(database='state') ## blank map outline
map(database='state', col="#000000") ## blank map outline and color change

## some other options:
map('world')
map('usa')
map('states')

states <- read.csv("C:/Users/vhou/Desktop/docs/flex_students.csv") # data set of state populations and car accidents in one year

class(states)
dim(states)
head(states)

#since it's only 51 rows, might as well look at it
states


states$color <- NA
states$color[which(states$pop > 45)] <- "#13373e"
states$color[which(states$pop > 22 & states$pop  <= 45)] <- "#246571"
states$color[which(states$pop > 14 & states$pop  <= 22)] <- "#308898"
states$color[which(states$pop > 5 & states$pop  <= 14)] <- "#cae8ee"
states$color[which(states$pop <= 5)] <- "#7bc7d5"


## Look at names of the geographic areas
map("state")$names
map("state", plot=FALSE)$names

mapnames <- map("state", plot=FALSE)$names
mapnames_clean <- gsub(":.+","",mapnames) ## replace the colon, and everything after it (signified by . +), with nothing. This is a use of regex - or regular expressions. Very useful to learn for string manipulation.

m <- match(mapnames_clean, tolower(states$name))
color_final <- states$color[m]
dim(states)
head(states)


map("state",  fill=TRUE)
map("state",  fill=TRUE, col="blue")
map("state",  fill=TRUE, col=color_final, border=NA, resolution=0)
map("world", c("USA:Alaska"), boundary = TRUE, col='orange', add = TRUE, fill=TRUE )

pdf(file = "H:/data viz personal/my_plot.pdf") 
    dev.off() 

library(mapproj)

map('state', proj = 'bonne', param = 45, fill=TRUE, col=color_final, border=NA, resolution=0)  # Bonne equal-area projection of states
map("world", c("USA:Alaska"), boundary = TRUE, col='orange', add = TRUE, fill=TRUE )

