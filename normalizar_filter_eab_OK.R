#### Clipar e normalizar nuvens - Tanguro

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
  cld@header@PHB$`X scale factor` = .0001
  cld@header@PHB$`Y scale factor` = .0001
  cld@header@PHB$`Z scale factor` = .0001
  cld@header@PHB$`X offset` = .0001
  cld@header@PHB$`Y offset` = .0001
  # classify ground points
  ground<-classify_ground(cld, csf(rigidness=3))
  
  # normalizar com base no DTM 
  dtm = grid_terrain(ground, 1, tin())
  cld.norm = normalize_height(cld, dtm)
  
  #Clipar para a subparcela de 10x10m
  cld.clip<-clip_rectangle(cld.norm, -5, -5, 5, 5)
  
  # name files to be written
  outLas.norm = paste(outDir.norm, sub('.laz','_norm.laz',file,fixed = T), sep='/')
  outLas.clip = paste(outDir.clip, sub('.laz','_clip.laz',file,fixed = T), sep='/')
  
  # write normalized files
  writeLAS(cld.norm, outLas.norm) 
  writeLAS(cld.clip, outLas.clip)
}
