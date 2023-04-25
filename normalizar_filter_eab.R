Sys.setenv(R_NUM_THREADS = "8") # Set your (Cores - 1) (Allocate your Web)


#### Clipar e normalizar nuvens 

library(lidR)
library(rgl)
library(rlas)
library(RCSF)

##Set your directory
setwd("D:/Trabalhando/Nuvens_IFG_UFG/XYZ/las")

## Read and display a catalog of las files eg. P01F.las
files = dir(pattern = '\\.las$')
outDir.norm<-paste("D:/Trabalhando/Nuvens_IFG_UFG/XYZ/las/Normalized")
outDir.clip<-paste("D:/Trabalhando/Nuvens_IFG_UFG/XYZ/las/Clipped")
outDir.chm <- paste("D:/Trabalhando/Nuvens_IFG_UFG/XYZ/las/chm_norm")

#Visualize cloud
cld<-lidR::readLAS(files[1])
plot(cld) ; axes3d(col='white')

#lasground
#grid_terrain

# Function 
for(i in 1:length(files)){
  file = files[i]
  
  paste(i, '-', file) %>% print
  
  # read point cloud and slam file
  cld = lidR::readLAS(file)
  cld@header@PHB$`X scale factor` = .0001 # Units of Measurement TLS = 0.0001
  cld@header@PHB$`Y scale factor` = .0001
  cld@header@PHB$`Z scale factor` = .0001
  cld@header@PHB$`X offset` = .0001
  cld@header@PHB$`Y offset` = .0001
  # classify ground points
  ground<-classify_ground(cld, csf(rigidness=3)) #??classify_ground; set your algorithm; parameters :: terrain
  
  # normalizar com base no DTM 
  dtm = grid_terrain(ground, 1, tin()) # ??grid_terrain; scale, set your algorithm; 
  cld.norm = normalize_height(cld, dtm) # Normalize heigh
  
  #Clip para a subparcela de 10x10m
  cld.clip<-clip_rectangle(cld.norm, -5, -5, 5, 5) 
  
  # ch
  chm <-  cld.clip
  #chm@header@crs$projargs <- "+init=epsg:4326" #Set your epsg; 
  #chm.grid <- grid_metrics(cld.norm, max(Z), 1, filter = NULL)
  b <- extent(chm) # BoundBox
  r <- raster(b, res = 1) #Your resolution
  m <- grid_metrics(chm, ~mean(Z), r) # Eg. CHM 
  
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
