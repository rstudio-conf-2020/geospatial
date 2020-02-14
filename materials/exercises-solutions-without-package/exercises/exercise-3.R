# ************************************************
# Spatial Data in R: Exercise 3
# ************************************************



# ************************************************
# ----- Exercise 3: Activity 1 -----
# ************************************************

# The Mission District is a neighborhood in San
# Francisco. Use sf to read in the
# "boundary-mission.gpkg" file (this is a
# geopackage) and name this object mission. Look
# at the data with head() or glimpse(). How many
# non-geometry columns are there?

# Note that this file only has one feature -- the
# boundary for this one neighborhood.

library(sf)
library(dplyr)
path <- "data/san-francisco/boundary-mission.gpkg"




# ************************************************
# ----- Exercise 3: Activity 2 -----
# ************************************************

# Use the plot() function to plot the mission object
# How many maps get plotted in one plot window? Why?



# ************************************************
# ----- Exercise 3: Activity 3 -----
# ************************************************

# You can use the st_geometry() function from the
# {sf} package to extract geometry (and drop
# attributes). Use st_geometry() on mission and plot
# the result.




# ************************************************
# ----- Exercise 3: Activity 4 -----
# ************************************************

# Read in the parks-mission.shp data (this is a
# shapefile) and call this parks. Then try to plot
# the mission boundary you read in before with the
# parks using the plot() function. You'll need to
# use st_geometry() on both and you'll need to use
# add = TRUE to the second plot. Use argument col
# = "forestgreen" for the parks.

path <- "data/san-francisco/parks-mission.shp"


# parks <- read_sf(---)
# plot(st_geometry(---))
# plot(st_geometry(---), ---, ---)


# ************************************************
# ----- Exercise 3: Activity 5 -----
# ************************************************


# Read in the elevation data (path below) and call
# it elevation (this is a single-band raster so
# you can use raster()). Then plot elevation with
# the mission boundary on top using plot(). Again
# you'll need st_geometry() for the mission (not
# for the raster) and you'll need add = TRUE

# You might want to turn off the axes with 
# axes = FALSE

library(raster)

path <- "data/san-francisco/elevation-mission.tif"



# ************************************************
# ----- Exercise 3: Activity 6 -----
# ************************************************

# Read in the landsat satellite image. It is a
# multi-layer raster so use brick(). Try plotting
# this image with both plot() and plotRGB(). What is
# the difference?


path <- "data/san-francisco/landsat-sanfrancisco.tif"



plot(landsat) # this might take a couple seconds
plotRGB(landsat)


# ************************************************
# ----- Exercise 3: Activity 7 -----
# ************************************************

# There is a handy little function in tmap called
# qtm() -- quick thematic map -- this is a
# shortcut to do something like
# plot(st_geometry(shape)). Run qtm() on the
# mission object. Then try using qtm() on the
# elevation raster. Do they both work fine?


library(tmap)




# ************************************************
# ----- Exercise 3: Activity 8 -----
# ************************************************


# Use tm_shape() and tm_borders() to create a tmap
# of both the mission object and the parks
# together using tmap (similar to the map you
# created above with plot()) you'll need to call
# both functions twice and separate all four
# function calls with +



# ************************************************
# ----- Exercise 3: Activity 9 -----
# ************************************************

# Play around with the map from the previous
# exercise. Try replacing tm_borders() with
# tm_polygons() for the parks. Add another line for 
# the tm_text() function to add the names of parks. 
# Look it up with ?tm_text(). The name
# of the park is in the "map_park_n" field. What
# happens if you use tm_dots(size = 1) for the
# parks?

# And, of course, change color (the col argument)
# and transparency (the alpha argument, values
# between 0 and 1) to tm_dots()




# STOP HERE FOR NOW




# ************************************************
# ----- Exercise 3: Activity 10 -----
# ************************************************

# Use this code to change the viewing mode to
# "view" instead of "plot" for tmap and then
# pick a tmap map you created above and re-run
# the code?

# Change the dots size to make the plot nicer and
# so you can see the playgrounds



tmap_mode("view")






# ************************************************
# ----- Exercise 3: Activity 11 -----
# ************************************************

# Create side-by-side linked interactive plots. You
# will need to make sure that you're in tmap mode
# "view" like the earlier question. 

# Look at the parks data on the console and review
# the names of the variables.

# Then map the parks with tm_shape() and
# tm_polygons(). BUT in the tm_polygons() rather
# than giving it just one variable give it this
# vector:

c("map_park_n", "acres") #

tmap_mode("view")




# Change the plot mode back to "plot" when you're
# done

tmap_mode("plot") 


# ************************************************
# ----- Exercise 3: Activity 12 -----
# ************************************************

# It is super-easy to create an interactive map
# with the mapview package (and mapview function).
# Try running this code. There is no question,
# just showing how easy it is with mapview!


library(mapview)
mapview(mission)

# Use list() to plot multiple objects
mapview(list(mission, parks), 
        col.regions = list("yellow", "forestgreen"))

# Or you can use this syntax
mapview(mission) + parks

# Or even this
mapview(mission) + mapview(parks)

# By the way, you can look at the different basemaps
# available with:
mapviewGetOption("basemaps")

# And you can include a different one with
mapview(mission, map.types = "OpenStreetMap")
