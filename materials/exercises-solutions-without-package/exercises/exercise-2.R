# ************************************************
# Spatial Data in R: Exercise 2
# ************************************************



# ************************************************
# ----- Exercise 2: Activity 1 -----
# ************************************************

# Look in the data/san-francisco folder and find
# the file named counties-california.shp. How many
# other files begin with "counties-california"? 
# What kind of spatial file has more than one 
# piece and includes a .shp file?





# ************************************************
# ----- Exercise 2: Activity 2 -----
# ************************************************

# Use st_read() to read in the file at the path
# below and call the object you create
# ca_counties. Then use glimpse() to get a view of
# the data. What format is the GEOID field? Then
# use the class function on ca_counties - what type
# of object is it?

library(sf)
library(dplyr)
path <- "data/san-francisco/counties-california.shp"



# ************************************************
# ----- Exercise 2: Activity 3 -----
# ************************************************

# There is a "tidy" version of the {sf} data reading
# function called read_sf(). Use read_sf() to read
# the same data again. You can call it ca_counties again
# and then same questions as before -- what format
# is GEOID and what classes is ca_counties?


path <- "data/san-francisco/counties-california.shp"




# ************************************************
# ----- Exercise 2: Activity 4 -----
# ************************************************

# Can you remember the code to plot ca_counties
# with tmap (probably not :)? We have not covered
# it in the slides yet but you did this in
# Exercise 1. If you can't remember, look at
# Exercise 1 or the solution for this activity and
# create the plot.

library(tmap)




# ************************************************
# ----- Exercise 2: Activity 5 -----
# ************************************************

# The elevation-sanfrancisco.tif file is a single-band
# (one layer) raster. What function would you use
# to read this in? Read it in and call it elevation.
# Then run the plot function to take a look.


path <- "data/san-francisco/elevation-sanfrancisco.tif"
library(raster)



plot(elevation)

# ************************************************
# ----- Exercise 2: Activity 6 -----
# ************************************************

# The landsat-bayarea.tif file is a multi-band
# raster (an image). Read this in with the function
# for multi-layer rasters, call the object landsat 
# and then run the plotRGB() code below


path <- "data/san-francisco/landsat-sanfrancisco.tif"



plotRGB(landsat)




# ************************************************
# ----- Exercise 2: Activity 7 -----
# ************************************************

# This question uses the elevation data from above

# Read in the contours-sanfrancisco.shp file and
# call it "contours". Then run the plotting code
# below

path <- "data/san-francisco/contours-sanfrancisco.shp"



plot(elevation)
plot(contours, add = TRUE)



