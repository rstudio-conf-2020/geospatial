Modern Geospatial Data Analysis
================

### rstudio::conf 2020 workshop

by Zev Ross



-----

:spiral_calendar: January 27 and 28, 2020  
:alarm_clock:     09:00 - 17:00  
:hotel:           Golden Gate Rooms 2- 3 (Lobby Level) </br>
:writing_hand:    [rstd.io/conf](http://rstd.io/conf)

-----

## All you really need to know

* There is no preparation required :clap:
* Workshop will use a cloud version of RStudio that you will log into on the day of the workshop
* The workshop materials will be available in your RStudio session at the workshop
* More details are below. If you have questions you can contact me at <zev@zevross.com>


## Instructors

**Instructor**

* Zev Ross [@zevross](https://twitter.com/zevross)

**Teaching Assistants**

* Angela Li [@CivicAngela](https://twitter.com/CivicAngela)
* Hollie Olmstead
* Dennis Irorere [@Denironyx](https://twitter.com/Denironyx)
* Jindra Lacko [@jladata](https://twitter.com/jladata)
* Thomas Mock [@thomas_mock](https://twitter.com/thomas_mock)


## Overview

Make your geospatial data come to life with R. This course will get you quickly up and running with the new R workflow for geospatial data. An explosion of packages for working with spatial data means you can ditch your GIS software and do geospatial analysis in R end-to-end. You will learn to read, manipulate and visualize spatial data and you'll be introduced to functionality that will have you saying "I didn't know you could do that in R!". In addition to learning from Zev Ross, you will benefit from support during the workshop from two additional spatial analysis experts, Angela Li from the Center for Spatial Data Science and Hollie Olmstead from ZevRoss Spatial Analysis, each with extensive experience analyzing spatial data and teaching core concepts. During the workshop, you will learn: 

* Key strategies for getting spatial data into R. This includes an introduction to powerful packages for accessing data on census, climate, land cover and more— as well as functionality for reading external files (e.g., shapefiles, geojson, geopackages, grids and tiffs). 
* The latest innovations in spatial data visualization. Participants will create both static and interactive visualizations using the flexible and feature-rich {tmap} and {mapview} as well as explore the landscape of specialized visualization packages such as {cartography}, {geogrid}, {rayshader} and {concaveman}. 
* How spatial data can be integrated into data science workflows, how to manipulate, slice and dice and make sense of spatial data.You will also learn key geoprocessing techniques for both vector and raster data including buffering, clipping, masking, cropping, computing distance and others.

## What participants are expected to know

Participants in the workshop do not need to have any previous geospatial experience but you must be proficient in R -- for example, you should be able to use dplyr functions such as select, filter and mutate from memory.

It will also be helpful if you know the pipe (`%>%`), double colon (`::`) and how to extract pieces of a list with `[[ ]]`. A little {ggplot2} is helpful but not required.


## No setup or prework is required

During the workshop we will using a cloud version of RStudio (RStudio Server Pro) so there is no need for any advanced preparation.

If you want to add the packages we will be using to your local version of R that is fine. What we will be using:

* Packages we're using heavily: `install.packages(c("sf", "tmap", "mapview", "raster", "dplyr"))`
* Packages that are less important but discussed: `install.packages(c("tidycensus", "FedData", "rnaturalearth", "osmdata", "OpenStreetMap", "shinyjs", "rmapshaper"))`
* Some packages may require {rJava} which is not always straightforward to install: `install.packages("rJava")`

## Workshop structure

There will be slides delivered by Zev followed by exercises on your own. The exercises are in a custom R package for the workshop and each exercise has an accompanying solution. You can open the exercises and solutions by first loading the `zrsaSpatialWorkshop` package and then using `open_exercise(1)` or `open_solution(1)` (to open, in this case, exercise and solution 1).

```r
library(zrsaSpatialWorkshop)
open_exercise(1)
open_solution(1)
```

All slides will be available as PDFs on the day of the workshop in a folder in your RStudio session. All data and the custom workshop package will also be in a folder in your RStudio session. You can download all of these materials if desired by selecting what you want to download (clicking on the box next to the folder or item) and then clicking on the "More" drop down and exporting.


<img src="https://user-images.githubusercontent.com/1395177/72939024-0f298c00-3d3a-11ea-811d-0002d6737a80.png" width="400px" />

## Logging in and registering for the first time (when you get to the workshop)

![#f03c15](https://placehold.it/15/f03c15/000000?text=+) !!This will only work on the morning of the workshop!! ![#f03c15](https://placehold.it/15/f03c15/000000?text=+)

### Step 1: Navigate to the classroom site

  - Go to the classroom app: <https://rstd.io/class>
  - The workshop identifier will be provided at the workshop
  - Click Submit

<img src="https://github.com/zross/classroom-getting-started/blob/master/inst/images/workshop-classroom.png" width="400px" />

### Step 2: Register

Register

  - Register with your name and email address (use a real email as this is your unique identifier)

You will get a home screen with a URL, user name and password

  - Point your browser browser to the URL

<img src="https://github.com/zross/classroom-getting-started/blob/master/inst/images/credentials.png" width="400px" />

### Step 3: Make a note of your login details

Make a note of your:

  - User name: `conf-2020-user`
  - Password: `conf-2020-pass`



### Step 4: Open the getting started screen

Your getting started screen contains links to RStudio Server Pro as well
as RStudio Connect:

<img src="https://github.com/zross/classroom-getting-started/blob/master/inst/images/getting-started-screen.png" width="400px" />

### Step 5: Open RStudio Server Pro

From the getting started screen (step 4), click the “RStudio Server Pro”
button.

You will be prompted for a user name and password. Use the information
you collected in Step 3.

<img src="https://github.com/zross/classroom-getting-started/blob/master/inst/images/rsp.png" width="400px" />

## Logging in once you've already registered

The URL, user name and password will be the same so you can browse directly. If you forget these:

  - Go to the classroom app: <https://rstd.io/class>
  - Put `geospatial` in for the workshop identifier and click submit
  - You should see the URL and uer an
  
## After the workshop -- Spatial Birds of a Feather

Thursday lunch in the main dining room. RStudio Community page on this BOF is [here](https://community.rstudio.com/t/spatial-mapping-bof-at-rstudio-conf-2020/47799).

## RStudio Community page for the workshop

https://community.rstudio.com/t/modern-geospatial-data-analysis-with-r-workshop-rstudio-conf-2020/49098




## Schedule

Agenda

1. Introduction: getting started and orientation
2. Spatial data: reading, writing, packages with data
3. Mapping: static and interactive mapping
4. Coordinate reference systems: making sure your layers map together
5. Vector data: a deeper dive into vectors with {sf}
6. Raster data: a deeper dive into rasters with {raster}
7. Geoprocessing with vectors and rasters: this section has three parts and could be considered sections 7-9


Official RStudio breaks

| Time          | Activity         |
| :------------ | :--------------- |
| 10:30 - 11:00 | *Coffee break*   |
| 12:30 - 13:30 | *Lunch break*    |
| 15:00 - 15:30 | *Coffee break*   |


## Instructor

Zev Ross is Founder and President of [ZevRoss Spatial Analysis](https://www.zevross.com/), a firm focused on data analytics, software development and interactive, data-driven web applications. Zev has more than 15 year’s experience in data analytics and machine learning working with clients including Capital One, the World Health Organization, the Natural Defense Resources Council, the American Cancer Society and Freddie Mac. He is the author or co-author of more than 50 peer-reviewed publications in collaboration with research teams all over the world. The 6-person team at ZevRoss Spatial Analysis has significant experience creating Shiny applications, developing R packages, and installation and dev-ops for RStudio software. Zev and the firm’s team run custom software workshops on introductory R for data science, spatial data analysis in R, interactive applications in R with Shiny and advanced predictive analytics in R and these classes have been attended by 1000 participants from around the world. 


# Note for instructors on re-logging in

This will allow the user to re-login if they made a mistake:

* Make sure your on the rstd.io/class page
* Developer tools, Application tab
* Find the Cookies section under storage. Right click on https://sol-eng-shinyapps.io and clear

-----

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is
licensed under a [Creative Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
