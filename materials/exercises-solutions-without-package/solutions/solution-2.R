# Solutions to exercise-2


# ************************************************
# ----- Exercise 2: Solution 1 ----
# ************************************************

# There are four files that begin with
# "counties-california" and these four files
# combined (with the .shp) are a single "shapefile"

# .dbf stores the attribute data

# .prj stores the coordinate reference system info 
# (not required but useful). We will learn more 
# about it in a later section

# .shx is an index file, positional index of the feature geometry 

# .shp is the main file, the feature geometry itself


# ************************************************
# ----- Exercise 2: Solution 2 ----
# ************************************************

# Read the data
ca_counties <- st_read("data/san-francisco/counties-california.shp")


# GEOID is a factor (as are most of the fields)
glimpse(ca_counties)

# The object is both a sf and a data.frame class
class(ca_counties)


# ************************************************
# ----- Exercise 2: Solution 3 ----
# ************************************************

# Read the data
ca_counties <- read_sf("data/san-francisco/counties-california.shp")


# GEOID is a character which is often more 
# convenient to work with than a factor
glimpse(ca_counties)

# The object is still a sf and a data.frame class
# but also a tbl_df and tbl -- these are the 
# tibble classes (tibbles are a variation on 
# a data frame that provide better printouts
# among other things)
class(ca_counties)




# ************************************************
# ----- Exercise 2: Solution 4 ----
# ************************************************

library(tmap)
tm_shape(ca_counties) + tm_polygons()



# ************************************************
# ----- Exercise 2: Solution 5 ----
# ************************************************

library(raster)
elevation <- raster("data/san-francisco/elevation-sanfrancisco.tif")
plot(elevation)

# ************************************************
# ----- Exercise 2: Solution 6 ----
# ************************************************
path <- "data/san-francisco/landsat-sanfrancisco.tif"
landsat <- brick(path)
plotRGB(landsat)


# ************************************************
# ----- Exercise 2: Solution 7 ----
# ************************************************

contours <- read_sf("data/san-francisco/contours-sanfrancisco.shp")
plot(elevation)
plot(contours, add = TRUE)

# By the way, the contours were created with the
# raster::contour() function (and some filtering)
