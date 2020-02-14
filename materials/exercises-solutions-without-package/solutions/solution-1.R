# Solutions to exercise-1


# ************************************************
# ----- Exercise 1: Solution 1 ----
# ************************************************

# There are 58 features. "Simple feature collection
# with 58 features and 17 fields"

# Yes, the proj4string, which refers to the
# coordinate reference system, says "longlat" which
# means that this data uses longitude and latitude
# instead of X and Y (referred to as an unprojected
# coordinate reference system -- coordinates are
# based on the globe rather than a flat map).

# We will learn more about proj4string later



# ************************************************
# ----- Exercise 1: Solution 2 ----
# ************************************************

# Last column is called geometry and it is a
# MULTIPOLYGON -- meaning that each county could
# be made up of several small polygons (little
# islands etc)

glimpse(ca_counties)

# The MULTIPOLYGON [°] refers to this being a 
# MULTIPOLYGON with units of degrees. Later you 
# will see examples like MULTIPOLYGON [m] for meters



# ************************************************
# ----- Exercise 1: Solution 3 ----
# ************************************************

library(dplyr)
ca_counties_lim <- select(
  ca_counties, 
  GEOID,
  NAME,
  AWATER,
  ALAND
)

glimpse(ca_counties_lim)

# You can see that geometry column is sticky and gets
# included automatically

# Observations: 58
# Variables: 5
# $ GEOID    <fct> 06091, 06067, 06083, 06009, 06…
# $ NAME     <fct> Sierra, Sacramento, Santa Barb…
# $ AWATER   <dbl> 23299110, 76217822, 2729814515…
# $ ALAND    <dbl> 2468694586, 2499039655, 708400…
# $ geometry <MULTIPOLYGON [°]> MULTIPOLYGON (((-…


# ************************************************
# ----- Exercise 1: Solution 4 ----
# ************************************************


# Four maps get created because the default for 
# plot() is to plot all attributes

# In the second version we start with st_geometry(),
# a function you'll learn later, that extracts
# just the geometry (no attributes) and then we
# plot and it only shows the geometry (one map).



# ************************************************
# ----- Exercise 1: Solution 5 ----
# ************************************************

# The tmap package is amazing. If you use 
# tm_polygons() it plots both fill and borders
# but you can plot each of these individually to
# get more control over your map.

# tm_fill() shows just the filled counties
# tm_borders() shows just the borders

library(tmap)
tm_shape(ca_counties_lim) + tm_fill()
tm_shape(ca_counties_lim) + tm_borders()

# ************************************************
# ----- Exercise 1: Solution 6 ----
# ************************************************

# The resolution is listed on the third line down
# and is 24.5 x 30.8. Under crs we see "+units=m"
# meaning that the resolution is 24.5 x 30.8 meters.
# The max and min elevation values are -5.5 and
# 281 (these are also meters).

# ************************************************
# ----- Exercise 1: Solution 7 ----
# ************************************************

# Running plot on this raster, since it only has
# one layer (to be discussed later), creates just
# a single map
plot(elevation)

# As you might guess axes = FALSE removes the axes,
# creating a cleaner plot

plot(elevation, axes = FALSE)
