#Example code for calling TabShapeR commands in R

directory = gsub("")
file.names <- dir(directory, pattern = ".shp$")

for(i in 1:length(file.names))
  {
  x<-readOGR(dsn = directory, layer = substr(file.names[i],1,nchar(file.names[i])-4), verbose = FALSE)
  
  name<-print(substr(file.names[i],1,nchar(file.names[i])-4))
  
  endName<-print(paste(substr(file.names[i],1,nchar(file.names[i])-4), "Output", sep=""))
  
  
  if (is(x,"SpatialPolygonsDataFrame")){
    
    TabShapeRPolygons(directory,name,endName)
  
    } else if (is(x,"SpatialLinesDataFrame")){
      
      TabShapeRLines(directory,name,endName)
  
      } else if (is(x,"SpatialPointsDataFrame")){
        
        TabShapeRPoints(directory,name,endName)
  
        } else print("Something Else") 
  
  
  
  
  }

 
      #Delete the # in front of the appropriate command, then run code.  
   


      