function ROI=Cal(a,b,c,d)
%��ȡ֮ǰ����
global duqi;
global chigushangyan;
global yaoyou;
global yaozuo;
global xiongjianjiehe;

%a b c d�ֱ�Ϊ���������ҵĴ���
%��ʽ��Ҫ��ֽ�ϼ���
if a~= 0
    ROI = [(duqi(1)-(duqi(1)-xiongjianjiehe(1))/(8/a)),duqi(2)-(abs(duqi(2)-xiongjianjiehe(2))/(8/a))];
else
    ROI =[duqi(1),duqi(2)];
end

if b~= 0
    ROI = [(duqi(1)-(duqi(1)-chigushangyan(1))/(5/b)),duqi(2)+(abs(duqi(2)-chigushangyan(2))/(5/b))]; 
else
    ROI =[ROI(1),ROI(2)];
end

if c~= 0
    ROI = [ROI(1)-(abs(duqi(1)-yaozuo(1))/(6/c)),(ROI(2)-(duqi(2)-yaozuo(2))/(6/c))];
else
    ROI =[ROI(1),ROI(2)];
end

if d~= 0
    ROI = [ROI(1)+(abs(duqi(1)-yaoyou(1))/(6/d)),(ROI(2)-(duqi(2)-yaoyou(2))/(6/d))];
else
    ROI =[ROI(1),ROI(2)];
end




