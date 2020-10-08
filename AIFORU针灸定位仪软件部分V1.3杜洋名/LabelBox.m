function ROI=LabelBox()
global pos
mouse=imrect;%鼠标变成十字架
pos=getPosition(mouse);% 获取鼠标位置 x1 y1 宽 高
ROI=[pos(1) pos(2) pos(3) pos(4)]; 
end

