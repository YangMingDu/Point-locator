function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".    
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 14-Oct-2019 11:30:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% End initialization code - DO NOT EDIT


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;
global v1;%病人名称

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% 胸剑结合向下移动
function pushbutton16_Callback(hObject, eventdata, handles)
global xiongjianjiehe;
plot(xiongjianjiehe(1),xiongjianjiehe(2),'w-.s','MarkerSize',1, 'LineWidth', 30);%用白点盖住原来的红点以及十字光标
xiongjianjiehe(2) = xiongjianjiehe(2) -5;%y轴坐标-5
plot(xiongjianjiehe(1),xiongjianjiehe(2),'r-.s','MarkerSize',1, 'LineWidth', 8);%点出新坐标红点


% 胸剑结合向左移动
function pushbutton18_Callback(hObject, eventdata, handles)
global xiongjianjiehe;
plot(xiongjianjiehe(1),xiongjianjiehe(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
xiongjianjiehe(1) = xiongjianjiehe(1) -5;
plot(xiongjianjiehe(1),xiongjianjiehe(2),'r-.s','MarkerSize',1, 'LineWidth', 8);



%胸剑结合向上移动
function pushbutton19_Callback(hObject, eventdata, handles)
global xiongjianjiehe;
plot(xiongjianjiehe(1),xiongjianjiehe(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
xiongjianjiehe(2) = xiongjianjiehe(2) + 5;
plot(xiongjianjiehe(1),xiongjianjiehe(2),'r-.s','MarkerSize',1, 'LineWidth', 8);




%胸剑结合向右移动
function pushbutton20_Callback(hObject, eventdata, handles)
global xiongjianjiehe;
plot(xiongjianjiehe(1),xiongjianjiehe(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
xiongjianjiehe(1) = xiongjianjiehe(1)+ 5;
plot(xiongjianjiehe(1),xiongjianjiehe(2),'r-.s','MarkerSize',1, 'LineWidth', 8);

%胸剑结合
function pushbutton21_Callback(hObject, eventdata, handles)

global xiongjianjiehe
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
xiongjianjiehe = LabelBox();
plot(xiongjianjiehe(1),xiongjianjiehe(2),'r-.s','MarkerSize',1, 'LineWidth', 8);

%save('xiongjianjiehe.mat', 'xiongjianjiehe');


% 中脘
function pushbutton1_Callback(v1, eventdata, handles)
global STB;%global诊断信息
yuanzhong = Cal(4,0,0,0);%计算为肚脐向上4寸
plot(yuanzhong(1),yuanzhong(2),'b-.s','MarkerSize',1, 'LineWidth', 4);%画点
set(v1, 'BackgroundColor',[1 1 0]);%按钮高亮
STB = [STB,'中脘',',']%添加诊断信息
set(handles.edit6,'string',STB)%显示诊断信息


%下脘
function pushbutton4_Callback(v2, eventdata, handles)
global STB;
xiawan = Cal(2,0,0,0);
plot(xiawan(1),xiawan(2),'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v2, 'BackgroundColor',[1 1 0]);
STB = [STB,'下脘',',']
set(handles.edit6,'string',STB)



% 水分
function pushbutton5_Callback(v3, eventdata, handles)
global STB;
shuifen = Cal(1,0,0,0);
plot(shuifen(1),shuifen(2),'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v3, 'BackgroundColor',[1 1 0]);
STB = [STB,'水分',',']
set(handles.edit6,'string',STB)

% 阴交
function pushbutton6_Callback(v4, eventdata, handles)
global STB;
yinjiao = Cal(0,1,0,0);
plot(yinjiao(1),yinjiao(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v4, 'BackgroundColor',[1 1 0]);
STB = [STB,'阴交',',']
set(handles.edit6,'string',STB)



% 气海
function pushbutton7_Callback(v5, eventdata, handles)
global STB
qihai = Cal(0,1.5,0,0);
plot(qihai(1),qihai(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v5, 'BackgroundColor',[1 1 0]);
STB = [STB,'气海',',']
set(handles.edit6,'string',STB)


%关元
function pushbutton8_Callback(v6, eventdata, handles)
guanyuan = Cal(0,3,0,0);
plot(guanyuan(1),guanyuan(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v6, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'关元',',']
set(handles.edit6,'string',STB)


% 天枢
function pushbutton9_Callback(v7, eventdata, handles)
tianshuzuo = Cal(0,0,2,0);
plot(tianshuzuo(1),tianshuzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
tianshuyou = Cal(0,0,0,2);
plot(tianshuyou(1),tianshuyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v7, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'天枢',',']
set(handles.edit6,'string',STB)



% 商曲
function pushbutton10_Callback(v8, eventdata, handles)
shanquzuo = Cal(2,0,0.5,0);
plot(shanquzuo(1),shanquzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
shangquyou = Cal(2,0,0,0.5);
plot(shangquyou(1),shangquyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v8, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'商曲',',']
set(handles.edit6,'string',STB)


% 滑门肉
function pushbutton11_Callback(v9, eventdata, handles)
huaroumenzuo = Cal(1,0,2,0);
plot(huaroumenzuo(1),huaroumenzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
huaroumenyou = Cal(1,0,0,2);
plot(huaroumenyou(1),huaroumenyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v9, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'滑肉门',',']
set(handles.edit6,'string',STB)


% 气旁
function pushbutton12_Callback(v10, eventdata, handles)
qipangzuo = Cal(0,1.5,0.5,0);
plot(qipangzuo(1),qipangzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
qipangyou = Cal(0,1.5,0,0.5);
plot(qipangyou(1),qipangyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v10, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'气旁',',']
set(handles.edit6,'string',STB)


% 气穴
function pushbutton13_Callback(v11, eventdata, handles)
qixuezuo = Cal(0,3,0.5,0);
plot(qixuezuo(1),qixuezuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
qixueyou = Cal(0,3,0,0.5);
plot(qixueyou(1),qixueyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v11, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'气穴',',']
set(handles.edit6,'string',STB)



% 外陵
function pushbutton14_Callback(v12, eventdata, handles)
wailingzuo = Cal(0,1,2,0);
plot(wailingzuo(1),wailingzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
wailingyou = Cal(0,1,0,2);
plot(wailingyou(1),wailingyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v12, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'外陵',',']
set(handles.edit6,'string',STB)


% 清空穴位
function pushbutton15_Callback(hObject, eventdata, handles)
%先global一下之前设置的所有变量，在这个按钮中能方便使用
global im;
global duqi;
global chigushangyan;
global yaoyou;
global yaozuo;
global xiongjianjiehe;
imshow(im);
set(gca, 'Xlim', [0 1024], 'Ylim', [0 1024]);%设置背景图片的大小
%打印参数坐标（包括参数线腰左腰右）
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
plot(duqi(1),duqi(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);
plot(chigushangyan(1),chigushangyan(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
plot(xiongjianjiehe(1),xiongjianjiehe(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
set(handles.pushbutton1,'BackgroundColor',[0.94 0.94 0.94]');%取消所有按钮高亮
set(handles.pushbutton4,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton5,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton6,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton7,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton8,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton9,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton10,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton11,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton12,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton13,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton14,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton54,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton56,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton57,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton58,'BackgroundColor',[0.94 0.94 0.94]');
set(handles.pushbutton59,'BackgroundColor',[0.94 0.94 0.94]');
global STB;%清空诊断信息
STB = '';
set(handles.edit6,'string',STB);
hold on;

%腰右向下
function pushbutton43_Callback(hObject, eventdata, handles)
global yaoyou;
plot(yaoyou(1),yaoyou(2),'w-.s','MarkerSize',1, 'LineWidth', 30);%同理用白点盖住之前的点
yaoyou(2) = yaoyou(2) -5;
plot(yaoyou(1),yaoyou(2),'y-.s','MarkerSize',1, 'LineWidth', 4);
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);%由于是上下移动，线不变


% 腰右向左
function pushbutton44_Callback(hObject, eventdata, handles)
global yaoyou;
plot(yaoyou(1),yaoyou(2),'w-.s','MarkerSize',1, 'LineWidth', 30);%用白线盖住之前的线，用白点盖住之前的点
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','w','LineWidth',2);%用白线盖住之前的线，用白点盖住之前的点
yaoyou(1) = yaoyou(1) -5;%坐标移动
plot(yaoyou(1),yaoyou(2),'y-.s','MarkerSize',1, 'LineWidth', 4);%新线新点
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);%新线新点
;


% 腰右向上
function pushbutton45_Callback(hObject, eventdata, handles)

global yaoyou;
plot(yaoyou(1),yaoyou(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
yaoyou(2) = yaoyou(2) + 5;
plot(yaoyou(1),yaoyou(2),'y-.s','MarkerSize',1, 'LineWidth', 4);
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);



% 腰右向右
function pushbutton46_Callback(hObject, eventdata, handles)

global yaoyou;
plot(yaoyou(1),yaoyou(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','w','LineWidth',2);
yaoyou(1) = yaoyou(1)+ 5;
plot(yaoyou(1),yaoyou(2),'y-.s','MarkerSize',1, 'LineWidth', 4);
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);



% 腰右
function pushbutton47_Callback(hObject, eventdata, handles)
global yaoyou;
yaoyou = LabelBox();
plot(yaoyou(1),yaoyou(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
line([yaoyou(1),yaoyou(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);





% 腰右向下
function pushbutton37_Callback(hObject, eventdata, handles)

global yaozuo;
plot(yaozuo(1),yaozuo(2),'w-.s','MarkerSize',1, 'LineWidth', 30);

yaozuo(2) = yaozuo(2) -5;
plot(yaozuo(1),yaozuo(2),'y-.s','MarkerSize',1, 'LineWidth', 4);
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
global yaozuo;
%load('yaozuo.mat');

plot(yaozuo(1),yaozuo(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','w','LineWidth',2);
yaozuo(1) = yaozuo(1) -5;
plot(yaozuo(1),yaozuo(2),'y-.s','MarkerSize',1, 'LineWidth', 4);
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('yaozuo.mat', 'yaozuo');


% 腰左向上
function pushbutton39_Callback(hObject, eventdata, handles)
%load('yaozuo.mat');
global yaozuo;
plot(yaozuo(1),yaozuo(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
yaozuo(2) = yaozuo(2) + 5;
plot(yaozuo(1),yaozuo(2),'y-.s','MarkerSize',1, 'LineWidth', 4);
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);

%save('yaozuo.mat', 'yaozuo');

% 腰左向右
function pushbutton40_Callback(hObject, eventdata, handles)
global yaozuo;
plot(yaozuo(1),yaozuo(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','w','LineWidth',2);
yaozuo(1) = yaozuo(1) + 5;
plot(yaozuo(1),yaozuo(2),'y-.s','MarkerSize',1, 'LineWidth', 4);
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('yaozuo.mat', 'yaozuo');


% 腰左按钮
function pushbutton41_Callback(hObject, eventdata, handles)
global yaozuo;
yaozuo = LabelBox();
plot(yaozuo(1),yaozuo(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
line([yaozuo(1),yaozuo(1)],[0,970],'linestyle','-.','Color','y','LineWidth',2);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('yaozuo.mat', 'yaozuo');



% 耻骨上沿向下
function pushbutton31_Callback(hObject, eventdata, handles)
%load('chigushangyan.mat');
global chigushangyan;
plot(chigushangyan(1),chigushangyan(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
chigushangyan(2) = chigushangyan(2) -5;
plot(chigushangyan(1),chigushangyan(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('chigushangyan.mat', 'chigushangyan');


% 耻骨上沿向左
function pushbutton32_Callback(hObject, eventdata, handles)
%load('chigushangyan.mat');
global chigushangyan;
plot(chigushangyan(1),chigushangyan(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
chigushangyan(1) = chigushangyan(1) -5;
plot(chigushangyan(1),chigushangyan(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('chigushangyan.mat', 'chigushangyan');


% 耻骨上沿向下
function pushbutton33_Callback(hObject, eventdata, handles)
global chigushangyan;
%load('chigushangyan.mat');
plot(chigushangyan(1),chigushangyan(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
chigushangyan(2) = chigushangyan(2) + 5;
plot(chigushangyan(1),chigushangyan(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('chigushangyan.mat', 'chigushangyan');


% 耻骨上沿向右
function pushbutton34_Callback(hObject, eventdata, handles)
global chigushangyan;
%load('chigushangyan.mat');
plot(chigushangyan(1),chigushangyan(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
chigushangyan(1) = chigushangyan(1)+ 5;
plot(chigushangyan(1),chigushangyan(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('chigushangyan.mat', 'chigushangyan');


%耻骨上沿按钮
function pushbutton35_Callback(hObject, eventdata, handles)
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
global chigushangyan;
chigushangyan = LabelBox();
plot(chigushangyan(1),chigushangyan(2),'r-.s','MarkerSize',1, 'LineWidth', 8);


%save('chigushangyan.mat', 'chigushangyan');




% 参数确定按钮
function pushbutton30_Callback(hObject, eventdata, handles)
%读取之前所有参数信息
global duqi;
global chigushangyan;
global yaoyou;
global yaozuo;
global xiongjianjiehe;
%打印之前所有参数线参数点
plot(duqi(1),duqi(2),'r-.s','MarkerSize',1, 'LineWidth', 4);
plot(xiongjianjiehe(1),xiongjianjiehe(2),'r-.s','MarkerSize',1, 'LineWidth', 4);
plot(chigushangyan(1),chigushangyan(2),'r-.s','MarkerSize',1, 'LineWidth', 4);
%后台改变腰左腰右y坐标，图上不显示，方便之后的运算
yaozuo(2) = duqi(2);%y坐标设为肚脐的y坐标
yaoyou(2) = duqi(2)

%肚脐
function pushbutton29_Callback(hObject, eventdata, handles)
global duqi;
duqi = LabelBox();
plot(duqi(1),duqi(2),'r-.s','MarkerSize',1, 'LineWidth', 8);

%save('duqi.mat', 'duqi');




% 肚脐向右
function pushbutton28_Callback(hObject, eventdata, handles)
%load('duqi.mat');
global duqi;
plot(duqi(1),duqi(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
duqi(1) = duqi(1)+ 5;
plot(duqi(1),duqi(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('duqi.mat', 'duqi');



% 肚脐向上.
function pushbutton27_Callback(hObject, eventdata, handles)
%load('duqi.mat');
global duqi;
plot(duqi(1),duqi(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
duqi(2) = duqi(2) + 5;
plot(duqi(1),duqi(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('duqi.mat', 'duqi');


% 肚脐向左
function pushbutton26_Callback(hObject, eventdata, handles)
%load('duqi.mat');
global duqi;
plot(duqi(1),duqi(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
duqi(1) = duqi(1) -5;
plot(duqi(1),duqi(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('duqi.mat', 'duqi');


% 肚脐向下
function pushbutton25_Callback(hObject, eventdata, handles)
%load('duqi.mat');
global duqi;
plot(duqi(1),duqi(2),'w-.s','MarkerSize',1, 'LineWidth', 30);
duqi(2) = duqi(2) -5;
plot(duqi(1),duqi(2),'r-.s','MarkerSize',1, 'LineWidth', 8);
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);
%save('duqi.mat', 'duqi');



% 程序开始
function pushbutton49_Callback(hObject, eventdata, handles)
axes(handles.axes1);%控制axes1
global im;%同步读取背景信息
im=imread('test1.jpg')%读取背景图片
imshow(im)%将图片放到axe1上
hold on;%图片不消失
set(gca, 'Xlim', [0 1024], 'Ylim', [0 1024]);%设置北京照片尺寸
line([512,512],[0,970],'linestyle','-.','Color','y','LineWidth',2);%肚脐中线
global STB%清空诊断信息
STB = '';%清空诊断信息
set(handles.edit6,'string',STB);%清空诊断信息
cd(pwd);%工作路径设置为根目录






function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on edit3 and none of its controls.
function edit3_KeyPressFcn(hObject, eventdata, handles)
set(hObject,'string','','Enable','on');
uicontrol(hObject);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% 性别
function radiobutton1_Callback(hObject, eventdata, handles)
global xingbie;
xingbie = get(handles.radiobutton1,'string');


% 性别
function radiobutton2_Callback(hObject, eventdata, handles)
global xingbie;
xingbie = get(handles.radiobutton2,'string');



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% 保存按钮
function pushbutton50_Callback(hObject, eventdata, handles)
global xingbie;%读取性别
global STB;%读取诊断信息
length_STB = length(STB);%STB最后一位
STB(length_STB) = '';%最后一位清除，清除最后一个逗号
set(handles.edit6,'string',STB);
v1 = get(handles.edit3,'string');%读取之前写入的信息，姓名，性别，病情，诊断信息，年龄
v2 = get(handles.edit4,'string');%读取之前写入的信息，姓名，性别，病情，诊断信息，年龄
v3 = get(handles.edit5,'string');%读取之前写入的信息，姓名，性别，病情，诊断信息，年龄
v4 = get(handles.edit6,'string');%读取之前写入的信息，姓名，性别，病情，诊断信息，年龄

save('test.mat','v1');%录入test.mat
save('test.mat','v2','-append');
save('test.mat','v3','-append');
save('test.mat','v4','-append');
save('test.mat','xingbie','-append');
cd(pwd);%回到根目录
mkdir(v1);%创建病人名字的文件夹
filename=[pwd,'\',v1];%新的路径
cd(filename);%更改到新的工作路径
fid=fopen('病人资料.txt','w');%创建写入病人资料
fprintf(fid,'%s%s\r\n','姓名：',v1);%创建写入病人资料
fprintf(fid,'%s%s\r\n','年龄：',v2);%创建写入病人资料
fprintf(fid,'%s%s\r\n','性别：',xingbie);%创建写入病人资料
fprintf(fid,'%s%s\r\n','病情：',v3);%创建写入病人资料
fprintf(fid,'%s%s\r\n','穴位治疗：',v4);%创建写入病人资料
fclose (fid);
str = pwd;%回到上一级目录
index_dir=strfind(str,'\'); %回到上一级目录
str_temp=str(1:index_dir(end)-1);%回到上一级目录
cd(str_temp);%回到上一级目录


% 初始化按钮
function pushbutton51_Callback(hObject, eventdata, handles)
global STB;
STB = '';
set(handles.edit6,'string',STB)
set(handles.edit3,'string',' ');
set(handles.edit4,'string',' ');
set(handles.edit5,'string',' ');
set(handles.edit6,'string',' ');


%大横
function pushbutton54_Callback(v13, eventdata, handles)
dahengzuo = Cal(0,0,3.5,0);
plot(dahengzuo(1),dahengzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
dahengyou = Cal(0,0,0,3.5);
plot(dahengyou(1),dahengyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v13, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'大横',',']
set(handles.edit6,'string',STB)


%上风湿点
function pushbutton56_Callback(v14, eventdata, handles)
shangfengshidianzuo = Cal(1.5,0,2.5,0);
plot(shangfengshidianzuo(1),shangfengshidianzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
shangfengshidianyou = Cal(1.5,0,0,2.5);
plot(shangfengshidianyou(1),shangfengshidianyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v14, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'上风湿点',',']
set(handles.edit6,'string',STB)


% 上风湿点外点
function pushbutton57_Callback(v15, eventdata, handles)
shangfengshiwaidianzuo = Cal(1,0,3,0);
plot(shangfengshiwaidianzuo(1),shangfengshiwaidianzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
shangfengshiwaidianyou = Cal(1,0,0,3);
plot(shangfengshiwaidianyou(1),shangfengshiwaidianyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v15, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'上风湿外点',',']
set(handles.edit6,'string',STB)


% 下风湿点
function pushbutton58_Callback(v16, eventdata, handles)
xiafengshidianzuo = Cal(0,1.5,2.5,0);
plot(xiafengshidianzuo(1),xiafengshidianzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
xiafengshidianyou = Cal(0,1.5,0,2.5);
plot(xiafengshidianyou(1),xiafengshidianyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v16, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'下风湿点',',']
set(handles.edit6,'string',STB)


% 下风湿外点
function pushbutton59_Callback(v17, eventdata, handles)
xiafengshiwaidianzuo = Cal(0,2,3,0);
plot(xiafengshiwaidianzuo(1),xiafengshiwaidianzuo(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
xiafengshiwaidianyou = Cal(0,2,0,3);
plot(xiafengshiwaidianyou(1),xiafengshiwaidianyou(2), 'b-.s','MarkerSize',1, 'LineWidth', 4);
set(v17, 'BackgroundColor',[1 1 0]);
global STB
STB = [STB,'下风湿外点',',']
set(handles.edit6,'string',STB)
