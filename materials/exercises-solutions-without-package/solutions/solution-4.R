# Solutions to exercise-4


# ************************************************
# ----- Exercise 4: Solution 1 ----
# ************************************************


# For shapefiles (and only shapefiles) there is 
# a .prj file with the information on the 
# coordinate reference system. If this .prj
# file does not exist R can still read the shapefile
# but will not know what the CRS is (CRS will be NA).

# Note that with other types of spatial files the
# CRS is often embedded in the file (not a separate
# file like .prj)

# The contours file has a significantly longer CRS
# and begins with PROJCS -- both the length and
# "PROJCS" are indications that it has a projected
# coordinate system.

# ESRI is the company that created the shapefile
# format and the CRS information in a shapefile
# looks something like this and this matches the
# bayarea counties file:

# GEOGCS["GCS_WGS_1984",DATUM["D_WGS_1984",
# SPHEROID["WGS_1984",6378137,298.257223563]],
# PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]]

# When a shapefile with a .prj is read into R, though
# it converts this ESRI formatted CRS to a
# proj4string which is what we use in R.

# Here is the proj4string
"+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"

# ************************************************
# ----- Exercise 4: Solution 2 ----
# ************************************************

library(sf)
counties <- read_sf("data/san-francisco/counties-bayarea.shp")
st_crs(counties)

# Coordinate Reference System:
#   EPSG: 4326 
# proj4string: "+proj=longlat +ellps=WGS84 +no_defs"



# ************************************************
# ----- Exercise 4: Solution 3 ----
# ************************************************

# Delete the "data/san-francisco/counties-bayarea.prj"
# file. Then run the following.

counties <- read_sf("data/san-francisco/counties-bayarea.shp")
st_crs(counties)

# If the shapefile does not have a .prj file then 
# this means the metadata describing the CRS is
# not there and, as a result, you'll get NA if
# you run st_crs() on the file you read in.

# Coordinate Reference System: NA


# ************************************************
# ----- Exercise 4: Solution 4 ----
# ************************************************

# Although R does not know the CRS of the file you
# do (because you read it in before deleting the .prj).

# So your job here is to assign/define the CRS

st_crs(counties) # this is NA

# You can use either of these to assign the CRS
st_crs(counties) <- 4326
st_crs(counties) <- "+proj=longlat +ellps=WGS84 +no_defs"

# Review
st_crs(counties)


# Note that either one will add BOTH the EPSG and
# the proj4string (in the background sf does a
# lookup with PROJ)



# ************************************************
# ----- Exercise 4: Solution 5 ----
# ************************************************

# No! There is no .prj file. One of the major 
# annoyances of shapefiles is that "one" shapefile
# is made up of many pieces and the .prj is one of
# those pieces

# With a geopackage (gpkg), on the other hand, the
# CRS information is embedded in the single file.

# So, with a geopackage you can't see at a glance
# if CRS information is included but this small
# inconvenience is more than made up for by the
# convenience of having just one file.



# ************************************************
# ----- Exercise 4: Solution 6 ----
# ************************************************

# The CRS are different for the two objects. The
# bayarea one is WGS84 (4326). The "+proj=longlat"
# is a tipoff that it's an unprojected CRS so bayarea
# is unprojected and sanfran is projected.

st_crs(bayarea) 
st_crs(sanfran)

# By the way, the projection for San Francisco
# is EPSG 7131. I did a Google search for San Fran
# projections and chose that one. 


# ************************************************
# ----- Exercise 4: Solution 7 ----
# ************************************************

# tmap does CRS projection/transformation on the
# fly! So great. But this might encourage users to
# get sloppy about CRS. For analysis purposes
# layers often need the same CRS (and they should
# generally be projected). So you should go
# through the effort to define and transform CRS
# so they match.



# ************************************************
# ----- Exercise 4: Solution 8 ----
# ************************************************

# These both will do the same thing

bayarea <- st_transform(bayarea, crs = st_crs(sanfran))
bayarea <- st_transform(bayarea, crs = "+proj=tmerc +lat_0=37.75 +lon_0=-122.45 +k=1.000007 +x_0=48000 +y_0=24000 +ellps=GRS80 +units=m +no_defs")

plot(st_geometry(bayarea))
plot(st_geometry(sanfran), add = TRUE, col = "blue")


# ************************************************
# ----- Exercise 4: Solution 9 ----
# ************************************************

# The projection is the same as that for sanfran
elevation <- raster("data/san-francisco/elevation-mission.tif")

# You can look at them in the console with this
crs(elevation)
st_crs(sanfran)

# You can test if they're exactly the same with this
crs(elevation)@projargs == st_crs(sanfran)$proj4string



# ************************************************
# ----- Exercise 4: Solution 10 ----
# ************************************************

# No question here


# ************************************************
# ----- Exercise 4: Solution 11 ----
# ************************************************


# The projectRaster() function is the raster
# equivalent of st_transform()
