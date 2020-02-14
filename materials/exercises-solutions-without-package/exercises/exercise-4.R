# ************************************************
# Spatial Data in R: Exercise 4
# ************************************************


# Take a deep breath before working on this
# exercise. This material is less fun than mapping
# and geoprocessing. But each minute of the time
# "current you" spends on this topic in this
# workshop will save "future you" five minutes of
# time and reduce future frustration
# and anxiety!


# ************************************************
# ----- Exercise 4: Activity 1 -----
# ************************************************

# In the Files tab in RStudio browse to 
# data/san-francisco and open two files by
# clicking on them: 

# counties-california.prj
# contours-sanfrancisco.prj

# What information do you think these files have?
# Which one is much longer and begins 
# with PROJCS?

# Browse to:
# https://spatialreference.org/ref/epsg/wgs-84/ In
# the grey box are the many different ways to
# represent the WGS84 CRS (EPSG 4326). Click on
# ESRI WKT Does this match either of the .prj
# files you opened?

# Finally, still on the same spatialreference.org
# site, click on the Proj4 link in the grey box.
# copy the code and pasted it here for later.




# ************************************************
# ----- Exercise 4: Activity 2 -----
# ************************************************

# Read in the counties-bayarea.shp file and call
# it counties. Then use the st_crs() function to
# look at the CRS.

path <- "data/san-francisco/counties-bayarea.shp"



# ************************************************
# ----- Exercise 4: Activity 3 -----
# ************************************************

# Delete the counties-bayarea.prj file (just the
# prj file!) so you can see how this changes
# reading the file. Delete the file by clicking on
# the little box next to the file in the files
# panel of RStudio and then choosing Delete.

# Now read counties-bayarea.shp in again (you can
# write over the object you created in the previous
# question or create a new object). What is the
# result if you run st_crs() on this object?





# ************************************************
# ----- Exercise 4: Activity 4 -----
# ************************************************

# Without the prj file when you read
# counties-bayarea.shp R has no way to know what
# the CRS is. But you know what it is since you
# read it in earlier with the .prj! 

# For this question, you will use st_crs()
# to assign/define the CRS for counties. You can
# use the EPSG code or the proj4string. You got
# the proj4string from spatialreference.org or you
# might be able to see it in the console window
# from a previous exercise.

# Ignore the warning about replacing crs

# Then look at the result with st_crs(counties)
# to make sure you did it correctly


# UNCOMMENT AND REPLACE ---

# st_crs(counties) <- ---



# ************************************************
# ----- Exercise 4: Activity 5 -----
# ************************************************

# Let's look, in more detail, at a different .prj
# file

# In the RStudio file explorer look at
# counties-sanfrancisco.gpkg is there an associated
# .prj file?




# ************************************************
# ----- Exercise 4: Activity 6 -----
# ************************************************

# Run this code first:

bayarea <- read_sf("data/san-francisco/counties-bayarea.shp")
st_crs(bayarea) <- 4326 # we have to do this because we deleted .prj earlier

sanfran <- read_sf("data/san-francisco/counties-sanfrancisco.gpkg")

# We should see a blue polygon since San Francisco
# is in the Bay Area! But we don't
plot(st_geometry(bayarea))
plot(st_geometry(sanfran), add = TRUE, col = "blue")

# Now look at the CRS for both bayarea and sanfran 
# (using st_crs()). Why don't BOTH bayarea and sanfran
# appear on the plot you created above?

# Can you tell which one is unprojected and which
# is projected? (If not, look at the solution).





# ************************************************
# ----- Exercise 4: Activity 7 -----
# ************************************************

# Run this code. You learned from the previous 
# exercise that these have different CRS but do
# they map together with tmap? Do you remember why?

tmap_mode("plot")
tm_shape(bayarea) + tm_borders() + 
  tm_shape(sanfran) + tm_fill(col = "firebrick")



# ************************************************
# ----- Exercise 4: Activity 8 -----
# ************************************************

# Let's make the CRS for bayarea and sanfran match
# by using st_transform()

# Since the sanfran object from above is projected
# and bayarea is not let's project/transform bayarea
# to match sanfran. 

# You can copy and paste the proj4string for
# sanfran using st_crs(sanfran) or you can use
# st_crs() directly like st_crs(x) <- st_crs(y)

# Confirm it worked by re-running the plot code


# UNCOMMENT AND REPLACE THE ---

# bayarea <- st_transform(bayarea, crs = ---)


# Blue poly should be visible
plot(st_geometry(bayarea))
plot(st_geometry(sanfran), add = TRUE, col = "blue")





# ************************************************
# ----- Exercise 4: Activity 9 -----
# ************************************************

# Read in the elevation-mission.tif file with the
# code below. This is a single-band raster. Use
# the crs() function to determine the CRS -- does
# that CRS look at all familiar (hint see
# st_crs(sanfran))

path <- "data/san-francisco/elevation-mission.tif"
elevation <- raster("data/san-francisco/elevation-mission.tif")




# ************************************************
# ----- Exercise 4: Activity 10 -----
# ************************************************

# There is no question on this one just read and
# run code

# Sorry about this but as you see below the R class
# of the result from crs() and st_crs() is a
# little different and this is a source of
# confusion. Read the comments below and step
# through the code to help reduce (but probably
# not eliminate) future confusion


# Raster and vector have their own CRS function
rast_prj <- crs(elevation)
vect_prj <- st_crs(sanfran)

# The class of the result is a little different
class(rast_prj) # CRS from the sp package
class(vect_prj) # crs from the sf package

# Accessing the information is a little different
rast_prj@projargs # proj4string, no EPSG

vect_prj$proj4string
vect_prj$epsg


# st_crs() actually works on both vector and raster
rast_prj <- st_crs(elevation)
vect_prj <- st_crs(sanfran)


# crs() works only on raster
rast_prj <- crs(elevation)
vect_prj <- crs(sanfran) # Nope! look at the result


# ************************************************
# ----- Exercise 4: Activity 11 -----
# ************************************************

# What function would you use to project/transform
# a raster? (We won't do it here because it can
# be time consuming).




