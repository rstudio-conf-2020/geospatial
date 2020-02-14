# ************************************************
# Spatial Data in R: Exercise 6
# ************************************************



# ************************************************
# ----- Exercise 6: Activity 1 -----
# ************************************************

# Read in the elevation-sanfrancisco.tif file with
# the raster() function and call the object
# elevation. Apply the nlayers(), ncell() and
# res() functions to elevation. How many layers is
# it, how many cells and what is the resolution?

# Which of those three pieces of information can you
# get just by printing the elevation object on the
# console?

path <- "data/san-francisco/elevation-sanfrancisco.tif"




# ************************************************
# ----- Exercise 6: Activity 2 -----
# ************************************************


# Read in the landsat-sanfrancisco.tif with the
# brick() function and call it landsat. What is
# the class of landsat? What is the class of the
# elevation layer from the previous exercise?


path <- "data/san-francisco/landsat-sanfrancisco.tif"



# ************************************************
# ----- Exercise 6: Activity 3 -----
# ************************************************

# What function would you use to determine the CRS
# of elevation? Use this function to look at the crs 
# for elevation. Does it look like an unprojected or
# projected CRS?

# The function st_is_longlat() is from {sf} but
# works with rasters. This function was not in the
# slides so you should read the help for that
# function and then apply it to elevation to see
# if you were right about whether it was projected
# or not (st_is_longlat() will test if the
# coordinates are longitude and latitude meaning
# it's a geographic coordinate system rather than
# a projected coordinate system).





# ************************************************
# ----- Exercise 6: Activity 4 -----
# ************************************************


# Use the inMemory() function to determine whether
# the elevation values have been read in to memory.

# Do you remember what function you can use to get
# the values of a raster? Starts with "get" -- use
# that to read the values of the elevation raster
# to an object called elevation_vals and then use
# hist() on it to see a histogram.

# By the way, can you apply hist() directly to 
# the elevation raster?






# ************************************************
# ----- Exercise 6: Activity 5 -----
# ************************************************

# Read in the zoning-mission.shp file (this is
# zoning data for the Mission district). Call the
# object zoning. Use tmap to create a choropleth
# (color-coded) map of the "gen" field from the
# zoning object you just created

path <- "data/san-francisco/zoning-mission.shp"




# ************************************************
# ----- Exercise 6: Activity 6 -----
# ************************************************

# We are going to convert the zoning dataset from
# the previous exercise into a raster. We will
# start by creating a random raster that we will
# transfer values to.

# Run the code below and then play around with the
# value for n that gives a pretty good resolution.
# You probably don't want more than 1000 but probably
# more than 10.

# There is no question here, just figure out what
# the code is doing and pick a number for n.

n <- 10
mission <- read_sf("data/san-francisco/boundary-mission.gpkg")


# Create a random raster with the same extent as
# the Mission district
rast_rand <- raster(mission, ncol = n, nrow= n, 
              vals = sample(1:n, n*n, replace = TRUE))

# Take a look at it
plot(rast_rand)
plot(st_geometry(mission), add = TRUE, lwd = 3)




# ************************************************
# ----- Exercise 6: Activity 7 -----
# ************************************************

# We want to use the rasterize function with our
# zoning data but there's an issue. Read the help
# for rasterize(). What classes are expected for
# the x argument (hint: not sf).






# ************************************************
# ----- Exercise 6: Activity 8 -----
# ************************************************

# Use the as() function to convert the zoning
# object to the "Spatial" class. Save this as
# zoning_sp. What class is zoning_sp? Use class()
# to determine what class zoning_sp is.






# ************************************************
# ----- Exercise 6: Activity 9 -----
# ************************************************

# Our raster values will need to be numeric. If
# you run this code you'll see the four zoning
# types have a name in "gen" and a corresponding
# number in "zonecode"

dplyr::distinct(zoning_sp@data, gen, zonecode)

# Run the code below to convert the zoning
# polygons to a raster then review and run the
# mapping code that is provided below.

# Note the new function tmap_arrange -- an
# easy way to add multiple maps to the same
# window. A good one to remember!


zoning_raster <- rasterize(zoning_sp, 
                           rast_rand, 
                           field = "zonecode")


m_rast <- tm_shape(zoning_raster) + tm_raster() + 
  tm_layout(title = "New raster version")
m_vect <- tm_shape(zoning) + tm_fill("zonecode") + 
  tm_layout(title = "Original landuse vectors")

tmap_arrange(m_rast, m_vect, nrow = 1)

