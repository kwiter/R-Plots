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

###
##
###

squarePie <- function(data,size.gap = 10,Main.Title = 'Main Title',Sub.Title=NA,Unit.Name = 'Units',nh = 7,nw = 34){ #plot a pictogram
  
  #data: vector of counts with names
  #size.gap: fraction of column height is gap between squares, fraction = icon.height/size.gap
  #nh: number of squares high
  #nw: number of squares wide

  data = rev(sort(data))
  ndata = length(data)
  
  colours = c("#00A0B0","#6A4A3C","#CC333F","#EDC951","#37C040")
  colours = colorRange(percent = seq(0,1,length=ndata+1),colours = colours,trans = 1)
  width = .7
  height = width/4
  n = nh*nw
  unit = round(sum(data,na.rm=T) / n)
  allNum = round(data/unit)
  cumNum = cumsum(allNum)
  
  iSide=min(c(height/nh,width/nw))
  gap = iSide / size.gap
  
  iSide = iSide - gap
  shift = iSide + gap  
  
  xs = c(shift,shift+iSide)
  ys = c(.45,.45+iSide)
  dotted = c(1,ceiling(cumNum/nh)+1)

  par(mar=c(0, 0, 0, 0), oma=c(0,0,0,0), bg="white", xpd=FALSE, xaxs="r", yaxs="i", mgp=c(2.1,.3,0), las=1, col.axis="#434343", col.main="#343434", tck=0, lend=1)
  plot(0,0,xlim=c(0,1),ylim=c(0,1),type='n',xaxt='n',yaxt='n',bty='n',las=1,xlab="", ylab="", family="Helvetica", cex.main=1.5, cex.axis=0.8, cex.lab=0.8)
  rect(xleft = 0, xright = shift*(nw + .4*nw) + xs[1], 
       ybottom = ys[1] - shift*3.5 - 2*strheight(names(data)[1],cex=.75), ytop =  shift*(nh) + ys[2] + strheight(Main.Title) + shift,
       col = "#E8F4F8" ,border="#000026")
  k = 0;l=1
  for(j in 1:(nw+3)){
    if(j==dotted[l]){
      if(l %% 3 == 0){mul = 2.6}else{if(l %% 3 == 2){mul = 1.3}else{mul = 0}}
      lines(x = rep(xs[1]+shift*(j-1+.5),2),y = c(ys[1]-shift*.1,ys[1] - shift*0.8 - mul*strheight(names(data)[1],cex=.75)),lty=3,lwd=1,col="#000026")
      text(xs[1]+shift*(j-1),ys[1] - shift - mul*strheight(names(data)[1],cex=.75),names(data)[l],cex=.75,adj=c(0,.9),col="#000026")
      l=l+1
    }
    for(i in 1:nh){
      k = k + 1
      colNum = rep(1:ndata,allNum)
      rect(xleft=xs[1]+shift*(j-1),xright=xs[2]+shift*(j-1),ybottom=ys[1]+shift*(i-1),ytop=ys[2]+shift*(i-1),
           col = colours[colNum[k]] ,border="#E8F4F8") # single pack 
      if(k == sum(allNum))break
    }
    if(k == sum(allNum))break  
  }
  text(shift, 
       shift*(nh) + ys[2] ,
       labels = Main.Title,
       pos=4,offset=0,col="#000026")
  
  sub.width = (shift*(nw + .4*nw) + xs[1]) - (xs[2]+shift*(j-1)) - shift
  if(is.na(Sub.Title)){
    Sub.Title = str_wrap(paste(prettyNum(sum(data,na.rm=T),big.mark=",",scientific=F),'total', Unit.Name), width = floor(2*sub.width/strwidth('me', cex = 1)), indent = 0, exdent = 0)
  }else{
    Sub.Title = str_wrap(Sub.Title, width = floor(2*sub.width/strwidth('me', cex = 1)), indent = 0, exdent = 0)
  }
  text(shift*(nw + .4*nw) + xs[1] - shift, 
       shift*(nh) + ys[2] + strheight(Main.Title),
       labels = Sub.Title,
       adj=c(1,1),col="#000026")
  
  rect(xleft =  (shift*(nw + .4*nw) + xs[1]) - (2*shift + strwidth(paste(unit,Unit.Name))/2) ,
       xright = (shift*(nw + .4*nw) + xs[1]) - (shift + strwidth(paste(unit,Unit.Name))/2),
       ybottom=ys[1],ytop=ys[2],
       col = colours[ndata+1] ,border="#E8F4F8") 
  lines(x = rep((shift*(nw + .4*nw) + xs[1]) - (1.5*shift + strwidth(paste(unit,Unit.Name))/2),2),
        y = c(ys[1]-shift*.1,ys[1] - shift*.8),lty=3,lwd=1,col="#000026")
  text(x = (shift*(nw + .4*nw) + xs[1]) - (1.5*shift + strwidth(paste(unit,Unit.Name))/2),
       y = ys[1] - shift,
       paste(prettyNum(unit,big.mark=",",scientific=F),Unit.Name),cex=.75,col="#000026")
  
  
}




