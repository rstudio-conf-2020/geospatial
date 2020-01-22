Modern Geospatial Data Analysis
================

### rstudio::conf 2020

by Zev Ross



-----

:spiral_calendar: January 27 and 28, 2020  
:alarm_clock:     09:00 - 17:00  
:hotel:           \[ADD ROOM\]  
:writing_hand:    [rstd.io/conf](http://rstd.io/conf)

-----

## Overview

Make your geospatial data come to life with R. This course will get you quickly up and running with the new R workflow for geospatial data. An explosion of packages for working with spatial data means you can ditch your GIS software and do geospatial analysis in R end-to-end. You will learn to read, manipulate and visualize spatial data and you'll be introduced to functionality that will have you saying "I didn't know you could do that in R!". In addition to learning from Zev Ross, you will benefit from support during the workshop from two additional spatial analysis experts, Angela Li from the Center for Spatial Data Science and Hollie Olmstead from ZevRoss Spatial Analysis, each with extensive experience analyzing spatial data and teaching core concepts. During the workshop, you will learn: 

* Key strategies for getting spatial data into R. This includes an introduction to powerful packages for accessing data on census, climate, land cover and more— as well as functionality for reading external files (e.g., shapefiles, geojson, geopackages, grids and tiffs). 
* The latest innovations in spatial data visualization. Participants will create both static and interactive visualizations using the flexible and feature-rich {tmap} and {mapview} as well as explore the landscape of specialized visualization packages such as {cartography}, {geogrid}, {rayshader} and {concaveman}. 
* How spatial data can be integrated into data science workflows, how to manipulate, slice and dice and make sense of spatial data.You will also learn key geoprocessing techniques for both vector and raster data including buffering, clipping, masking, cropping, computing distance and others.

## Is this course for me?

Participants in the workshop do not need to have any previous geospatial experience but you must be proficient in R -- for example, you should be able to use dplyr functions such as select, filter and mutate from memory.

It will also be helpful if you know the pipe (`%>%`), double colon (`::`) and how to extract pieces of a list with `[[ ]]`. A little {ggplot2} is helpful but not required.


## No setup or prework is required!

During the workshop we will using a cloud version of RStudio (RStudio Server Pro) so there is no need for any advanced preparation.

If you want to add the packages we will be using to your local version of R that is fine. What we will be using:

* Packages we're using heavily: install.packages(c("sf", "tmap", "mapview", "raster", "dplyr"))
* Packages that are less important but discussed: install.pacakges(c("tidycensus", "FedData", "rnaturalearth", "osmdata", "OpenStreetMap", "shinyjs", "rmapshaper"))
* Some packages may require {rJava} which is not always straightforward to install: install.packages("rJava")


## Loggin in


## Step 1: Navigate to the classroom site

  - Go to the classroom app: <https://rstd.io/class>
  - Enter your *Workshop Identifier*
  - Click Submit

<img src="https://github.com/zross/classroom-getting-started/blob/master/inst/images/workshop-classroom.png" width="400px" />

## Step 2: Register

Register

  - Register with your name and email address

You will get a home screen with a URL, user name and password

  - Point your browser browser to the URL

<img src="inst/images/credentials.png" width="400px" />

## Step 3: Make a note of your login details

Make a note of your:

  - User name
  - Password

Also, make a note of the RStudio Connect URL link, because you’ll need
to in step 7. To get the link, right click on the “RStudio Connect”
button and copy the URL.

This link will look something like this:

<http://ec2-99-99-999-99.us-east-2.compute.amazonaws.com/rsconnect/>

## Step 4: Open the getting started screen

Your getting started screen contains links to RStudio Server Pro as well
as RStudio Connect:

<img src="inst/images/getting-started-screen.png" width="400px" />

## Step 5: Open RStudio Server Pro

From the getting started screen (step 4), click the “RStudio Server Pro”
button.

You will be prompted for a user name and password. Use the information
you collected in Step 3.

<img src="inst/images/rsp.png" width="400px" />

## After the workshop -- Spatial Birds of a Feather

Thursday lunch in the main dining room. RStudio Community page on this BOF is [here](https://community.rstudio.com/t/spatial-mapping-bof-at-rstudio-conf-2020/47799).

## RStudio Community page for the workshop

https://community.rstudio.com/t/modern-geospatial-data-analysis-with-r-workshop-rstudio-conf-2020/49098




## Schedule

| Time          | Activity         |
| :------------ | :--------------- |
| 09:00 - 10:30 | Session 1        |
| 10:30 - 11:00 | *Coffee break*   |
| 11:00 - 12:30 | Session 2        |
| 12:30 - 13:30 | *Lunch break*    |
| 13:30 - 15:00 | Session 3        |
| 15:00 - 15:30 | *Coffee break*   |
| 15:30 - 17:00 | Session 4        |

## Instructor

\[ADD INSTRUCTOR BIO\]

-----

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is
licensed under a [Creative Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
