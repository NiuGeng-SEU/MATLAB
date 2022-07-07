%研究现状绘图 May17 发文量和引用量年度变化
clc

%修改参数区
XArrange = "A2:A24"; %X参数范围
PubArrange = "B2:B24"; %Pub参数范围
CitArrange = "C2:C24"; %Cit参数范围
AxisTextFontSize = 14; %轴字体大小
yleftColor = [0.33 0.55 0.93];

%导入数据
x = readmatrix("Book1.xlsx",'Sheet','Sheet1','Range',XArrange); %x轴范围
Pub = readmatrix("Book1.xlsx",'Sheet','Sheet1','Range',PubArrange); %发文量值
Cit = readmatrix("Book1.xlsx",'Sheet','Sheet1','Range',CitArrange); %引用量

%左轴
yyaxis left
b1 = bar(x,Pub);
b1.EdgeColor = yleftColor;
b1.LineWidth = 1.5;
b1.FaceAlpha = 0;
xlabel('Year','Color',[0,0,0],'FontSize',AxisTextFontSize);
ylabel('Publications','Color',[0,0,0],'FontSize',AxisTextFontSize);

%右轴
yyaxis right
plot(x,Cit,"LineWidth",2,"Marker",".","MarkerSize",12);
ylabel('Citations','Color',[0,0,0],'FontSize',AxisTextFontSize);

l1 = legend('Publications','Citations','Location','northwest');
l1.FontSize = 12;
legend("boxoff");

str = ["Search by:","Title: Concrete","Topic: recycled plastic"];
t1 = text(2000,4050,str);
t1.FontSize=12;