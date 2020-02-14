# Solutions to exercise-6


# ************************************************
# ----- Exercise 6: Solution 1 ----
# ************************************************

library(raster)
elevation <- raster("data/san-francisco/elevation-sanfrancisco.tif")

nlayers(elevation) # 1
ncell(elevation) # 234630
res(elevation) # 24.5 30.8

# All RasterLayers are 1 layer so it does not 
# explicitly tell you how many layers are in the 
# file. But you can also deduce this looking at
# the "names" in the console print out. There
# is only one (elevation.sanfrancisco) so it's one
# layer

# The resolution is shown in the printout directly

# The number of cells is under dimensions

# So all three pieces of information are in the 
# console print out in some way.



# ************************************************
# ----- Exercise 6: Solution 2 ----
# ************************************************



landsat <- brick("data/san-francisco/landsat-sanfrancisco.tif")

class(elevation) # RasterLayer
class(landsat) # RasterBrick


# ************************************************
# ----- Exercise 6: Solution 3 ----
# ************************************************

# The CRS is listed on the console if you print
# out a raster object but to get the CRS directly
# use crs(). In this case the crs begins with
# +proj=tmerc rather than +proj=lonlat so it is
# projected.

crs(elevation)
st_is_longlat(elevation) # FALSE, it is projected


# ************************************************
# ----- Exercise 6: Solution 4 ----
# ************************************************


inMemory(elevation) # FALSE

elevation_vals <- getValues(elevation)

hist(elevation_vals)

# This works (but it takes a sample). If the axes
# are not showing, clear the plots in RStudio with
# the little broom icon and re-run
hist(elevation)

# By the way, these should be equal
length(elevation_vals) #234630
ncell(elevation) #234630


# ************************************************
# ----- Exercise 6: Solution 5 ----
# ************************************************


zoning <- read_sf("data/san-francisco/zoning-mission.shp")
tm_shape(zoning) + tm_polygons("gen")


# ************************************************
# ----- Exercise 6: Solution 6 ----
# ************************************************


# No question but I like n = 100

n <- 100
mission <- read_sf("data/san-francisco/boundary-mission.gpkg")


# Create a random raster with the same extent as
# the Mission district
rast_rand <- raster(mission, ncol = n, nrow= n, 
                    vals = sample(1:n, n*n, replace = TRUE))

# Take a look at it
plot(rast_rand)
plot(st_geometry(mission), add = TRUE, lwd = 3)

# ************************************************
# ----- Exercise 6: Solution 7 ----
# ************************************************

# rasterize() requires a Spatial* object like
# SpatialPoints or SpatialLines etc
# these are classes from the old sp package and
# their overall class is called "Spatial"

# Support for sf is being added to spatial
# packages but you'll still see packages and
# functions that require the older sp classes.





# ************************************************
# ----- Exercise 6: Solution 8 ----
# ************************************************

zoning_sp <- as(zoning, "Spatial")

class(zoning_sp) # SpatialPolygonsDataFrame

# This is one of the confusions I mentioned. The
# class you're converting to is "Spatial" but it's
# actually a "SpatialPolygonsDataFrame"


# ************************************************
# ----- Exercise 6: Solution 9 ----
# ************************************************

# No question, just run the code


