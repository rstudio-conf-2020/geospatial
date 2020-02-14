# Solutions to exercise-3


# ************************************************
# ----- Exercise 3: Solution 1 ----
# ************************************************

path <- "data/san-francisco/boundary-mission.gpkg"

# Either of these is fine
mission <- st_read(path)
mission <- read_sf(path)

# You can also use the path as a string
mission <- st_read("data/san-francisco/boundary-mission.gpkg")
mission <- read_sf("data/san-francisco/boundary-mission.gpkg")


# There are two non-geometry columns, link and name
glimpse(mission)


# ************************************************
# ----- Exercise 3: Solution 2 ----
# ************************************************

# Two views get plotted because the default is to
# create a map of each of the attributes.

plot(mission)



# ************************************************
# ----- Exercise 3: Solution 3 ----
# ************************************************

# Option 1
mission_geometry <- st_geometry(mission)
plot(mission_geometry)

# Option 2
st_geometry(mission) %>% 
  plot()

# Option 3
plot(st_geometry(mission))

# ************************************************
# ----- Exercise 3: Solution 4 ----
# ************************************************

# Read it in
parks <- read_sf("data/san-francisco/parks-mission.shp")

# Create the plot
plot(st_geometry(mission))
plot(st_geometry(parks), add = TRUE, 
     col = "forestgreen")

# ************************************************
# ----- Exercise 3: Solution 5 ----
# ************************************************

library(raster)


elevation <- raster("data/san-francisco/elevation-mission.tif")

plot(elevation, axes = FALSE)
plot(st_geometry(mission), add = TRUE)

# ************************************************
# ----- Exercise 3: Solution 6 ----
# ************************************************

# With plot it plots each layer of the brick
# individually and with plotRGB it plots a
# composite image based on the three layers

landsat <- brick("data/san-francisco/landsat-sanfrancisco.tif")
plot(landsat)
plotRGB(landsat)


# ************************************************
# ----- Exercise 3: Solution 7 ----
# ************************************************

# Yes, it works on vector and raster. If you used
# qtm() on the multi-band raster, though, you'd
# get three plots.

# qtm() is a great shortcut for a quick look at
# your data especially if you don't like typing
# st_geometry()

qtm(mission)
qtm(elevation)

# ************************************************
# ----- Exercise 3: Solution 8 ----
# ************************************************

# Here is the map
tm_shape(mission) + tm_borders() + 
  tm_shape(parks) + tm_borders()



# ************************************************
# ----- Exercise 3: Solution 9 ----
# ************************************************

# Polygons gives you borders and fill, dots
# automatically converts to points at centroids.
# Text gives you labels.


tm_shape(mission) + 
  tm_borders() + 
  tm_shape(parks) + 
  tm_polygons(col ="forestgreen") +
  tm_dots(size = 1, col = "red", alpha = 0.5) + 
  tm_text("map_park_n", col = "black")



# ************************************************
# ----- Exercise 3: Solution 10 ----
# ************************************************

# Setting to "view" automatically creates an
# an interactive map
tmap_mode("view") 

tm_shape(mission) + 
  tm_borders() + 
  tm_shape(parks) + 
  tm_polygons(col ="forestgreen") +
  tm_dots(size = 0.05, col = "red") + 
  tm_text("map_park_n", col = "black")





# ************************************************
# ----- Exercise 3: Solution 11 ----
# ************************************************

# Make sure you're in interactive mode
tmap_mode("view")

# Create the plot with the two variables
tm_shape(parks) + tm_polygons(c("map_park_n", "acres"))

# Back to static mode
tmap_mode("plot") 



# ************************************************
# ----- Exercise 3: Solution 12 ----
# ************************************************

# There is no question here.


