#### Clipar e normalizar nuvens - Tanguro

library(lidR)
library(rgl)
library(rlas)
library(RCSF)

setwd("C:/Users/IPAM/Desktop/Ofinica LiDAR IPAM/Data/Cerrado/LAZ")
files = dir(pattern = '\\.laz$')
outDir.norm<-paste("E:/Dados LiDAR/Tanguro/Cerrado/Normalized")
outDir.clip<-paste("E:/Dados LiDAR/Tanguro/Clipped")

#Visualize cloud
cld<-lidR::readLAS(files[1])
plot(cld) ; axes3d(col='white')

?lasground
?grid_terrain

for(i in 1:length(files)){
  file = files[i]
  
  paste(i, '-', file) %>% print
  
  # read point cloud and slam file
  cld = lidR::readLAS(file)
  
  # classify ground points
  ground<-lasground(cld, csf(rigidness=3))
  
  # normalizar com base no DTM 
  dtm = grid_terrain(ground, 1, tin())
  cld.norm = lasnormalize(cld, dtm)
  cld.norm@header@PHB$`X scale factor` = .0001
  cld.norm@header@PHB$`Y scale factor` = .0001
  cld.norm@header@PHB$`Z scale factor` = .0001
  cld.norm@header@PHB$`X offset` = .0001
  cld.norm@header@PHB$`Y offset` = .0001
  
 
  #Clipar para a subparcela de 10x10m
  cld.clip<-lasclipRectangle(cld.norm, -5, -5, 5, 5)
    
  # name files to be written
  outLas.norm = paste(outDir.norm, sub('.laz','_norm.laz',file,fixed = T), sep='/')
  outLas.clip = paste(outDir.clip, sub('.laz','_clip.laz',file,fixed = T), sep='/')
  
  # write normalized files
  writeLAS(cld.norm, outLas.norm) 
  writeLAS(cld.clip, outLas.clip)
}
