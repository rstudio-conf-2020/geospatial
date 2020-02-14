# ************************************************
# Spatial Data in R: Exercise 1
# ************************************************

# A note: I have not explained any of this code
# yet! You are not expected to understand the code
# in this exercise. The goal is to give you a 
# quick view/intro to code we will cover in
# the workshop.



# A note that ONLY applies if you are NOT working
# on the server (you installed the workshop
# package on your own machine): the paths to data
# in the exercises assume you are on the server.
# For example, data/san-francisco/counties-bayarea.shp 
# is referring to a folder on the server. If
# you've installed the workshop package on your
# own machine you will have to locate the data
# folder using the function system.file(). For
# example:

# If exercise says...
read_sf("data/san-francisco/counties-bayarea.shp")

# Replace the path with the result of this:
system.file("data-raw/san-francisco/counties-bayarea.shp", 
            package = "zrsaSpatialWorkshop")

# ************************************************
# ----- Exercise 1: Activity 1 -----
# ************************************************

# Run this code that reads in vector data and take
# note of the print out in the console. How many
# features in the collection? Under "proj4string"
# does it include the term "longlat"?

library(sf)
ca_counties <- read_sf("data/san-francisco/counties-california.shp")
ca_counties




# ************************************************
# ----- Exercise 1: Activity 2 -----
# ************************************************

# Use dplyr's glimpse() function on the
# ca_counties you just read in. What is the name
# of the last variable listed? What type of
# geometry is it (POINT, POLYGON, MULTIPOINT,
# MULTIPOLYGON?)

# This symbol [°] occurs next to the geometry type.
# Any guess what this refers to?

library(raster)
library(dplyr)





# WARNING: there is a select() function in both
# raster and in dplyr. In the workshop you'll only
# use select() from dplyr so it's best if you load
# dplyr AFTER raster



# ************************************************
# ----- Exercise 1: Activity 3 -----
# ************************************************


# Use dplyr's select() function to keep only the
# GEOID, NAME, AWATER and ALAND columns from the
# ca_counties object. Then use glimpse() to see if
# any other columns were also included in the
# result even though you didn't select them on
# purpose.

# UNCOMMENT AND FILL IN WHERE THE --- IS

# ca_counties_lim <- select(---)
glimpse(ca_counties_lim)





# ************************************************
# ----- Exercise 1: Activity 4 -----
# ************************************************

# If you run this code, how many maps get created?
# Can you guess why?

plot(ca_counties_lim)

# What about if you run this code? (Again, you
# have not been introduced to the st_geometry()
# function -- we will cover it later)

st_geometry(ca_counties_lim) %>% 
  plot()


# ************************************************
# ----- Exercise 1: Activity 5 -----
# ************************************************

# Run this code and look at the map. Then replace
# tm_polygons() with tm_fill() and re-run. Then
# replace with tm_borders() and re-run. How does the
# map differ?

library(tmap)
tm_shape(ca_counties_lim) + tm_polygons()



# ************************************************
# ----- Exercise 1: Activity 6 -----
# ************************************************

# Run the code below and look at the console printout
# What is the resolution of this raster? Find the
# word "units" in the "crs" section of the console
# printout -- what are the resolution units (in
# other words, if the resolution is 20 x 20 is this
# feet? meters?)? What are the min and max elevation
# values?


library(raster)
elevation <- raster("data/san-francisco/elevation-sanfrancisco.tif")
elevation


# ************************************************
# ----- Exercise 1: Activity 6 -----
# ************************************************

# Use the plot function on elevation. How
# many maps get created by default here? Try adding
# axes = FALSE as an argument to plot, what happens?


