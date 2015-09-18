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

![Image](https://cloud.githubusercontent.com/assets/6601105/7543497/d28b354e-f592-11e4-93de-14f6f5ed944d.png?raw=true)


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

![Image](https://cloud.githubusercontent.com/assets/6601105/7543779/382bd762-f595-11e4-9e91-03fd4aa0c963.png?raw=true)


# R-Radar-Chart
Function for R that will produce a radar plot with confidence intervals and an indication of the zero line (red dashed). 

radarPlot()

*    values: matrix of indivsXvalues giving mean response
*    val.l: matrix of indivsXlow credible interval values
*    val.h: matrix of indivsXhigh credible interval values
*    scale.within: scale the values within each chart
*    legend: add a legend
*    color = 'black' sets background color to black
  
![Image](https://cloud.githubusercontent.com/assets/6601105/9971179/ef3b471c-5e27-11e5-9a8d-822b47f564d2.png?raw=true)

