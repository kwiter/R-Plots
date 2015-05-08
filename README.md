# R-Pictogram
  Simple function to make pictographs in r
  The parameters of the function are:
  
*    data: vector of counts with names
*    size.gap: fraction of column height is gap fraction = icon.height/size.gap, 
*    dtree: primary icon.png 
*    ctree: secondary icon.pnd
*    aspect: width/height of icon
*    ypos: positions the ylabel vertically [0,1] default is the highest column
  
dtree and ctree can be any icon.
Just make sure the icon is cropped to the edges.

