# Materials for the Modern Geospatial Data Analysis with R workshop

Created by Zev Ross, [ZevRoss Spatial Analysis](https://www.zevross.com)

## Overview

The workshop was taught over two days in San Franscisco by Zev and five great TAs: Hollie Olmstead, Angela Li, Dennis Irorere, Jindra Lacko and Thomas Mock. 

The material was delivered in a combination of slides and exercises.

## Slides

You can get the slides in full resolution and HTML format at [this link](https://t.co/rSzPTt6VBk). Be aware that these slides are not an optimized website so images may be bigger than you want if you're viewing with no WIFI. 

The slides, as PDFs, are available in the slides folder in this repo.

## Workshop package with exercises (and solutions!)

There is a custom R package that was used during the workshop. This package includes the data, the exercises and the solutions and functions to open the exercises and solutions (see below for more detail).

If you want to skip downloading and installing the package you can find the data in the `exercise-data-without-package` folder here in this repo and you can find the exercises and solutions in the `exercises-solutions-without-package` folder.

If you want to download and install the package you can get it from the `workshop-package` folder in this GitHub repo (do not unzip this file). To install, in RStudio, use the Tools pull down and choose install packages. Then change the "Install from" to be "Package Archive File" and find the downloaded package.

Then to open the exercises and solutions use the following code -- it will open a script window with the exercise and solution. Use `open_exercise(2)` to open the second exercise and so on.

```r
library(zrsaSpatialWorkshop)
open_exercise(1)
open_solution(1)
```


