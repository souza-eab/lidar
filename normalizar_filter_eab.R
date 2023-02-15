##Library
library(lidR)
library(sp)
library(rgl)
library(rlas)
library(RCSF)
library(mapview)

##Set your directory
setwd("D:/Trabalhando/Nuvens_IFG_UFG/XYZ/las/0_processing/04_LASheight")

## Read and display a catalog of las files eg. P01F.las
files = dir(pattern = '\\.las$')
outDir.norm<-paste("D:/Trabalhando/Nuvens IFG UFG/XYZ/las_filter/Normalized")
outDir.clip<-paste("D:/Trabalhando/Nuvens IFG UFG/XYZ/las_filter/Clipped")

#Visualize cloud #@ Parameter select
cld<-lidR::readLAS(files[27])

#Duplicated
las <-cld

#Validating lidar data
las_check(las)

#Plot
plot(las, color = "ScanAngleRank", bg = "white", axis = TRUE, legend = TRUE)
#plot(las, color ="RGB")
#plot(las, color = "Intensity", trim = 1800, bg = "white")


#Overlays
x <- plot(las, bg = "white", size = 3)
add_dtm3d(x, dtm)#inserir

x <- plot(las, bg = "white", size = 3)
add_treetops3d(x, ttops)


#nonveg <- filter_poi(las, Classification != LASHIGHVEGETATION)
#veg <- filter_poi(las, Classification == LASHIGHVEGETATION)
#x <- plot(nonveg, color = "Classification", bg = "white", size = 3)
#plot(veg, add = x)

offsets <- plot(las)
print(offsets)

# get the location of the trees
ttops <- find_trees(las, lmf(ws = 5),print(find_tress)) 

# extract the coordinates of the trees and
# apply the shift to display the lines
# in the rendering coordinate system
x <- coordinates(ttops)[,1] - offsets[1] 
y <- coordinates(ttops)[,2] - offsets[2] 
z <- ttops$Z

# Build a GL_LINES matrix for fast rendering
x <- rep(x, each = 2)
y <- rep(y, each = 2)
tmp <- numeric(2*length(z)) 
tmp[2*1:length(z)] <- z
z <- tmp
M <- cbind(x,y,z)

# plot the point cloud
offsets <- plot(las, bg = "white", size = 3)
add_treetops3d(offsets, ttops)
rgl::segments3d(M, col = "black", lwd = 2)

