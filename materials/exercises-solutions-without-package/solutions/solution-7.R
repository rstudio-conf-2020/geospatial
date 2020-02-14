# Solutions to exercise-7


# ************************************************
# ----- Exercise 7: Solution 1 ----
# ************************************************

tm_shape(mission) + tm_polygons() + 
  tm_shape(roads) + 
  tm_lines() + 
  tm_shape(burritos, is.master = TRUE) + tm_dots(size = 1, col = "red")


# ************************************************
# ----- Exercise 7: Solution 2 ----
# ************************************************

st_crs(burritos) # units are already meters
burritos_300m <- st_buffer(burritos, 300)
mapview(burritos_300m)

# Show both together
mapview(list(burritos_300m, burritos))

# Alternative code for showing both together
mapview(burritos_300m) + burritos


# ************************************************
# ----- Exercise 7: Solution 3 ----
# ************************************************

# There are 50 burrito restaurant buffer object
burritos_union <- st_union(burritos_300m)

mapview(burritos_union)

# There is only one feature in burritos_union
class(burritos_union) #sfc



# ************************************************
# ----- Exercise 7: EXTRA CREDIT 1            ----
# ************************************************

# You can apply a hull to either the sfc or sf object
hull <- st_convex_hull(burritos_union)

tm_shape(hull, is.master = TRUE) + tm_polygons() +
  tm_shape(burritos_300m) + tm_polygons(col = "forestgreen")


# ************************************************
# ----- Exercise 7: Solution 4 ----
# ************************************************


# The only difference in this case if you reverse
# the order of the arguments is that the order
# of the variables in the output table also gets
# reversed

roads_int <- st_intersection(burritos_300m, roads)
# Observations: 935
# Variables: 10
# $ name         <fct> Taqueria Cazadores, Picon,…
# $ review_count <int> 170, 26, 591, 2486, 576, 8…
# $ rating       <dbl> 4.0, 4.5, 4.0, 4.0, 4.0, 3…
# $ distance     <dbl> 1502.9131, 1754.7685, 1870…
# $ address      <fct> 1600 Mission St, 167 11th …
# $ LINEARID     <fct> 110498934886, 110498934886…
# $ FULLNAME     <fct> Natoma St, Natoma St, Lagu…
# $ RTTYP        <fct> M, M, M, M, M, M, M, M, M,…
# $ MTFCC        <fct> S1400, S1400, S1400, S1400…
# $ geom         <LINESTRING [m]> LINESTRING (509…
y <- st_intersection(roads, burritos_300m)
# Observations: 935
# Variables: 10
# $ LINEARID     <fct> 110498931582, 110498931776…
# $ FULLNAME     <fct> 25th St, Capp St, Mission …
# $ RTTYP        <fct> M, M, M, M, M, M, M, M, M,…
# $ MTFCC        <fct> S1400, S1400, S1400, S1400…
# $ name         <fct> El Farolito, El Farolito, …
# $ review_count <int> 4708, 4708, 4708, 4708, 47…
# $ rating       <dbl> 4, 4, 4, 4, 4, 4, 4, 4, 4,…
# $ distance     <dbl> 1035.959, 1035.959, 1035.9…
# $ address      <fct> 2779 Mission St, 2779 Miss…
# $ geometry     <LINESTRING [m]> LINESTRING (510…


# The geometry is LINESTRING



# ************************************************
# ----- Exercise 7: Solution 5 ----
# ************************************************

roads_int <- mutate(
  roads_int,
  roads_length = st_length(roads_int)
)


glimpse(roads_int) # The roads are LINESTRING

# There is also a function for doing that and with
# this you can see that there is both LINESTRING
# and MULTILINESTRING

st_geometry_type(roads_int) %>% 
  unique()


# ************************************************
# ----- Exercise 7: Solution 6 ----
# ************************************************


tot_roads <- group_by(roads_int, name) %>% 
  summarise(tot_road_length = sum(roads_length))

# You get a geometry/geom column. This is a 
# MULTILINESTRING because it grouped all the 
# LINESTRINGs in a buffer into a single geometry. 
# In other words, all roads in a buffer around
# a restaurant get grouped together as a "single" 
# feature (a MULTI feature)

# Observations: 42
# Variables: 3
# $ name            <chr> Bayshore Taqueria, Casa Mexicana,…
# $ tot_road_length [m] 7863.854 [m], 6164.587 [m], 5350.90…
# $ geom            <MULTILINESTRING [m]> MULTILINESTRING (…


# ************************************************
# ----- Exercise 7: Solution 7 ----
# ************************************************

# You get the error:
# Error: y should be a data.frame; for spatial joins, use st_join
# because it won't let you do a regular tabular join
# with two spatial objects. One needs to be
# a non-spatial object.

# A spatial join (st_join()) is based on geometry
# not on a common column

# We only want the tot_road_length variable added
# to burritos, we don't need the MULTILINESTRING
# of roads in the buffers.

burritos_with_roads <- left_join(burritos, 
              st_drop_geometry(tot_roads), by = "name")




# ************************************************
# ----- Exercise 7: Solution 8 ----
# ************************************************

# The result of this is 3 and 9. This means that
# 3 restaurants intersect with the first buffer
# and 9 restaurants intersect with the second buffer
lengths(intersects1)



# The result of this starts with 0 0 1 0 1 0 2
# meaning that the first two burrito restaurants
# do not intersect with a buffer. The 7th, though,
# intersects with both (2) buffers.
lengths(intersects2)

# The dense matrix dimension is 50 x 2
dim(intersects_dense_matrix)

# Each row of the matrix is one of the restaurants
# and each column is one of the 2 buffers. So
# restaurant 1 and 2 have both FALSE so they don't
# intersect either buffer. But row 3 intersects
# with the second buffer and row 7 (restaurant 7)
# intersects with both buffers.

# > head(intersects_dense_matrix, n = 7)
#       [,1]  [,2]
# [1,] FALSE FALSE
# [2,] FALSE FALSE
# [3,] FALSE  TRUE
# [4,] FALSE FALSE
# [5,] FALSE  TRUE
# [6,] FALSE FALSE
# [7,]  TRUE  TRUE

# ************************************************
# ----- Exercise 7: Solution 9 ----
# ************************************************

temp <- st_intersects(burritos_with_roads, mission)
burritos_with_roads <- mutate(
  burritos_with_roads,
  in_mission = lengths(temp)
)

# ************************************************
# ----- Exercise 7: Solution 10 ----
# ************************************************

tmap_mode("view")
tm_shape(mission) + tm_polygons() + 
  tm_shape(burritos_with_roads, is.master = TRUE) + 
  tm_bubbles(
    "tot_road_length", 
    alpha = 0.5, 
    col = "forestgreen",
    scale = 2
  )



# ************************************************
# ----- Exercise 7: Solution 11 ----
# ************************************************

# Precip covers a much bigger area than the county
# outline or neighborhoods.


library(tmap)
tm_shape(precip) + tm_raster() + 
  tm_shape(neighborhoods) + tm_polygons() +
  tm_shape(sfcounty) + tm_borders()



# ************************************************
# ----- Exercise 7: Solution 12 ----
# ************************************************

# The error is 
# Error in .local(x, y, ...) : extents do not overlap
# It's telling you that there is no overlap so
# crop will produce nothing
crop(precip, sfcounty) # Error!

# No, they don't plot together
plot(precip)
plot(st_geometry(sfcounty), add = TRUE)


crs(precip) # unprojected
st_crs(sfcounty) # projected
st_crs(neighborhoods) # projected


# Use project to transform the CRS to projected (to "project" the raster)
# Thse both work
precip <- projectRaster(precip, crs = "+proj=tmerc +lat_0=37.75 +lon_0=-122.45 +k=1.000007 +x_0=48000 +y_0=24000 +ellps=GRS80 +units=m +no_defs")
precip <- projectRaster(precip, crs = st_crs(sfcounty)$proj4string)

# After projecting this should work
plot(precip)
plot(st_geometry(sfcounty), add = TRUE)


# ************************************************
# ----- Exercise 7: Solution 13 ----
# ************************************************

mask1 <- mask(precip, sfcounty)
precip_sf <- crop(mask1, sfcounty)


plot(precip_sf)
plot(st_geometry(sfcounty), add = TRUE)


# ************************************************
# ----- Exercise 7: Solution 14 -----
# ************************************************

neighborhood_centroids <- st_centroid(neighborhoods)




# ************************************************
# ----- Exercise 7: Solution 15 -----
# ************************************************

# Gives a vector of values -- one precip value
# for each neighborhood centroid
vals_centroid <- extract(precip, neighborhood_centroids)

# Gives a list where each list element
vals_neighborhood <- extract(precip, neighborhoods)

# Careful with this one, it results in a matrix
# (not a vector) so you need to access values with
# something like vals_neighborhood_mean[,1]
vals_neighborhood_mean <- extract(precip, neighborhoods, fun = mean)



# ************************************************
# ----- Exercise 7: Solution 16 -----
# ************************************************

vals_neighborhood[[3]]
range(vals_neighborhood[[3]])
min(vals_neighborhood[[3]]) #611.3647
max(vals_neighborhood[[3]]) #642.4458

642.4458-611.3647

# These values are in millimeters so there is a 3.1
# cm or 1.2 inch difference in rainfall within a
# year in this neighborhood.

# ************************************************
# ----- Exercise 7: Solution 17 -----
# ************************************************

# In the first block of code you're adding the
# following columns:

# 1. precip_centroid: this is the amount of precipitation
# at the centroid of the neighborhood
# 2. precip_mean: this is the average of all the
# precipitation raster cells in the neighborhood

library(tmap)
tmap_mode("view")
tm_shape(neighborhoods) + 
  tm_polygons(c("precip_mean", "precip_centroid"), palette = "Blues")
