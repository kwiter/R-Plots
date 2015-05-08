# R-Pictogram
  Simple function to make pictographs in r
  The parameters of the function are:
  
  pictogram()

*    data: vector of counts with names
*    size.gap: fraction of column height is gap fraction = icon.height/size.gap, 
*    dtree: primary icon.png 
*    ctree: secondary icon.pnd
*    aspect: width/height of icon
*    ypos: positions the ylabel vertically [0,1] default is the highest column
  
dtree and ctree can be any icon.
Just make sure the icon is cropped to the edges.

# R-SquarePie
Square Pie or Waffle Chart for R

squarePie()

*    data: vector of counts with names
*    size.gap: fraction of column height is gap between squares, fraction = icon.height/size.gap
*    nh: number of squares high
*    nw: number of squares wide
*    Sub.Title defaults to total "number" of units

Needs colorRange function in kwiter/R-Colors/ColorTools.r 


This chart should be saved as a square

# R-Radar-Chart
Function for R that will produce a radar plot with confidence intervals and an indication of the zero line (red dashed). 

radarPlot()

*    values: matrix of indivsXvalues giving mean response
*    val.l: matrix of indivsXlow credible interval values
*    val.h: matrix of indivsXlow credible interval values
*    scale.within: scale the values within each chart
*    legend: add a legend
  


