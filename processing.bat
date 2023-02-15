::###--------------------------------------------------------------------------------------------------------###
::#----------------------------------------------------------------------------------------------------------###
::# SILVA, C. A. (2017)                                                                                      ###
::# Ph.D Student at University of Idaho                                                                      ###
::# Rocky Mountain Reserach Station- RMRS                                                                    ###
::# US Forest Service - USDA                                                                                 ###
::# Moscow - Idaho                                                                                           ###
::# carlos_engflorestal@outlook.com.br                                                                       ###
::# Skype: flowds                                                                                            ###
::#----------------------------------------------------------------------------------------------------------###
::#----------------------------------------------------------------------------------------------------------###

:: #**************************************************************************************************#
:: #------------------------------- Lidar data processing ---------------------------# 
:: #-------------------------------------- FUSION/LDV ------------------------------------------------#
:: #**************************************************************************************************#

:: Obs: Ctrl+Q to active command line and F5 to run the data processing

:: #--------------------------------------------------------------------------------------------------#
:: # A) ############ Directory #############
:: #--------------------------------------------------------------------------------------------------#
 
:: FUSION/LDV
:: set FUSION_DIR=%FUSION_DIR%;C:\FUSION\
PATH="C:\FUSION";%PATH%

:: Processing folder :: This is the output folder
set PROD_DIR=D:\Trabalhando\Nuvens_IFG_UFG\XYZ\las\0_processing
cd %PROD_DIR%


:: lidar data  :: This is where your lidar clouds are stored. They must be in laz format.
set LAS_DIR=D:\Trabalhando\Nuvens_IFG_UFG\XYZ\las

:: Project name 
:: set PROJ= IFG_UFG

:: #Shapefile field plots  ::In case you want to cut your clouds by a shapefile#
:: #set SHP=C:\Lidar_workshop_ESALQ\02_data\03_plot_shapefiles\CapitolForest_plots_simulation.shp#

:: #--------------------------------------------------------------------------------------------------#
:: # B) ############ Processing #############
:: #--------------------------------------------------------------------------------------------------#
 
:: 1) # Catalog- LiDAR Overview: Produces a set of descriptive reports describing several important characteristics of LIDAR data sets
mkDir 00_catalog
catalog /density:5,5,10 %LAS_DIR%\*.las %PROD_DIR%\00_catalog\%PROJ%


:: 2) # GroundFilter: GroundFilter is is designed to filter a cloud of LIDAR returns to identify those returns that lie on the probable ground surface (bare-earth points)
:: 2_1 # Check parameters
mkDir 01_groundfilter
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P01F_ground.las 5 %LAS_DIR%\P01F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P02C_ground.las 5 %LAS_DIR%\P02C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P02F_ground.las 5 %LAS_DIR%\P02F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P03C_ground.las 5 %LAS_DIR%\P03C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P03F_ground.las 5 %LAS_DIR%\P03F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P04C_ground.las 5 %LAS_DIR%\P04C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P04F_ground.las 5 %LAS_DIR%\P04F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P05C007_ground.las 5 %LAS_DIR%\P05C007.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P05F006_ground.las 5 %LAS_DIR%\P05F006.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P07C_ground.las 5 %LAS_DIR%\P07C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P07F_ground.las 5 %LAS_DIR%\P07F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P08C_ground.las 5 %LAS_DIR%\P08C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P08F_ground.las 5 %LAS_DIR%\P08F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P09C_ground.las 5 %LAS_DIR%\P09C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P09F_ground.las 5 %LAS_DIR%\P09F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P10C_ground.las 5 %LAS_DIR%\P10C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P10F_ground.las 5 %LAS_DIR%\P10F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P11C_ground.las 5 %LAS_DIR%\P11C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P11F_ground.las 5 %LAS_DIR%\P11F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P12C_ground.las 5 %LAS_DIR%\P12C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P12F_ground.las 5 %LAS_DIR%\P12F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P13C_ground.las 5 %LAS_DIR%\P13C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P13F_ground.las 5 %LAS_DIR%\P13F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P15C_ground.las 5 %LAS_DIR%\P15C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P15F_ground.las 5 %LAS_DIR%\P15F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P17C_ground.las 5 %LAS_DIR%\P17C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P17F_ground.las 5 %LAS_DIR%\P17F.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P20C_ground.las 5 %LAS_DIR%\P20C.las
groundfilter /smooth:8 %PROD_DIR%\01_groundFilter\P20F_ground.las 5 %LAS_DIR%\P20F.las



:: 3) # Digital terrain model (DTM): Gridded surface model using collections of random points.
:: 3) # Verificar parameters da questão V/H
:: mkDir 02_dtm
::GridSurfaceCreate %PROD_DIR%\02_dtm\%PROJ%_dtm.dtm 1 M M 1 10 2 2 %PROD_DIR%\Groundfilter\%PROJ%_ground.laz
::dtm2ascii %PROD_DIR%\02_dtm\%PROJ%_dtm.dtm


GridSurfaceCreate %PROD_DIR%\02_dtm\P01F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P01F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P01F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P02C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P02C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P02C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P02F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P02F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P02F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P03C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P03C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P03C_dtm.dtm 
GridSurfaceCreate %PROD_DIR%\02_dtm\P03F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P03F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P03F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P04C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P04C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P04C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P04F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P04F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P04F_dtm.dtm 
GridSurfaceCreate %PROD_DIR%\02_dtm\P05C007_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P05C007_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P05C007_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P05F006_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P05F006_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P05F006_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P0C007_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P0C007_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P0C007_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P0F006_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P0F006_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P0F006_dtm.dtm 
GridSurfaceCreate %PROD_DIR%\02_dtm\P07C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P07C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P07C_dtm.dtm 
GridSurfaceCreate %PROD_DIR%\02_dtm\P07F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P07F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P07F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P08C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P08C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P08C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P08F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P08F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P08F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P09C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P09C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P09C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P09F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P09F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P09F_dtm.dtm 
GridSurfaceCreate %PROD_DIR%\02_dtm\P10C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P10C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P10C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P10F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P10F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P10F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P11C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P11C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P11C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P11F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P11F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P11F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P12C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P12C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P12C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P12F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P12F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P12F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P13C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P13C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P13C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P13F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P13F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P13F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P15C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P15C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P15C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P15F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P15F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P15F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P17C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P17C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P17C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P17F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P17F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P17F_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P20C_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P20C_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P20C_dtm.dtm
GridSurfaceCreate %PROD_DIR%\02_dtm\P20F_dtm.dtm 1 M M 1 0 0 0 %PROD_DIR%\01_groundFilter\P20F_ground.las
dtm2ascii %PROD_DIR%\02_dtm\P20F_dtm.dtm

:: 4) # Digital surface Model (DSM): Creates a canopy surface model using a LIDAR point cloud
:: mkDir 03_dsm
:: canopymodel %PROD_DIR%\03_dsm\%PROJ%_dsm.dtm 1 M M 1 10 2 2 %LAS_DIR%\*.laz
:: dtm2ascii %PROD_DIR%\03_dsm\%PROJ%_dsm.dtm

canopymodel %PROD_DIR%\03_dsm\P01F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P01F.las
dtm2ascii %PROD_DIR%\03_dsm\P01F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P02C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P02C.las
dtm2ascii %PROD_DIR%\03_dsm\P02C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P02F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P02F.las
dtm2ascii %PROD_DIR%\03_dsm\P02F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P03C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P03C.las
dtm2ascii %PROD_DIR%\03_dsm\P03C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P03F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P03F.las
dtm2ascii %PROD_DIR%\03_dsm\P03F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P04C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P04C.las
dtm2ascii %PROD_DIR%\03_dsm\P04C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P04F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P04F.las
dtm2ascii %PROD_DIR%\03_dsm\P04F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P05C007_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P05C007.las
dtm2ascii %PROD_DIR%\03_dsm\P05C007_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P05F006_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P05F006.las
dtm2ascii %PROD_DIR%\03_dsm\P05F006_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P07C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P07C.las
dtm2ascii %PROD_DIR%\03_dsm\P07C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P07F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P07F.las
dtm2ascii %PROD_DIR%\03_dsm\P07F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P08C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P08C.las
dtm2ascii %PROD_DIR%\03_dsm\P08C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P08F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P08F.las
dtm2ascii %PROD_DIR%\03_dsm\P08F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P09C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P09C.las
dtm2ascii %PROD_DIR%\03_dsm\P09C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P09F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P09F.las
dtm2ascii %PROD_DIR%\03_dsm\P09F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P10C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P10C.las
dtm2ascii %PROD_DIR%\03_dsm\P10C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P10F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P10F.las
dtm2ascii %PROD_DIR%\03_dsm\P10F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P11C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P11C.las
dtm2ascii %PROD_DIR%\03_dsm\P11C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P11F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P11F.las
dtm2ascii %PROD_DIR%\03_dsm\P11F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P12C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P12C.las
dtm2ascii %PROD_DIR%\03_dsm\P12C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P12F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P12F.las
dtm2ascii %PROD_DIR%\03_dsm\P12F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P13C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P13C.las
dtm2ascii %PROD_DIR%\03_dsm\P13C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P13F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P13F.las
dtm2ascii %PROD_DIR%\03_dsm\P13F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P15C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P15C.las
dtm2ascii %PROD_DIR%\03_dsm\P15C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P15F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P15F.las
dtm2ascii %PROD_DIR%\03_dsm\P15F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P17C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P17C.las
dtm2ascii %PROD_DIR%\03_dsm\P17C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P17F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P17F.las
dtm2ascii %PROD_DIR%\03_dsm\P17F_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P20C_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P20C.las
dtm2ascii %PROD_DIR%\03_dsm\P20C_dsm.dtm
canopymodel %PROD_DIR%\03_dsm\P20F_dsm.dtm 1 M M 1 0 0 0 %LAS_DIR%\P20F.las
dtm2ascii %PROD_DIR%\03_dsm\P20F_dsm.dtm



:: 5) # Normalization of liDAR data: Creates sub-samples of LIDAR data for various analysis tasks. However, this case it is used to normalize of LiDAR data. 
:: mkDir 04_LASheight
:: ClipData /dtm:%PROD_DIR%\02_dtm\%PROJ%_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\*.laz %PROD_DIR%\04_LASheight\%PROJ%_height.laz 487327.45 5189116.07 488628.44 5190042.93  
:: ClipData [switches] InputSpecifier SampleFile [MinX MinY MaxX MaxY]


:: Função -> Arquivo ->                      Switch Height ->         Nuvem de pontos -> Output ->                               Switch Parametros -> Catalog
ClipData /dtm:%PROD_DIR%\02_dtm\P01F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P01F.las %PROD_DIR%\04_LASheight\P01F_height.las -23.57 -22.02 27.19 31.89
ClipData /dtm:%PROD_DIR%\02_dtm\P02C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P02C.las %PROD_DIR%\04_LASheight\P02C_height.las -35.57 -27.91 20.05 34.22
ClipData /dtm:%PROD_DIR%\02_dtm\P02F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P02F.las %PROD_DIR%\04_LASheight\P02F_height.las -42.58 -48.09 29.48 37.51
ClipData /dtm:%PROD_DIR%\02_dtm\P03C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P03C.las %PROD_DIR%\04_LASheight\P03C_height.las -46.79 -29.54 28.21 30.00
ClipData /dtm:%PROD_DIR%\02_dtm\P03F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P03F.las %PROD_DIR%\04_LASheight\P03F_height.las -42.58 -48.09 29.48 27.51
ClipData /dtm:%PROD_DIR%\02_dtm\P04C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P04C.las %PROD_DIR%\04_LASheight\P04C_height.las -69.41 -32.45 35.19 65.92
ClipData /dtm:%PROD_DIR%\02_dtm\P04F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P04F.las %PROD_DIR%\04_LASheight\P04F_height.las -14.95 -35.24 24.40 26.28
ClipData /dtm:%PROD_DIR%\02_dtm\P05C007_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P05C007.las %PROD_DIR%\04_LASheight\P05C007_height.las -23.63 -24.63 24.33 16.52
ClipData /dtm:%PROD_DIR%\02_dtm\P05F006_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P05F006.las %PROD_DIR%\04_LASheight\P05F006_height.las -25.34 -31.65 61.01 45.21
ClipData /dtm:%PROD_DIR%\02_dtm\P07C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P07C.las %PROD_DIR%\04_LASheight\P07C_height.las -44.36 -62.17 69.76 29.85
ClipData /dtm:%PROD_DIR%\02_dtm\P07F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P07F.las %PROD_DIR%\04_LASheight\P07F_height.las -18.73 -26.85 27.49 29.13
ClipData /dtm:%PROD_DIR%\02_dtm\P08C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P08C.las %PROD_DIR%\04_LASheight\P08C_height.las -27.09 -20.22 52.32 27.12
ClipData /dtm:%PROD_DIR%\02_dtm\P08F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P08F.las %PROD_DIR%\04_LASheight\P08F_height.las -31.53 -35.33 28.80 42.70
ClipData /dtm:%PROD_DIR%\02_dtm\P09C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P09C.las %PROD_DIR%\04_LASheight\P09C_height.las -22.92 -22.54 40.55 22.20
ClipData /dtm:%PROD_DIR%\02_dtm\P09F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P09F.las %PROD_DIR%\04_LASheight\P09F_height.las -39.44 -32.96 39.13 33.87
ClipData /dtm:%PROD_DIR%\02_dtm\P10C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P10C.las %PROD_DIR%\04_LASheight\P10C_height.las -58.59 -37.71 61.33 44.17
ClipData /dtm:%PROD_DIR%\02_dtm\P10F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P10F.las %PROD_DIR%\04_LASheight\P10F_height.las -18.75 -18.06 20.64 26.13
ClipData /dtm:%PROD_DIR%\02_dtm\P11C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P11C.las %PROD_DIR%\04_LASheight\P11C_height.las -34.21 -41.40 55.01 49.56
ClipData /dtm:%PROD_DIR%\02_dtm\P11F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P11F.las %PROD_DIR%\04_LASheight\P11F_height.las -19.92 -15.36 21.21 19.12
ClipData /dtm:%PROD_DIR%\02_dtm\P12C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P12C.las %PROD_DIR%\04_LASheight\P12C_height.las -35.92 -23.95 29.06 21.80
ClipData /dtm:%PROD_DIR%\02_dtm\P12F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P12F.las %PROD_DIR%\04_LASheight\P12F_height.las -49.89 -45.12 44.41 36.70
ClipData /dtm:%PROD_DIR%\02_dtm\P13C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P13C.las %PROD_DIR%\04_LASheight\P13C_height.las -48.18 -30.96 34.82 56.91
ClipData /dtm:%PROD_DIR%\02_dtm\P13F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P13F.las %PROD_DIR%\04_LASheight\P13F_height.las -21.98 -25.85 28.14 27.84
ClipData /dtm:%PROD_DIR%\02_dtm\P15C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P15C.las %PROD_DIR%\04_LASheight\P15C_height.las -30.79 -31.19 37.83 35.49
ClipData /dtm:%PROD_DIR%\02_dtm\P15F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P15F.las %PROD_DIR%\04_LASheight\P15F_height.las -23.70 -23.32 25.68 23.74
ClipData /dtm:%PROD_DIR%\02_dtm\P17C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P17C.las %PROD_DIR%\04_LASheight\P17C_height.las -29.82 -33.26 28.98 25.74
ClipData /dtm:%PROD_DIR%\02_dtm\P17F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P17F.las %PROD_DIR%\04_LASheight\P17F_height.las -39.30 -34.46 33.97 56.10
ClipData /dtm:%PROD_DIR%\02_dtm\P20C_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P20C.las %PROD_DIR%\04_LASheight\P20C_height.las -33.02 -53.75 27.39 37.46
ClipData /dtm:%PROD_DIR%\02_dtm\P20F_dtm.dtm /height /zmin:0 /zmax:80 %LAS_DIR%\P20F.las %PROD_DIR%\04_LASheight\P20F_height.las -23.98 -39.36 36.48 28.20



:: 5) # Canopy Height Model (CHM): Creates a canopy height model using a LIDAR point cloud
:: mkDir 05_chm
:: canopymodel %PROD_DIR%\05_chm\%PROJ%_chm.dtm 1 M M 1 10 2 2 %PROD_DIR%\04_LASheight\%PROJ%_height.laz
:: dtm2ascii %PROD_DIR%\05_chm\%PROJ%_chm.dtm
:: default parameters


canopymodel %PROD_DIR%\05_chm\P01F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P01F_height.las
dtm2ascii %PROD_DIR%\05_chm\P01F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P02C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P02C_height.las
dtm2ascii %PROD_DIR%\05_chm\P02C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P02F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P02F_height.las
dtm2ascii %PROD_DIR%\05_chm\P02F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P03C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P03C_height.las
dtm2ascii %PROD_DIR%\05_chm\P03C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P03F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P03F_height.las
dtm2ascii %PROD_DIR%\05_chm\P03F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P04C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P04C_height.las
dtm2ascii %PROD_DIR%\05_chm\P04C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P04F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P04F_height.las
dtm2ascii %PROD_DIR%\05_chm\P04F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P05C007_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P05C007_height.las
dtm2ascii %PROD_DIR%\05_chm\P05C007_chm.dtm
canopymodel %PROD_DIR%\05_chm\P05F006_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P05F006_height.las
dtm2ascii %PROD_DIR%\05_chm\P05F006_chm.dtm
canopymodel %PROD_DIR%\05_chm\P07C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P07C_height.las
dtm2ascii %PROD_DIR%\05_chm\P07C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P07F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P07F_height.las
dtm2ascii %PROD_DIR%\05_chm\P07F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P08C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P08C_height.las
dtm2ascii %PROD_DIR%\05_chm\P08C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P08F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P08F_height.las
dtm2ascii %PROD_DIR%\05_chm\P08F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P09C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P09C_height.las
dtm2ascii %PROD_DIR%\05_chm\P09C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P09F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P09F_height.las
dtm2ascii %PROD_DIR%\05_chm\P09F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P10C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P10C_height.las
dtm2ascii %PROD_DIR%\05_chm\P10C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P10F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P10F_height.las
dtm2ascii %PROD_DIR%\05_chm\P10F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P11C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P11C_height.las
dtm2ascii %PROD_DIR%\05_chm\P11C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P11F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P11F_height.las
dtm2ascii %PROD_DIR%\05_chm\P11F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P12C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P12C_height.las
dtm2ascii %PROD_DIR%\05_chm\P12C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P12F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P12F_height.las
dtm2ascii %PROD_DIR%\05_chm\P12F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P13C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P13C_height.las
dtm2ascii %PROD_DIR%\05_chm\P13C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P13F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P13F_height.las
dtm2ascii %PROD_DIR%\05_chm\P13F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P15C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P15C_height.las
dtm2ascii %PROD_DIR%\05_chm\P15C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P15F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P15F_height.las
dtm2ascii %PROD_DIR%\05_chm\P15F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P17C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P17C_height.las
dtm2ascii %PROD_DIR%\05_chm\P17C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P17F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P17F_height.las
dtm2ascii %PROD_DIR%\05_chm\P17F_chm.dtm
canopymodel %PROD_DIR%\05_chm\P20C_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P20C_height.las
dtm2ascii %PROD_DIR%\05_chm\P20C_chm.dtm
canopymodel %PROD_DIR%\05_chm\P20F_chm.dtm 1 M M 1 0 0 0 %PROD_DIR%\04_LASheight\P20F_height.las
dtm2ascii %PROD_DIR%\05_chm\P20F_chm.dtm


:: 6) # PolyclipDATA: clips point data (LAS) using polygons stored in ESRI shapefiles - Use it to clip the sample plots
::mkDir 06_polyclipdata	
::PolyClipData /multifile /shape:1,* %SHP% %PROD_DIR%\06_polyclipdata\%PROJ%.las %PROD_DIR%\04_LASheight\%PROJ%_height.laz


:: 7) # CloudMetrics: Computes a variety of statistical parameters describing a LIDAR data set
mkDir 07_cloudmetrics
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P01F_height.las %PROD_DIR%\07_cloudmetrics\P01F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P02C_height.las %PROD_DIR%\07_cloudmetrics\P02C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P02F_height.las %PROD_DIR%\07_cloudmetrics\P02F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P03C_height.las %PROD_DIR%\07_cloudmetrics\P03C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P03F_height.las %PROD_DIR%\07_cloudmetrics\P03F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P04C_height.las %PROD_DIR%\07_cloudmetrics\P04C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P04F_height.las %PROD_DIR%\07_cloudmetrics\P04F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P05C007_height.las %PROD_DIR%\07_cloudmetrics\P05C007_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P05F006_height.las %PROD_DIR%\07_cloudmetrics\P05F006_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P07C_height.las %PROD_DIR%\07_cloudmetrics\P07C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P07F_height.las %PROD_DIR%\07_cloudmetrics\P07F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P08C_height.las %PROD_DIR%\07_cloudmetrics\P08C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P08F_height.las %PROD_DIR%\07_cloudmetrics\P08F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P09C_height.las %PROD_DIR%\07_cloudmetrics\P09C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P09F_height.las %PROD_DIR%\07_cloudmetrics\P09F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P10C_height.las %PROD_DIR%\07_cloudmetrics\P10C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P10F_height.las %PROD_DIR%\07_cloudmetrics\P10F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P11C_height.las %PROD_DIR%\07_cloudmetrics\P11C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P11F_height.las %PROD_DIR%\07_cloudmetrics\P11F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P12C_height.las %PROD_DIR%\07_cloudmetrics\P12C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P12F_height.las %PROD_DIR%\07_cloudmetrics\P12F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P13C_height.las %PROD_DIR%\07_cloudmetrics\P13C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P13F_height.las %PROD_DIR%\07_cloudmetrics\P13F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P15C_height.las %PROD_DIR%\07_cloudmetrics\P15C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P15F_height.las %PROD_DIR%\07_cloudmetrics\P15F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P17C_height.las %PROD_DIR%\07_cloudmetrics\P17C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P17F_height.las %PROD_DIR%\07_cloudmetrics\P17F_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P20C_height.las %PROD_DIR%\07_cloudmetrics\P20C_height_metrics.csv
CloudMetrics /id /minht:2 /above:2 %PROD_DIR%\04_LASheight\P20F_height.las %PROD_DIR%\07_cloudmetrics\P20F_height_metrics.csv


:: 8) GridMetrics computes a series of descriptive statistics for a LIDAR dataset.
:: Não utilizei default, segui os mesmos;
:: mkDir %PROD_DIR%/08_gridmetrics
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P01F_grid.csv %PROD_DIR%\04_LASheight\P01F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P02C_grid.csv %PROD_DIR%\04_LASheight\P02C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P02F_grid.csv %PROD_DIR%\04_LASheight\P02F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P03C_grid.csv %PROD_DIR%\04_LASheight\P03C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P03F_grid.csv %PROD_DIR%\04_LASheight\P03F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P04C_grid.csv %PROD_DIR%\04_LASheight\P04F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P04F_grid.csv %PROD_DIR%\04_LASheight\P04F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P05C007_grid.csv %PROD_DIR%\04_LASheight\P05C007_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P05F006_grid.csv %PROD_DIR%\04_LASheight\P05F006_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P07C_grid.csv %PROD_DIR%\04_LASheight\P07C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P07F_grid.csv %PROD_DIR%\04_LASheight\P07F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P08C_grid.csv %PROD_DIR%\04_LASheight\P08C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P08F_grid.csv %PROD_DIR%\04_LASheight\P08F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P09C_grid.csv %PROD_DIR%\04_LASheight\P09C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P09F_grid.csv %PROD_DIR%\04_LASheight\P09F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P10C_grid.csv %PROD_DIR%\04_LASheight\P10C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P10F_grid.csv %PROD_DIR%\04_LASheight\P10F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P11C_grid.csv %PROD_DIR%\04_LASheight\P11C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P11F_grid.csv %PROD_DIR%\04_LASheight\P11F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P12C_grid.csv %PROD_DIR%\04_LASheight\P12C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P12F_grid.csv %PROD_DIR%\04_LASheight\P12F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P13C_grid.csv %PROD_DIR%\04_LASheight\P13C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P13F_grid.csv %PROD_DIR%\04_LASheight\P13F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P15C_grid.csv %PROD_DIR%\04_LASheight\P15C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P15F_grid.csv %PROD_DIR%\04_LASheight\P15F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P17C_grid.csv %PROD_DIR%\04_LASheight\P17C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P17F_grid.csv %PROD_DIR%\04_LASheight\P17F_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P20C_grid.csv %PROD_DIR%\04_LASheight\P20C_height.las
GridMetrics /minht:2 /noground 2 10 %PROD_DIR%\08_gridmetrics\P20F_grid.csv %PROD_DIR%\04_LASheight\P20F_height.las



:: 9) CSV para ASCII-> HMAX, Canopy density  						Number Coluna 
csv2grid %PROD_DIR%\08_gridmetrics\%PROJ%_grid_all_returns_elevation_stats.csv  7 %PROD_DIR%\08_gridmetrics\%PROJ%_HMAX_FC.asc
csv2grid %PROD_DIR%\08_gridmetrics\%PROJ%_grid_all_returns_elevation_stats.csv 56 %PROD_DIR%\08_gridmetrics\%PROJ%_DENS_FC.asc
