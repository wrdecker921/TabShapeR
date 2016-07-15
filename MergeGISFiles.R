library(plyr)
directory <- "C:/Users/william22859/Downloads/qgis_sample_data/qgis_sample_data/shapefiles/"
setwd(directory)
file.names <- dir(directory, pattern = ".csv$")
master<- data.frame(ObjectID = integer(),
                    Latitude = numeric(),
                    Longitude = numeric(),
                    Path = integer(),
                    SubID = integer(),
                    FileName = character())

output1 <- integer(length(file.names))
for(j in seq_along(output1)) 
    {
##assign(paste(substr(file.names[j],1,nchar(file.names[j])-4), j, sep="_"),NULL)

dummydata <- read.csv(file.names[j], header = T)
x<-dummydata[, c("ObjectID", "Latitude", "Longitude", "Path", "SubID")]
x$FileName <- file.names[j]
master <- rbind.fill(x,master)

}

write.csv(master, "C:/Users/william22859/Downloads/qgis_sample_data/qgis_sample_data/shapefiles/Testing/tabtestfile99.csv"
          , row.names = FALSE)
# 
# counter = 0
# output <-integer(length(master))
# for(i in seq_along(output)){
#   
#   currentID <- master$ObjectID[[i]]
#   previousID <- if(i==1){0}
#                 else{master$ObjectID[[i-1]]}
#   master$NewObjectID[[i]] <- if(currentID == previousID){counter}
#                                    else {
#                                      counter<- counter+1
#                                      counter
#                                    }                                    
#   
#   }
#   
# 
# 
# write.csv(master, "C:/Users/william22859/Downloads/qgis_sample_data/qgis_sample_data/shapefiles/Testing/tabtestfile.csv", row.names = FALSE)