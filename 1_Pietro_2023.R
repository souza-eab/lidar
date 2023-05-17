# Create your project in R or 
## Set your directory
setwd("D:/Lidar/data/tls/")

# Set your cores
Sys.setenv(R_NUM_THREADS = "8") # Set your (Cores - 1) (Allocate your Web)

# Libraries
library(lidR)
library(rgl)
library(rlas)
library(RCSF)
library(sf)
library(terra)
library(raster)

# Eg. 
## If you have multiple TLS it's fine to put the processing in a loop to perform them, but if it's just a given TLS - treat individually.
### Read and display a catalog of las files eg. P01F.las
files = dir(pattern = '\\.las$')

# Define your path output
outDir.norm<-paste("D:/Lidar/data/tls/Normalized")
outDir.clip<-paste("D:/Lidar/data/tls/Clipped")
outDir.chm <- paste("D:/Lidar/data/tls/chm_norm")


######################################################################
######################################################################
# Star your processing
# I always recommend at every step to check the data visualization and confirm data validity
######################################################################
######################################################################


#Visualize cloud
cld<-lidR::readLAS(files[1])
plot(cld) ; axes3d(col='white')


# Check validation data
las_check(cld)

# Checkpoints in the TLS below zero
#negative_points <- cld$Z < 0
#num_negative_points <- sum(negative_points)
#print(paste("Número de pontos negativos:", num_negative_points))

# Check your data
head(cld)

# Set the coordinate reference system (CRS)
crs <- "+proj=utm +zone=18 +datum=WGS84 +units=m +no_defs"  # Eg. CRS UTM zone 18
setCRS(cld, crs)

# After checking the data

## 1 - Filter duplicates
## cld = filter_duplicates(cld)
## 1.1 - Visualize your data 
plot(cld) ; axes3d(col='white')

# We continue with non-normalize data
#-------------------------------------------------------------

##############################################################
# A function to work around this problem is
##############################################################

# Work with 99 percent of the data
cld99 = quantile(cld$Z, 0.99)

# To aplly a function 'filter_poi'
# The function selects all points with height up to 99% in the cld
cld99_points <- filter_poi(cld, Z <= cld99)

# Return equal name for to apply function
cld <-  cld99_points

#-------------------------------------------------------------

############################################################
#### Main Function (loop)  - Use to process multiple files
############################################################
for(i in 1:length(files)){
  file = files[i]
  
  paste(i, '-', file) %>% print
  
  # read point cloud and slam file
  cld = lidR::readLAS(file)
  #cld@header@PHB$`X scale factor` = .0001 # Units of Measurement TLS = 0.0001
  #cld@header@PHB$`Y scale factor` = .0001
  #cld@header@PHB$`Z scale factor` = .0001
  #cld@header@PHB$`X offset` = .0001
  #cld@header@PHB$`Y offset` = .0001
  
  #### classify ground points
  ground<-classify_ground(cld, csf(rigidness=1)) #??classify_ground; set your algorithm 'lidR has pmf, csf and mcc'; parameters :: terrain (1)default (2)... (3)plane
  
  #### Generate Digital Terrain Model and Normalize based on the DTM
  dtm = grid_terrain(ground, 1, tin())  # grid_terrain; scale resolutoin, set your algorithm; 
  cld.norm = normalize_height(cld, dtm) # Normalize heigh
  
  
  #### BoundingBox
  #Clip para a subparcela de 10x10m
  #cld.clip<-clip_rectangle(cld.norm, -5, -5, 5, 5) 
  #chm <-  cld.clip
  #chm@header@crs$projargs <- "+init=epsg:4326" #Set your epsg;
  
  
  #### Canopy height model (CHM)
  #chm.grid <- grid_metrics(cld.norm, max(Z), 1, filter = NULL)
  b <- extent(chm) # BoundBox
  r <- raster(b, res = 1) #Your resolution
    
  m <- grid_metrics(chm, ~max(Z), r) # Eg. CHM 
  
  plot(m)
  plot(extent(m), add = T, col = "red", lwd = 2)
  
  colors <- height.colors(50)
  plot(chm, col=colors)
  
  # name files to be written
  outLas.norm = paste(outDir.norm, sub('.laz','_norm.laz',file,fixed = T), sep='/')
  outLas.clip = paste(outDir.clip, sub('.laz','_clip.laz',file,fixed = T), sep='/')
  outCHM.norm = paste(outDir.chm, sub('.tif','_chm.tif', file, fixed = T), sep = '/')
  
  # write normalized files
  writeLAS(cld.norm, outLas.norm) 
  writeLAS(cld.clip, outLas.clip)
  writeRaster(m, outCHM.norm, format="GTiff", overwrite=TRUE)
}

# Good luck
