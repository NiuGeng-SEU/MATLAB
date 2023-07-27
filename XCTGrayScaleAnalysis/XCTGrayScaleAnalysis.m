clc;
%Setting
fs = 20; %FontSize
lfs = 18; %LegendFontSize&AxisFontSize
fn = 'times new roman'; %Font
sz = 5; %ScatterMarkerSize
lw = 1.5;%LineWeight
%DataInput
x = 0:1:240; %DistancePixel
YArrange1 = "B2:B242"; %p0-EPS
YArrange2 = "C2:C242"; %p2-EPS
y1  = readmatrix("XCTGrayScaleAnalysis.xlsx",'Sheet','Sheet1','Range',YArrange1); %Static yield stress
y2  = readmatrix("XCTGrayScaleAnalysis.xlsx",'Sheet','Sheet1','Range',YArrange2); %Static yield stress
%FigureGene
hold on;
plot(x,y1,"LineWidth",lw);
plot(x,y2,"LineWidth",lw);
scatter(x,y1,sz,"filled","MarkerFaceColor",'#0072BD');
scatter(x,y2,sz,"filled","MarkerFaceColor",'#D95319');
%Legend
ax = gca;
ax.XLim = [0 240];% X axis limitation
ax.YLim = [20 55];% X axis limitation
h = legend('Reference','R00','Location','northwest','NumColumns',2); %Legend
legend('boxoff');
set(h,'Fontsize',lfs);
set(gca, 'FontSize', lfs);
set(gca,'xcolor',[0 0 0]);
set(gca,'ycolor',[0 0 0]);
set(gca, 'YTickLabelRotation', 0);
ylabel('Gray-scale value','FontSize',fs); %YLabel
xlabel('Distance (pixel)','FontSize',fs); %XLabel
set(gca,'FontName',fn)
box on;
hold off;
%SaveAsSvg
saveas(gcf,'/Users/niugeng/Desktop/XCTGrayScaleAnalysis','svg');