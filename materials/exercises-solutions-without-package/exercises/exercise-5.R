# ************************************************
# Spatial Data in R: Exercise 5
# ************************************************



# ************************************************
# ----- Exercise 5: Activity 1 -----
# ************************************************

# In the code below we are creating points with
# st_point() which accepts a longitude/latitude
# pair. By the way, longitude = x and latitude =
# y. My way of remembering this is LAtitude =
# rungs on a LAdder (so the y-coordinate).

# Then we create a line from the points.

# Run the code below. What are the classes of pt1? 
# What are the classes of line1?


pt1 <-st_point(c(-122.489464, 37.769397))
pt2 <-st_point(c(-122.400944, 37.785703))

line1 <- st_linestring(c(pt1, pt2))

# Try to use three calls to plot (use add = TRUE) to
# create a plot of the points on the line. The 
# argument pch = 16 will give you a filled circle
# if you want.

# Extra credit if you can figure out where these
# points are. If you paste coordinates into google
#  you'll need to reverse them so you have
# lat, long





# ************************************************
# ----- Exercise 5: Activity 2 -----
# ************************************************

# Read in the San Francisco County outline (path
# below) and use st_transform() to convert the crs
# to unprojected EPSG 4326 (to match the points
# and line which are longitude, latitude). Call the 
# new object sanfran.

# Then plot both points and the line on top of 
# the San Francisco outline with plot(). What
# happens if you try to map line1 with tmap? 

path <- "data/san-francisco/counties-sanfrancisco.gpkg"




# ************************************************
# ----- Exercise 5: Activity 3 -----
# ************************************************

# If we want to use tmap or do any other fun stuff
# our simple features geometry (sfg) needs to be a
# simple features object (sf). 

# Rarely will you need to create this from scratch
# but being able to convert is useful. The process
# is:

# 1. Convert sfg to a simple features column (sfc) 
#    with st_sfc()
# 2. Convert to a simple features data frame (sf) 
#    with st_sf()

# Run and try to understand the code below then
# use tmap or mapview to create maps of the 
# sanfran outline, points and line

# Tips: you'll need tm_lines() for tmap. For 
# tm_dots() you may need the size argument. For
# mapview wrap the layers in list()


# Code from above
pt1 <-st_point(c(-122.489464, 37.769397))
pt2 <-st_point(c(-122.400944, 37.785703))

line1 <- st_linestring(c(pt1, pt2))

# Convert from sfg -> sfc -> sf
pt1 <- pt1 %>% st_sfc() %>% st_sf(crs = 4326)
pt2 <- pt2 %>% st_sfc() %>% st_sf(crs = 4326)
line1 <- line1 %>%  st_sfc() %>% st_sf(crs = 4326)

library(dplyr)
pt1 <- mutate(pt1, place = "Golden Gate Park")
pt2 <- mutate(pt2, place = "SF MOMA")





# ************************************************
# ----- Exercise 5: Activity 4 -----
# ************************************************

# Read in the roads-mission.shp file (path below),
# call the object "roads" and use glimpse() to take 
# a look at the object. How many features are
# there? What type of geometry is it?


path <- "data/san-francisco/roads-mission.shp"






# ************************************************
# ----- Exercise 5: Activity 5 -----
# ************************************************

# Use the st_geometry() function to extract the
# geometry of roads to a new object called
# roads_geom. What is the class of this new
# object?

# After creating roads_geom run this code. What
# does it output?

roads_geom[[1]]



# STOP HERE FOR NOW










# ************************************************
# ----- Exercise 5: Activity 6 -----
# ************************************************

# Use dplyr to select FULLNAME from the roads object
# then use head to confirm that the geometry column
# is also selected by default. You might need to
# use dplyr::select(). Save the object as
# roads_name





# ************************************************
# ----- Exercise 5: Activity 7 -----
# ************************************************

# If you wanted to share the data with a colleague
# but your colleague doesn't want the geometry
# what function could you use to drop
# (the word "drop" is a hint) the geometry and
# return just the attributes? Run that function on
# roads_name and look at the output but you don't need
# to save the result.





# ************************************************
# ----- Exercise 5: Activity 8 -----
# ************************************************

# You can use st_cast() to convert between
# geometries. Use st_cast() to convert line1 from
# an earlier exercise to "POINT" and save this
# object as pts_from_line and then use plot() to
# confirm it worked. (This will be a dull plot!).
# You can use the argument cex = 3 to make the
# points bigger.





# ************************************************
# ----- Exercise 5: Activity 9 -----
# ************************************************

# Use dplyr's mutate() function to add a column to
# the roads dataset that is the length of the
# roads. You will need the st_length() function.
# Call the new column rd_length and then use this
# code to plot the result.


# You need to create the rd_length variable first
# then run this. This could take a second or two
# to run:

tm_shape(roads) + tm_lines("rd_length")




# ************************************************
# ----- Exercise 5: Activity 10 -----
# ************************************************

# You will definitely still encounter the need to
# convert between the old sp and the new sf
# formats.

# Run the code below which is the old way of
# reading in data then use class to confirm that
# it's one of the "sp" classes that begin with
# Spatial and often end with DataFrame

# Then use the as() function to convert to "sf". 
# Then, sorry!, convert it back to sp with 
# as() to class "Spatial" (with a capital "S")

# an example as(blah, "sf") and as(blah, "Spatial")


roads_sp <- rgdal::readOGR("data/san-francisco", 
                           layer = "roads-mission")


# ************************************************
# ----- Exercise 5: Activity 11 -----
# ************************************************


# Use write_sf() to write line1 to a geopackage file
# the suffix is gpkg and you can put it in your
# data folder if you want.

















