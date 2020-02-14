# ************************************************
# Spatial Data in R: Exercise 7
# ************************************************

# Data for burrito restaurants near the Mission
# District below come from the yelpr package, the
# roads come from the tigris package and the
# boundary for the Mission District comes from San
# Francisco Open Data neighborhoods file

# https://datasf.org/opendata/

# ************************************************
# ----- Exercise 7: Activity 1 -----
# ************************************************

# Run the code below and then create a map showing
# all three layers with "mission" on the bottom using
# tmap. Set burritos to be the master using
# tm_shape(burritos, is.master = TRUE)

path1 <- "data/san-francisco/burritos-mission.gpkg"
path2 <- "data/san-francisco/boundary-mission.gpkg"
path3 <- "data/san-francisco/roads-mission-400mbuf.shp"

burritos <- read_sf(path1)
mission <- read_sf(path2)
roads <- read_sf(path3)



# ************************************************
# ----- Exercise 7: Activity 2 -----
# ************************************************

# Using st_buffer() buffer the burrito restaurants
# by 300 meters. Use st_crs() on burritos and look
# at the units first. Are the units already meters
# or do you need to apply a conversion? Save the
# buffered burrito restaurants as burritos_300m
# and then look at it in mapview.

# [By the way, an alternative way to find units
# is to print the object to the console and look
# at the geometry column description <POINT [m]>]


# Extra credit if you can map the burrito points
# at the same time with buffers. (Hint: you'll
# need list()). The points are shown as open
# circles so you probably need to zoom in to 
# see that you have buffers + points

library(mapview)



# ************************************************
# ----- Exercise 7: Activity 3 -----
# ************************************************


# How many features are in the burrito buffer
# object (print to the console to find out?

# Use st_union() on the burrito buffer object and
# call this burrito_union and map it in mapview and
# zoom in a bit.  How many features are in the
# burrito_union object? What class is
# burrito_union (use class())?



# ************************************************
# ----- Exercise 7: EXTRA CREDIT 1 -----
# ************************************************


# For extra credit, run st_convex_hull() 
# on burrito_union and map the hull with the buffers.




# STOP HERE FOR NOW





# ************************************************
# ----- Exercise 7: Activity 4 -----
# ************************************************

# Over the next few activities you will compute
# the total length of roads in the 300m buffers
# around the burrito restaurants and then compare
# those for the burrito restaurants within vs
# outside the Mission District. This is similar
# to what we did in the slides.

# We will start with intersecting the buffers with
# the roads (so we can determine what roads are in
# each 300 meter buffer). Use st_intersection()
# with roads and burritos_300m as arguments. Try
# putting roads first, then try putting roads
# second. Does it work either way? There is a
# small difference in the output depending on if
# you put roads first.

# [Do not worry about the warning message related
# to attribute variables being spatially constant]

# Save the intersection result that has
# burritos_300m as the x argument and roads as 
# the y argument and name it roads_int




# ************************************************
# ----- Exercise 7: Activity 5 -----
# ************************************************

# Add the road length to the roads_int object using
# dplyr's mutate and st_length(). Call the
# new column roads_length. Take a look at the 
# geometry column. What are the units? What
# geometry type are the roads?




# ************************************************
# ----- Exercise 7: Activity 6 -----
# ************************************************

# Run this dplyr code to sum roads_length for each
# burrito restaurant buffer. 

tot_roads <- group_by(roads_int, name) %>% 
  summarise(tot_road_length = sum(roads_length))


# If you ran this with non-spatial data you'd get
# a dataset like this with total road length for
# each restaurant:

# Observations: 42
# Variables: 2
# $ name            <chr> "Bayshore Taqueria", "Casa Mexica…
# $ tot_road_length [m] 7863.854 [m], 6164.587 [m], 5350.90…


# But with spatial data you get an extra column
# as a bonus. What is this extra column and what
# type of geometry is it?





# ************************************************
# ----- Exercise 7: Activity 7 -----
# ************************************************

# You've computed the total length of road in the
# buffers and called it tot_roads. You want to join
# this variable into the original burritos
# dataset. You can use a dplyr, non-spatial join
# but what happens if you run this code?

DOES_NOT_WORK <- left_join(burritos, tot_roads, by = "name")

# We don't need the geometry from tot_roads merged
# in to burritos. We only want the tot_road_length
# field. Use st_drop_geometry() to drop the geometry
# from tot_roads and then do the left join on this.
# Call the new object burritos_with_roads


# ************************************************
# ----- Exercise 7: Activity 8 -----
# ************************************************

# Run the code below. It selects two restaurants
# and buffers them by 500 meters. Then we run
# st_intersects() in two ways.

# Run lengths() on both intersects1 and intersects2
# and describe what the results mean

# What are the dimensions of the 
# intersects_dense_matrix and why does it have
# that many rows and columns?


two_burrito_places <- filter(burritos, grepl("Panchita|Mago", name)) %>% 
  st_buffer(500)

mapview(list(burritos, two_burrito_places))


# Do some intersecting
intersects1 <- st_intersects(two_burrito_places, burritos)
intersects2 <- st_intersects(burritos, two_burrito_places)

# Intersect but dense matrix
intersects_dense_matrix <- st_intersects(burritos, 
             two_burrito_places, sparse = FALSE)


# ************************************************
# ----- Exercise 7: Activity 9 -----
# ************************************************

# The final calculation is to add a variable to
# burritos for whether or not the burrito
# restaurant is in the Mission District
# (TRUE/FALSE or 1/0)

# Run the code below and look at temp in the
# console. This is called a "sparse geometry
# binary predicate list"! Basically, a sparse list
# of results for each feature in one object
# against each feature in the other object. If the
# mission object had multiple polygons then the
# result of this code would list all the polygons
# the burrito points intersect with. In this case
# there is only one neighborhood so it returns a
# "1" if they intersect and "(empty)" if they
# don't.

temp <- st_intersects(burritos_with_roads, mission)
temp # print to console

# Add a new column to burritos_with_roads that is
# the result of lengths(temp) and call the new 
# column in_mission. This will be a 1/0 for whether 
# the burrito restaurant is in the Mission. 
# Use mutate().





# ************************************************
# ----- Exercise 7: Activity 10 -----
# ************************************************

# The result of st_length() has a units class (in
# this case meters). This can cause trouble with
# plotting or other operations so you may want
# to drop the units.

# Run this code to drop the units...

burritos_with_roads <- mutate(
  burritos_with_roads,
  tot_road_length = units::drop_units(tot_road_length)
)


# As a final step create an interactive plot using
# tmap of the mission and the burritos with roads but 
# for the burritos use tm_bubbles("tot_road_length")
# You'll need to change to "view" mode. If you 
# don't like the spread of circle sizes you can
# play around with the scale argument to tm_bubbles()

tmap_mode("view")



# STOP HERE FOR NOW




# ************************************************
# ----- Exercise 7: Activity 11 -----
# ************************************************

# BACKGROUND
# For these final activities, focused on rasters,
# we will compute average precipitation by
# neighborhood in SF based on the centroid AND
# based on averaging values in the polygons to
# see how they differ. By the way, the precip data
# comes from the PRISM Climate Group at Oregon State
# and I forced the raster to be higher resolution
# than it really is using disaggregate() -- I wanted
# it to look prettier :)





# THE ACTIVITY
# Run this code to read in the precipitation,
# county outline and neighborhood outlines. Using
# tmap create a map of precip and the county
# boundary (you can also add neighborhoods if you
# want). Do they have similar extents (determine
# this just by looking at the maps)?

path1 <- "data/san-francisco/precip-bayarea-disag.tif"
path2 <- "data/san-francisco/counties-sanfrancisco.gpkg"
path3 <- "data/san-francisco/neighborhoods-sanfrancisco.gpkg"

precip <- raster(path1) 
sfcounty <- read_sf(path2)
neighborhoods <- read_sf(path3)



# ************************************************
# ----- Exercise 7: Activity 12 -----
# ************************************************

# What error do you get when you run this code and
# why? When you run the plot code do the layers
# plot together?

crop(precip, sfcounty) # Error!
# SF county does not show up on top
plot(precip)
plot(st_geometry(sfcounty), add = TRUE)

# Review the CRS for all three layers you just
# read in (precip, sfcounty, neighborhoods). Which
# two have a projected CRS and which has a
# geographic (unprojected) CRS?

st_crs(precip)
st_crs(sfcounty)
st_crs(neighborhoods)


# To project the un-projected layer, you will need
# a function you have not used before, so you may
# need to look it up in google or the slides ("r
# project raster" in Google will get you an
# answer). Important: you need the proj4string --
# it will not accept an EPSG. You can copy the 
# proj4string from the result of st_crs(sfcounty).
# Project the raster to match the CRS of the others 
# (it might take a second)

## Fill in the blanks
## ---(---, crs = ---)


# After projecting this should work (the county
# is small)
plot(precip)
plot(st_geometry(sfcounty), add = TRUE)


# ************************************************
# ----- Exercise 7: Activity 13 -----
# ************************************************

# You should make the precipitation layer's extent
# match that of sfcounty and mask the values
# outside the outline. You should use mask() and
# crop() 

# Save the final as precip_sf and plot to confirm
# you did it correctly.






# ************************************************
# ----- Exercise 7: Activity 14 -----
# ************************************************

# Using a function from sf, get the centroids of
# the neighborhoods (not the county, the
# neighborhoods) and call the result
# neighborhood_centroids

# [Don't worry about the warning related to attributes
# being constant]





# ************************************************
# ----- Exercise 7: Activity 15 -----
# ************************************************

# Use the extract function in three ways:

# 1. Extract the values of precip at the neighborhood
# centroids (neighborhood_centroids)

# 2. Extract the values of precip within the 
# neighborhood boundaries (don't use the "fun =" argument)

# 3. Extract the average value of precip within 
# the neighborhoods (using fun = mean)

# Then take a look at the output for each in the
# console. What type of object is returned for
# each calculation?



# UNCOMMENT AND REPLACE ---

# vals_centroid <- extract(---)
# vals_neighborhood <- extract(---)
# vals_neighborhood_mean <- extract(---)




# ************************************************
# ----- Exercise 7: Activity 16 -----
# ************************************************

# Remember from above that vals_neighborhood is
# the list of ALL grid values in each neighborhood
# (not an average or single value). In the code
# below you'll be applying the lengths() function
# to this list and it will return the count of
# grid cells for each neighborhood.  You can see
# that the third neighborhood has a lot of grid
# cells (meaning it is big). This neighborhood is
# the Presidio National Park and you can see from
# the map that it is on the ocean.

lengths(vals_neighborhood)
neighborhoods$name[3]
plot(precip_sf)
plot(st_geometry(neighborhoods[3,]), add = TRUE)

# Pull out the values for the Presidio -- this is
# the third element in the list -- you'll need
# double square brackets. What is the range of
# values? You can sort them or use the range() 
# function



# ************************************************
# ----- Exercise 7: Activity 17 -----
# ************************************************

# Run the code below to look at how precipitation
# based on the centroid vs an average of grid
# cells compare. What columns are you adding
# in this first block of code?

library(dplyr)
neighborhoods <- mutate(
  neighborhoods,
  precip_centroid = vals_centroid,
  precip_mean = vals_neighborhood_mean[,1] 
)

library(ggplot2)
ggplot(neighborhoods, aes(precip_centroid, precip_mean)) + 
  geom_point(color = "blue") + 
  geom_abline(slope = 1, intercept = 0) +
  labs(
    x = "Precipitation at neighborhood centroid",
    y = "Neighborhood average of precipitation cells",
    title = "Wow! Very similar."
  )


# Now create an interactive, side-by-side
# choropleth (color-coded) map of the variables
# "precip_mean" and "precip_centroid"! This is not
# as hard as it sounds.

# Hints:
# You'll need tmap_mode("view)

# You'll want tm_polygons(c("precip_mean",
# "precip_centroid"))

# You might want palette = "Blues" or you can pick
# one with tmaptools::palette_explorer()












