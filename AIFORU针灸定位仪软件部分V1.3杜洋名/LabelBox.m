function ROI=LabelBox()
global pos
mouse=imrect;%�����ʮ�ּ�
pos=getPosition(mouse);% ��ȡ���λ�� x1 y1 �� ��
ROI=[pos(1) pos(2) pos(3) pos(4)]; 
end

