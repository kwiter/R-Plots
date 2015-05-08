#example Data
data = c(3300,11000,19900,15600,33000,2222,4345,23123)
names(data)= c('Red Oak','White Oak','Tulip Poplar','Red Maple','Sugar Maple','Ironwood','Beech','Cedar')

pictogram <- function(data,size.gap = 3, dtree, ctree = NULL,aspect = .7,Main.Title = '',xTitle = '', yTitle='',ypos=NA,Unit.Name = ''){ #plot a pictogram
  #data: vector of counts with names
  #size.gap: fraction of column height is gap fraction = icon.height/size.gap, 
  #dtree: primary icon.png 
  #ctree: secondary icon.pnd
  #aspect:width/height of icon
  #ypos: positions the ylabel vertically [0,1] default is the highest column
  #make sure icon is croped to the edges

  require(png)  
  ndata = length(data)
  height = 1/ndata 
  gap = height / size.gap
  height = height - gap
  width = aspect*height
  
  xs = c(0,width)
  ys = c(0,height)
  xshift = width
  yaxe = seq(height/2,1,by = height+gap)[1:ndata]
  yshift = height + gap
  
  num = floor(1/xshift)
  size = ceiling(max(data)/num)
  ns = data/size
  Title = Main.Title
  xTit = yTitle
  yTit = xTitle
  
  par(mar=c(3, 4, 3, 2), oma=c(0,0,0,0), bg="#F0F0F0", xpd=FALSE, xaxs="r", yaxs="i", mgp=c(2.1,.3,0), las=1, col.axis="#434343", col.main="#343434", tck=0, lend=1)
  plot(0,0,xlim=c(0,1),ylim=c(0,1),type='n',xaxt='n',yaxt='n',bty='n',las=1,main=Title, xlab=bquote(bold(.(xTit))), ylab=bquote(bold(.(yTit))), family="Helvetica", cex.main=1.5, cex.axis=0.8, cex.lab=0.8)
  
  if(is.null(ctree))ctree = dtree
  for(j in 1:length(data)){
    for(i in 1:ceiling(ns[j])){
      if(i %% 2 != 0){icon = dtree}else{icon = ctree}
      rasterImage(image=icon,xleft=xs[1]+xshift*(i-1),xright=xs[2]+xshift*(i-1),ybottom=ys[1]+yshift*(j-1),ytop=ys[2]+yshift*(j-1)) # single pack 
    }
    rect(col = "#F0F0F0",border="#F0F0F0",
         xleft=xs[1]+xshift*(i-1)+(ns[j]%%1)*diff(xs),xright=xs[2]+xshift*(i-1),ybottom=ys[1]+yshift*(j-1),ytop=ys[2]+yshift*(j-1))
  }
  grid(NULL, NULL, col="#DEDEDE", lty="solid", lwd=0.9)
  axis(1,at = c(0,(max(ns)/2)*xshift,max(ns)*xshift),labels=c(0,floor(max(data)/2),max(data)), cex.axis=0.9)
  axis(2,at =yaxe,labels=names(data),tick=F, cex.axis=0.9,line=-.4)
  
  if(is.na(ypos))ypos = ys[1]+yshift*(j-1)
  icon = dtree
  zoom = 0.9
  a = strwidth('Each ', cex = zoom)
  b = strwidth(paste(' equals',size,Unit.Name), cex = zoom)
  xpos = 1-a-b - width
  rasterImage(image=icon,xleft=xpos,xright=xpos+width,ybottom=ypos,ytop=ypos+height)
  text(xpos,ypos+height/2,labels = 'Each ',adj=c(1,0.5))
  text(xpos+width,ypos+height/2,labels = paste(' equals',size,Unit.Name),adj=c(0,.5))
  
}

