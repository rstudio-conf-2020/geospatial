# Solutions to exercise-5


# ************************************************
# ----- Exercise 5: Solution 1 ----
# ************************************************




pt1 <-st_point(c(-122.489464, 37.769397))
pt2 <-st_point(c(-122.400944, 37.785703))
line1 <- st_linestring(c(pt1, pt2))


# Both are sfg -- simple features geography

class(pt1)
# "XY"    "POINT" "sfg"  

class(line1)
#"XY"         "LINESTRING" "sfg"


plot(line1,  col = "firebrick")
plot(pt1, add = TRUE, col = "blue", pch = 16)
plot(pt2, add = TRUE, col = "blue", pch = 16)


# Answer to Extra Credit in this Activity

# One point is in Golden Gate Park and one is the
# San Francisco Museum of Modern Art
# 37.769397, -122.489464
# 37.785703, -122.400944

# ************************************************
# ----- Exercise 5: Solution 2 ----
# ************************************************

# Read in data
sanfran <- read_sf("data/san-francisco/counties-sanfrancisco.gpkg")

# Transform CRS
sanfran <- st_transform(sanfran, crs = 4326)

# Create the plot
plot(st_geometry(sanfran), col = "deeppink4")
plot(line1, add = TRUE, col = "white")
plot(pt1, add = TRUE, col = "gold", pch = 16)
plot(pt2, add = TRUE, col = "gold", pch = 16)

# Error! Needs an sf not an sfg or sfc. This is 
# because tmap can't map simple features geometry,
# sfg
library(tmap)
qtm(line1) # error
tm_shape(line1) + tm_lines() # error




# ************************************************
# ----- Exercise 5: Solution 3 ----
# ************************************************

tm_shape(sanfran) + tm_polygons()+
tm_shape(pt1) + tm_dots(size = 0.2) + 
  tm_shape(pt2) + tm_dots(size = 0.2) + 
  tm_shape(line1) + tm_lines()

library(mapview)
mapview(list(sanfran, pt1, pt2, line1))



# ************************************************
# ----- Exercise 5: Solution 4 ----
# ************************************************

# There are 178 features and the geometry is 
# MULTILINESTRING (so one "road" can be made up
# of many LINE pieces)

roads <- read_sf("data/san-francisco/roads-mission.shp")

glimpse(roads)



# ************************************************
# ----- Exercise 5: Solution 5 ----
# ************************************************


roads_geom <- st_geometry(roads)

# This is a simple features column (sfc) and 
# MULTILINESTRING
class(roads_geom)

# This prints out the first road as sfg (starts with
# MULTILINESTRING ((51944.74...)))
roads_geom[[1]]



# ************************************************
# ----- Exercise 5: Solution 6 ----
# ************************************************

roads_name <- dplyr::select(roads, FULLNAME)

# Yes geometry is included
head(roads_name)



# ************************************************
# ----- Exercise 5: Solution 7 -----
# ************************************************

st_drop_geometry(roads_name)




# ************************************************
# ----- Exercise 5: Solution 8 -----
# ************************************************

pts_from_line <- st_cast(line1, "POINT")
plot(pts_from_line, pch = 16, 
     col = "midnightblue",
     cex = 3) # cex is a base argument for size




# ************************************************
# ----- Exercise 5: Solution 9 -----
# ************************************************

roads <- mutate(
  roads,
  rd_length = st_length(roads)
)

tm_shape(roads) + tm_lines("rd_length")


# ************************************************
# ----- Exercise 5: Solution 10 -----
# ************************************************
roads_sp <- rgdal::readOGR("data/san-francisco", 
                           layer = "roads-mission")


# Convert from sp to sf
rd_sf <- as(roads_sp, "sf")
class(rd_sf)

# Note that this also works
rd_sf <- st_as_sf(roads_sp)


# Convert from sf to sp
rd_sp <- as(rd_sf, "Spatial")
class(rd_sp)



# ************************************************
# ----- Exercise 5: Solution 11 -----
# ************************************************


sf::write_sf(line1, "data/line1.gpkg")

