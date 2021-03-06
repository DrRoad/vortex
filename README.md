## Demographics of Disaster

This repository contains all the code and data associated with a group class project for [Stat 259](http://gastonsanchez.com/stat259), a UC Berkeley course associated with the [Data Sciences for the 21st Century](http://ds421.berkeley.edu) program.

Our final products include a [web app](https://matthewkling.shinyapps.io/demographics_of_disaster/) built with Shiny, and a report compiled with latex and overleaf and found inside the report directory. 

The project was motivated by a simple question: *how are US subpopulations differentially burdened by climate-related natural disasters?* By combining a number of socioeconomic and meteorological datasets into a flexible visualization framework, the Shiny app lets you explore various facets of this issue.

Our pipeline is fully reproducible, and nearly every step is scripted, exceptions being the downloading of several source datasets only accessible via GUI.

To run all scripts and reproduce this project, first, clone the github repository onto your local machine. Then, visit the forest fire directory under raw data and follow instructions in the readme to download, prepare, and clean fire data. This will take roughly 6-8 hours. After this step completes, please run the make file in the main directory with the following script from a BASH or UNIX shell: 'make'

Note: You may need to install some dependencies and the following R libraries in order to execute the make command: rio, raster, data.table, viridis, dplyr, tidyr, stringr, rgeos, rgdal, broom, maptools, ggplot2, xlsx.  
