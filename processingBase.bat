::SCRIPT PARA GERAR METRICAS A PARTIR DAS NUVENS NORMALIZADAS

::TANGURO
:: set FUSION_DIR=%FUSION_DIR%;C:\FUSION\
PATH="C:\FUSION";%PATH%

:: Processing folder
set PROD_DIR=C:\Users\IPAM\Desktop\Ofinica LiDAR IPAM\Metricas\
cd %PROD_DIR%

:: lidar data
set LAS_DIR=C:\Users\IPAM\Desktop\Ofinica LiDAR IPAM\Data\Tanguro\Clipped\

:: Project name
set PROJ=Tanguro

:: 7) # CloudMetrics: Computes a variety of statistical parameters describing a LIDAR data set
CloudMetrics /id /minht:1.37 /above:1.37 /strata %LAS_DIR%\*.laz %PROD_DIR%\%PROJ%_metrics.csv


::Cerrado
:: set FUSION_DIR=%FUSION_DIR%;C:\FUSION\
PATH="C:\FUSION";%PATH%

:: Processing folder
set PROD_DIR=C:\Users\IPAM\Desktop\Ofinica LiDAR IPAM\Metricas\
cd %PROD_DIR%

:: lidar data
set LAS_DIR=C:\Users\IPAM\Desktop\Ofinica LiDAR IPAM\Data\Cerrado\Clipped\

:: Project name
set PROJ=Cerrado

:: 7) # CloudMetrics: Computes a variety of statistical parameters describing a LIDAR data set
CloudMetrics /id /minht:1.37 /above:1.37 /strata %LAS_DIR%\*.laz %PROD_DIR%\%PROJ%_metrics.csv
